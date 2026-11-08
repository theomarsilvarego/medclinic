import crypto from "node:crypto";

const DEFAULT_API_BASE_URL = "https://services.integraicp.com.br";
const CALLBACK_PATH = "/api/vidaas/callback";

export class VidassIntegrationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "VidassIntegrationError";
  }
}

export type VidassConfiguration = {
  ready: boolean;
  channelId: string;
  callbackUrl: string;
  apiBaseUrl: string;
  message: string;
};

export type VidassCredential = {
  credentialId: string;
  executionStatus?: { currentStatus?: string };
  subjectIdentification?: { identificationKey?: string; identificationType?: string };
  certificateInformation?: {
    serialNumber?: string;
    issuerName?: string;
    subjectName?: string;
    encodedX509?: string;
    fingerprint256?: string;
    validity?: { notBefore?: string; notAfter?: string };
  };
};

export type VidassCmsSignature = {
  cms: Buffer;
  requestId: string | null;
  signatureId: string | null;
  signatureTimestamp: string | null;
  certificateInformation: NonNullable<VidassCredential["certificateInformation"]>;
};

function isLocalHost(hostname: string) {
  return hostname === "localhost" || hostname === "127.0.0.1" || hostname === "::1";
}

export function getVidassConfiguration(): VidassConfiguration {
  const channelId = String(process.env.VIDAAS_CHANNEL_ID || "").trim();
  const callbackRaw = String(process.env.VIDAAS_CALLBACK_URL || "").trim();
  const apiBaseRaw = String(
    process.env.VIDAAS_API_BASE_URL || DEFAULT_API_BASE_URL,
  ).trim();
  const apiBaseUrl = apiBaseRaw.replace(/\/+$/, "");

  if (!channelId || !callbackRaw) {
    return {
      ready: false,
      channelId,
      callbackUrl: callbackRaw,
      apiBaseUrl,
      message:
        "Configure o Channel da VALID e a callback URI exata cadastrada para o VIDaaS.",
    };
  }

  try {
    const callback = new URL(callbackRaw);
    const apiBase = new URL(apiBaseUrl);
    if (
      (callback.protocol !== "https:" && !isLocalHost(callback.hostname)) ||
      callback.pathname !== CALLBACK_PATH ||
      Boolean(callback.search || callback.hash)
    ) {
      return {
        ready: false,
        channelId,
        callbackUrl: callbackRaw,
        apiBaseUrl,
        message:
          "A callback do VIDaaS deve ser HTTPS e apontar exatamente para /api/vidaas/callback, sem query string.",
      };
    }
    if (apiBase.protocol !== "https:" && !isLocalHost(apiBase.hostname)) {
      return {
        ready: false,
        channelId,
        callbackUrl: callbackRaw,
        apiBaseUrl,
        message: "A API IntegraICP deve usar HTTPS fora do ambiente local.",
      };
    }
  } catch {
    return {
      ready: false,
      channelId,
      callbackUrl: callbackRaw,
      apiBaseUrl,
      message: "A callback URI ou a URL base da IntegraICP é inválida.",
    };
  }

  return {
    ready: true,
    channelId,
    callbackUrl: callbackRaw,
    apiBaseUrl,
    message: "VIDaaS configurado.",
  };
}

function apiUrl(baseUrl: string, channelId: string, suffix: string) {
  const base = new URL(`${baseUrl}/`);
  return new URL(
    `c/${encodeURIComponent(channelId)}/icp/v3/${suffix.replace(/^\/+/, "")}`,
    base,
  );
}

function trustedClearanceUrl(value: string, apiBaseUrl: string) {
  let url: URL;
  try {
    url = new URL(value);
  } catch {
    throw new VidassIntegrationError(
      "A IntegraICP retornou uma URL de autenticação inválida.",
    );
  }
  const baseHost = new URL(apiBaseUrl).hostname;
  const approvedHost =
    url.hostname === baseHost || url.hostname.endsWith(".integraicp.com.br");
  if (url.protocol !== "https:" || !approvedHost) {
    throw new VidassIntegrationError(
      "A IntegraICP retornou uma origem de autenticação não reconhecida.",
    );
  }
  return url.toString();
}

async function readJsonResponse(response: Response) {
  const payload: any = await response.json().catch(() => null);
  if (!response.ok) {
    const code = payload?.error?.code;
    throw new VidassIntegrationError(
      `A IntegraICP recusou a solicitação (HTTP ${response.status}${code ? `, código ${String(code).slice(0, 24)}` : ""}).`,
    );
  }
  return payload?.data ?? payload;
}

export function createPkcePair() {
  const verifier = crypto.randomBytes(32).toString("base64url");
  const challenge = crypto
    .createHash("sha256")
    .update(verifier, "ascii")
    .digest("base64url");
  return { verifier, challenge };
}

export async function beginVidassAuthentication(
  configuration: VidassConfiguration,
  challenge: string,
) {
  if (!configuration.ready)
    throw new VidassIntegrationError(configuration.message);

  const url = apiUrl(
    configuration.apiBaseUrl,
    configuration.channelId,
    "authentications",
  );
  url.searchParams.set("secret_data", challenge);
  url.searchParams.set("secret_type", "code_challenge");
  url.searchParams.set("callback_uri", configuration.callbackUrl);
  url.searchParams.set("credential_lifetime", "900");
  url.searchParams.set("clearance_lifetime", "900");

  let response: Response;
  try {
    response = await fetch(url, {
      method: "GET",
      redirect: "manual",
      signal: AbortSignal.timeout(20_000),
      headers: { Accept: "application/json" },
    });
  } catch {
    throw new VidassIntegrationError(
      "Não foi possível conectar à API de autenticação da IntegraICP.",
    );
  }

  if (response.status >= 300 && response.status < 400) {
    const location = response.headers.get("location");
    if (!location)
      throw new VidassIntegrationError(
        "A IntegraICP não retornou a URL de autenticação.",
      );
    return {
      authorizationUrl: trustedClearanceUrl(location, configuration.apiBaseUrl),
      requestId: null,
    };
  }

  const data: any = await readJsonResponse(response);
  const clearances: any[] = Array.isArray(data?.clearances)
    ? data.clearances
    : [];
  const clearance = clearances.find((item) => {
    const product = String(item?.productName || "").toLocaleLowerCase("pt-BR");
    const provider = String(item?.providerName || "").toLocaleLowerCase("pt-BR");
    return product.includes("vidaas") || provider.includes("valid");
  });
  if (!clearance?.clearanceEndpoint) {
    throw new VidassIntegrationError(
      "Não há um provedor VIDaaS/VALID disponível neste Channel. Verifique a habilitação do serviço na VALID.",
    );
  }

  return {
    authorizationUrl: trustedClearanceUrl(
      String(clearance.clearanceEndpoint),
      configuration.apiBaseUrl,
    ),
    requestId: data?.requestId ? String(data.requestId) : null,
  };
}

export async function getVidassCredential(
  configuration: VidassConfiguration,
  credentialId: string,
  verifier: string,
): Promise<VidassCredential> {
  if (!configuration.ready)
    throw new VidassIntegrationError(configuration.message);
  if (!/^[A-Za-z0-9_-]{8,120}$/.test(credentialId))
    throw new VidassIntegrationError(
      "A IntegraICP retornou uma identificação de credencial inválida.",
    );

  const url = apiUrl(
    configuration.apiBaseUrl,
    configuration.channelId,
    `credentials/${encodeURIComponent(credentialId)}`,
  );
  url.searchParams.set("secret_data", verifier);
  url.searchParams.set("secret_type", "code_verifier");

  let response: Response;
  try {
    response = await fetch(url, {
      method: "GET",
      signal: AbortSignal.timeout(20_000),
      headers: { Accept: "application/json" },
    });
  } catch {
    throw new VidassIntegrationError(
      "Não foi possível consultar a credencial autorizada no VIDaaS.",
    );
  }
  const data: any = await readJsonResponse(response);
  if (!data?.certificateInformation?.encodedX509) {
    throw new VidassIntegrationError(
      "A VALID não retornou o certificado público necessário para conferir a identidade do prescritor.",
    );
  }
  return data as VidassCredential;
}

export async function requestVidassCmsSignature(input: {
  configuration: VidassConfiguration;
  credentialId: string;
  verifier: string;
  contentId: string;
  digestBase64: string;
  description: string;
}) {
  const { configuration } = input;
  if (!configuration.ready)
    throw new VidassIntegrationError(configuration.message);

  const url = apiUrl(
    configuration.apiBaseUrl,
    configuration.channelId,
    "signatures",
  );
  let response: Response;
  try {
    response = await fetch(url, {
      method: "POST",
      signal: AbortSignal.timeout(30_000),
      headers: { Accept: "application/json", "Content-Type": "application/json" },
      body: JSON.stringify({
        credentialId: input.credentialId,
        secretType: "code_verifier",
        secretData: input.verifier,
        requests: [
          {
            contentId: input.contentId,
            contentDigest: input.digestBase64,
            contentDescription: input.description,
            signaturePolicy: "CMS",
          },
        ],
      }),
    });
  } catch {
    throw new VidassIntegrationError(
      "Não foi possível enviar o resumo criptográfico ao serviço de assinatura VIDaaS.",
    );
  }

  const data: any = await readJsonResponse(response);
  const executionStatus = String(
    data?.executionStatus?.currentStatus || "",
  ).toLocaleUpperCase("en-US");
  if (executionStatus !== "COMPLETED_WITH_SUCCESS") {
    throw new VidassIntegrationError(
      "A autorização da assinatura não foi concluída no VIDaaS. Reautentique e tente novamente.",
    );
  }

  const signature = Array.isArray(data?.signatures)
    ? data.signatures.find(
        (item: any) => String(item?.contentId || "") === input.contentId,
      )
    : null;
  if (!signature?.signedContent || typeof signature.signedContent !== "string") {
    throw new VidassIntegrationError(
      "O VIDaaS não retornou o conteúdo CMS da assinatura.",
    );
  }
  const normalizeBase64 = (value: string) => value.replace(/=+$/, "");
  if (
    signature.contentDigest &&
    normalizeBase64(String(signature.contentDigest)) !==
      normalizeBase64(input.digestBase64)
  ) {
    throw new VidassIntegrationError(
      "O resumo devolvido pelo VIDaaS não corresponde ao documento enviado.",
    );
  }
  const cms = Buffer.from(signature.signedContent, "base64");
  if (cms.length < 128 || cms[0] !== 0x30) {
    throw new VidassIntegrationError(
      "O conteúdo CMS devolvido pelo VIDaaS não possui uma estrutura válida.",
    );
  }

  const certificateInformation = data?.certificateInformation;
  if (!certificateInformation?.encodedX509) {
    throw new VidassIntegrationError(
      "O resultado da assinatura VIDaaS não contém os dados do certificado.",
    );
  }

  return {
    cms,
    requestId: data?.requestId ? String(data.requestId) : null,
    signatureId: signature?.signatureId ? String(signature.signatureId) : null,
    signatureTimestamp: signature?.signatureTimestamp
      ? String(signature.signatureTimestamp)
      : null,
    certificateInformation:
      certificateInformation as VidassCmsSignature["certificateInformation"],
  } satisfies VidassCmsSignature;
}
