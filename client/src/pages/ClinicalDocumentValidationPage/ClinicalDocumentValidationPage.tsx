import React, { useCallback, useEffect, useState } from "react";
import { CircleAlert, CircleCheck, ExternalLink, FileCheck2, LoaderCircle, RefreshCw, ShieldCheck } from "lucide-react";
import { API } from "../../lib/app";
import "./ClinicalDocumentValidationPage.css";

type Verification = {
  registered?: boolean;
  valid?: boolean;
  number?: string | null;
  type?: string;
  subtype?: string;
  status?: string;
  issuedAt?: string;
  doctor?: string;
  crm?: string | null;
  signatureProvider?: string;
  signatureVerification?: {
    integrityValid?: boolean;
    certificateTrust?: "TRUSTED" | "UNKNOWN_OR_UNTRUSTED" | "UNAVAILABLE";
    checkedAt?: string | null;
    message?: string;
  };
  officialValidationUrl?: string;
  message?: string;
};

function formatDate(value?: string) {
  if (!value) return "Não informada";
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? "Não informada" : date.toLocaleString("pt-BR");
}

export function ClinicalDocumentValidationPage({ code }: { code: string }) {
  const [result, setResult] = useState<Verification | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const load = useCallback(async () => {
    setLoading(true);
    setError("");
    try {
      const response = await fetch(
        `${API}/public/clinical-documents/verify/${encodeURIComponent(code)}`,
        { headers: { Accept: "application/json" } },
      );
      const data = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(data.message || "Não foi possível consultar este código de validação.");
      setResult(data);
    } catch (cause: any) {
      setError(cause.message || "Não foi possível conectar ao serviço de validação.");
      setResult(null);
    } finally {
      setLoading(false);
    }
  }, [code]);

  useEffect(() => { void load(); }, [load]);

  const signature = result?.signatureVerification;
  const integrityValid = result?.status === "EMITIDO" && signature?.integrityValid === true;
  const certificateTrusted = signature?.certificateTrust === "TRUSTED";
  const cancelled = result?.status === "CANCELADO";

  return (
    <main className="document-validation-page">
      <header className="document-validation-brand">
        <span className="document-validation-mark"><FileCheck2 size={22} /></span>
        <span><strong>MedClinic</strong><small>INTIMAVIE · VALIDAÇÃO DE DOCUMENTOS</small></span>
      </header>
      <section className="document-validation-card" aria-live="polite">
        {loading ? (
          <div className="document-validation-state">
            <LoaderCircle className="document-validation-spinner" size={34} />
            <h1>Verificando documento</h1>
            <p>Consultando o registro e a assinatura digital.</p>
          </div>
        ) : error ? (
          <div className="document-validation-state">
            <span className="document-validation-status invalid"><CircleAlert size={25} /></span>
            <h1>Validação indisponível</h1>
            <p>{error}</p>
            <button type="button" onClick={() => void load()}><RefreshCw size={16} /> Tentar novamente</button>
          </div>
        ) : result ? (
          <>
            <div className={`document-validation-status ${integrityValid && !cancelled ? "valid" : "invalid"}`}>
              {integrityValid && !cancelled ? <CircleCheck size={27} /> : <CircleAlert size={27} />}
            </div>
            <p className="document-validation-eyebrow">RESULTADO DA CONSULTA</p>
            <h1>{cancelled ? "Documento cancelado" : integrityValid ? "Documento localizado e íntegro" : "Documento não validado"}</h1>
            <p className="document-validation-message">{result.message || "Não foi possível confirmar este documento."}</p>

            <dl className="document-validation-details">
              <div><dt>Documento</dt><dd>{result.number || "Sem número"}</dd></div>
              <div><dt>Tipo</dt><dd>{result.type === "RECEITA" ? "Receita não controlada" : result.type === "ATESTADO" ? "Atestado" : result.type || "—"}</dd></div>
              <div><dt>Profissional</dt><dd>{result.doctor || "—"}{result.crm ? ` · CRM ${result.crm}` : ""}</dd></div>
              <div><dt>Emitido em</dt><dd>{formatDate(result.issuedAt)}</dd></div>
              <div><dt>Situação</dt><dd>{cancelled ? "Cancelado" : result.status === "EMITIDO" ? "Emitido" : "Pendente"}</dd></div>
            </dl>

            <div className={`document-validation-check ${integrityValid ? "check-ok" : "check-fail"}`}>
              <ShieldCheck size={19} />
              <div><strong>Integridade criptográfica do PDF</strong><span>{signature?.message || "Não foi possível verificar a assinatura do arquivo."}</span></div>
            </div>
            <div className="document-validation-note">
              <strong>Confiança da cadeia de certificação</strong>
              <span>{certificateTrusted
                ? "O verificador deste servidor reconheceu como confiável a cadeia apresentada. Para uma validação oficial ICP-Brasil, consulte também o serviço VALIDAR do ITI."
                : "A integridade do PDF não comprova, por si só, a confiança da cadeia ICP-Brasil. Confirme o arquivo assinado no serviço oficial VALIDAR do ITI."}</span>
            </div>
            <a className="document-validation-official" href={result.officialValidationUrl || "https://validar.iti.gov.br/"} target="_blank" rel="noreferrer">
              Validar no serviço oficial do ITI <ExternalLink size={16} />
            </a>
            <p className="document-validation-code">Código consultado: <code>{code.toUpperCase()}</code></p>
          </>
        ) : null}
      </section>
      <footer className="document-validation-footer">Esta consulta confirma o registro do documento e o resultado da verificação criptográfica disponível no MedClinic.</footer>
    </main>
  );
}
