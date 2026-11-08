import crypto from "node:crypto";
import { execFile } from "node:child_process";
import { mkdtemp, rm, writeFile } from "node:fs/promises";
import os from "node:os";
import path from "node:path";
import { promisify } from "node:util";
import { plainAddPlaceholder } from "@signpdf/placeholder-plain";
import { SignPdf } from "@signpdf/signpdf";
import {
  Signer,
  SUBFILTER_ETSI_CADES_DETACHED,
} from "@signpdf/utils";

const execFileAsync = promisify(execFile);

export type PdfSignatureVerification = {
  available: boolean;
  integrityValid: boolean;
  certificateTrust: "TRUSTED" | "UNKNOWN_OR_UNTRUSTED" | "UNAVAILABLE";
  checkedAt: string;
  message: string;
};

class RemoteCmsSigner extends Signer {
  constructor(private readonly signDigest: (digestBase64: string) => Promise<Buffer>) {
    super();
  }

  async sign(byteRangeContent: Buffer) {
    const digestBase64 = crypto
      .createHash("sha256")
      .update(byteRangeContent)
      .digest("base64");
    return this.signDigest(digestBase64);
  }
}

export async function signPdfWithRemoteCms(input: {
  pdfBuffer: Buffer;
  doctorName: string;
  reason: string;
  signDigest: (digestBase64: string) => Promise<Buffer>;
}) {
  const placeholder = plainAddPlaceholder({
    pdfBuffer: input.pdfBuffer,
    reason: input.reason,
    contactInfo: "MedClinic",
    name: input.doctorName,
    location: "Brasil",
    signingTime: new Date(),
    signatureLength: 32_768,
    subFilter: SUBFILTER_ETSI_CADES_DETACHED,
    appName: "MedClinic",
  });
  return new SignPdf().sign(
    placeholder,
    new RemoteCmsSigner(input.signDigest),
  );
}

export async function verifyPdfSignature(
  pdfBuffer: Buffer,
): Promise<PdfSignatureVerification> {
  const checkedAt = new Date().toISOString();
  let temporaryDirectory = "";
  try {
    temporaryDirectory = await mkdtemp(
      path.join(os.tmpdir(), "medclinic-pdf-verify-"),
    );
    const pdfPath = path.join(temporaryDirectory, "document.pdf");
    await writeFile(pdfPath, pdfBuffer, { mode: 0o600 });

    let output = "";
    try {
      const result = await execFileAsync("pdfsig", [pdfPath], {
        timeout: 15_000,
        maxBuffer: 1_000_000,
        env: { ...process.env, LC_ALL: "C" },
      });
      output = `${result.stdout}\n${result.stderr}`;
    } catch (error) {
      const executionError = error as NodeJS.ErrnoException & {
        stdout?: string;
        stderr?: string;
      };
      output = `${executionError.stdout || ""}\n${executionError.stderr || ""}`;
      if (executionError.code === "ENOENT") {
        return {
          available: false,
          integrityValid: false,
          certificateTrust: "UNAVAILABLE",
          checkedAt,
          message:
            "Verificação indisponível: instale o utilitário pdfsig (pacote poppler-utils) no servidor.",
        };
      }
      if (!/Signature Validation:/i.test(output)) {
        return {
          available: false,
          integrityValid: false,
          certificateTrust: "UNAVAILABLE",
          checkedAt,
          message: "O verificador PDF não conseguiu analisar a assinatura.",
        };
      }
    }

    const signatureLine = output.match(
      /Signature Validation:\s*([^\r\n]+)/i,
    )?.[1];
    const certificateLine = output.match(
      /Certificate Validation:\s*([^\r\n]+)/i,
    )?.[1];
    if (!signatureLine) {
      return {
        available: true,
        integrityValid: false,
        certificateTrust: "UNKNOWN_OR_UNTRUSTED",
        checkedAt,
        message: "O PDF não contém uma assinatura digital verificável.",
      };
    }

    const integrityValid = /\bvalid\b/i.test(signatureLine);
    const certificateTrust = /\btrusted\b/i.test(certificateLine || "")
      ? "TRUSTED"
      : "UNKNOWN_OR_UNTRUSTED";
    return {
      available: true,
      integrityValid,
      certificateTrust,
      checkedAt,
      message: integrityValid
        ? certificateTrust === "TRUSTED"
          ? "Integridade da assinatura confirmada; a cadeia do certificado foi confiada pelo verificador local."
          : "Integridade criptográfica confirmada; a cadeia ICP-Brasil não foi declarada confiável pelo repositório local."
        : "A assinatura não passou na verificação criptográfica do PDF.",
    };
  } catch {
    return {
      available: false,
      integrityValid: false,
      certificateTrust: "UNAVAILABLE",
      checkedAt,
      message: "Não foi possível executar a verificação criptográfica do PDF.",
    };
  } finally {
    if (temporaryDirectory) {
      await rm(temporaryDirectory, { recursive: true, force: true }).catch(
        () => undefined,
      );
    }
  }
}
