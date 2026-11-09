import React, { useEffect, useMemo, useRef, useState } from "react";
import {
  Eye,
  FileCheck2,
  FileText,
  Plus,
  Search,
  ShieldCheck,
  Trash2,
  X,
} from "lucide-react";
import type { Row } from "../../lib/app";
import { API, request } from "../../lib/app";
import "./MedicalDocumentsArea.css";

type Medication = {
  id: number;
  name: string;
  presentation?: string | null;
  route?: string | null;
  dose?: string | null;
  posology?: string | null;
};
type PrescriptionItem = Medication & {
  dose: string;
  route: string;
  posology: string;
};
type DocumentTab = "RECEITA" | "ATESTADO";
type SigningSessionState =
  | "NONE"
  | "AUTHORIZING"
  | "READY"
  | "SIGNING"
  | "USED"
  | "FAILED"
  | "EXPIRED";

function dateToday() {
  const now = new Date();
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
}
function datePt(value: string) {
  if (!value) return "";
  const [year, month, day] = value.split("-");
  return `${day}/${month}/${year}`;
}
function medicationRouteLabel(value?: string | null) {
  return ({ ORAL: "Oral", VAGINAL: "Vaginal", TOPICO: "Tópico" } as Record<string, string>)[
    String(value || "").toUpperCase()
  ] || value || "Via não cadastrada";
}
function attestationTemplate(
  patient: string,
  subtype: string,
  date: string,
  days: string,
  entry: string,
  exit: string,
) {
  const name = patient || "[nome do paciente]";
  const formattedDate = datePt(date) || "[data]";
  if (subtype === "COMPARECIMENTO")
    return `Atesto, para os devidos fins, que ${name} compareceu a esta clínica na data de ${formattedDate}, no período de ${entry || "[horário de entrada]"} a ${exit || "[horário de saída]"}.`;
  if (subtype === "AFASTAMENTO")
    return `Atesto que ${name} necessita de afastamento de suas atividades por ${days || "[número de dias]"} dia(s), a partir de ${formattedDate}.`;
  return `Atesto, para os devidos fins, que ${name} foi avaliada(o) nesta data (${formattedDate}) e encontra-se apta(o), conforme avaliação médica.`;
}

export function MedicalDocumentsArea({
  record,
  canIssue,
  active,
  tab,
  onChanged,
}: {
  record: Row;
  canIssue: boolean;
  active: boolean;
  tab: DocumentTab;
  onChanged: () => Promise<void>;
}) {
  const documents: Row[] = (record.clinicalDocuments || []).filter(
    (item: Row) => item.type === tab,
  );
  const patientName = String(record.patient?.fullName || "");
  const recordId = Number(record.id || 0);
  const [catalog, setCatalog] = useState<Medication[]>([]);
  const [search, setSearch] = useState("");
  const [selectedMedication, setSelectedMedication] =
    useState<Medication | null>(null);
  const [dose, setDose] = useState("");
  const [posology, setPosology] = useState("");
  const [items, setItems] = useState<PrescriptionItem[]>([]);
  const [catalogName, setCatalogName] = useState("");
  const [catalogRoute, setCatalogRoute] = useState("ORAL");
  const [catalogDose, setCatalogDose] = useState("");
  const [catalogPosology, setCatalogPosology] = useState("");
  const [showCatalogForm, setShowCatalogForm] = useState(false);
  const [subtype, setSubtype] = useState("COMPARECIMENTO");
  const [attestationDate, setAttestationDate] = useState(dateToday());
  const [daysAway, setDaysAway] = useState("1");
  const [entryTime, setEntryTime] = useState("");
  const [exitTime, setExitTime] = useState("");
  const [template, setTemplate] = useState("");
  const [templateEdited, setTemplateEdited] = useState(false);
  const [cidAuthorized, setCidAuthorized] = useState(false);
  const [cid, setCid] = useState("");
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");
  const [issueReady, setIssueReady] = useState(false);
  const [signatureProvider, setSignatureProvider] = useState<"VIDAAS" | "LOCAL_P12">("VIDAAS");
  const [signingSessionState, setSigningSessionState] = useState<SigningSessionState>("NONE");
  const [signerName, setSignerName] = useState("");
  const [startingVidass, setStartingVidass] = useState(false);
  const [signingPollKey, setSigningPollKey] = useState(0);
  const [eligibilityMessage, setEligibilityMessage] = useState(
    "Verificando certificado e validação pública…",
  );
  const searchSequence = useRef(0);

  useEffect(() => {
    if (!active || tab !== "RECEITA" || !canIssue) return;
    const sequence = ++searchSequence.current;
    request(`/medication-catalog?search=${encodeURIComponent(search)}`)
      .then((rows: Medication[]) => {
        if (sequence === searchSequence.current) setCatalog(rows || []);
      })
      .catch((cause: any) => {
        if (sequence === searchSequence.current)
          setError(cause.message || "Não foi possível carregar o catálogo.");
      });
    return () => {
      searchSequence.current += 1;
    };
  }, [active, canIssue, search, tab]);

  useEffect(() => {
    if (!active || !canIssue) return;
    if (!recordId) {
      setIssueReady(false);
      setEligibilityMessage("Salve o atendimento antes de emitir documentos.");
      return;
    }
    let mounted = true;
    setIssueReady(false);
    request(`/medical-records/${recordId}/clinical-documents/eligibility`)
      .then((result: { ready: boolean; message: string; signatureProvider?: string; signingSessionState?: SigningSessionState }) => {
        if (!mounted) return;
        setIssueReady(Boolean(result.ready));
        setSignatureProvider(result.signatureProvider === "LOCAL_P12" ? "LOCAL_P12" : "VIDAAS");
        if (result.signingSessionState)
          setSigningSessionState(result.signingSessionState);
        setEligibilityMessage(result.message || "Emissão indisponível.");
      })
      .catch((cause: any) => {
        if (!mounted) return;
        setIssueReady(false);
        setEligibilityMessage(
          cause.message || "Não foi possível verificar o certificado.",
        );
      });
    return () => {
      mounted = false;
    };
  }, [active, canIssue, recordId]);

  useEffect(() => {
    if (!active || !canIssue || !issueReady || !recordId || signatureProvider !== "VIDAAS")
      return;
    let mounted = true;
    let timer: number | undefined;
    const pollSession = async () => {
      try {
        const result = await request(
          `/medical-records/${recordId}/clinical-documents/signing-session`,
          { credentials: "include" },
        );
        if (!mounted) return;
        const state = (result.state || "NONE") as SigningSessionState;
        setSigningSessionState(state);
        setSignerName(String(result.signerName || ""));
        if (state === "AUTHORIZING" || state === "SIGNING")
          timer = window.setTimeout(() => void pollSession(), 1500);
      } catch {
        if (mounted)
          timer = window.setTimeout(() => void pollSession(), 2500);
      }
    };
    void pollSession();
    return () => {
      mounted = false;
      if (timer !== undefined) window.clearTimeout(timer);
    };
  }, [active, canIssue, issueReady, recordId, signatureProvider, signingPollKey]);

  useEffect(() => {
    if (tab !== "ATESTADO" || templateEdited) return;
    setTemplate(
      attestationTemplate(
        patientName,
        subtype,
        attestationDate,
        daysAway,
        entryTime,
        exitTime,
      ),
    );
  }, [
    patientName,
    subtype,
    attestationDate,
    daysAway,
    entryTime,
    exitTime,
    tab,
    templateEdited,
  ]);

  const suggestions = useMemo(
    () =>
      catalog.filter(
        (item) => !selectedMedication || item.id !== selectedMedication.id,
      ),
    [catalog, selectedMedication],
  );

  function clearPrescriptionFields() {
    setSelectedMedication(null);
    setDose("");
    setPosology("");
    setSearch("");
  }

  function addPrescriptionItem() {
    if (!selectedMedication) {
      setError("Selecione um medicamento do catálogo.");
      return;
    }
    const medicationDose = dose.trim();
    const medicationRoute = selectedMedication.route;
    const medicationPosology = posology.trim();
    if (!medicationDose || !medicationRoute || !medicationPosology) {
      setError(!medicationRoute
        ? "O medicamento não possui via cadastrada. Solicite ao Administrador que atualize o catálogo."
        : "Preencha dose e posologia antes de adicionar o item à receita.");
      return;
    }
    setItems((current) => [
      ...current,
      {
        ...selectedMedication,
        dose: medicationDose,
        route: medicationRoute,
        posology: medicationPosology,
      },
    ]);
    setError("");
    clearPrescriptionFields();
  }

  async function addCatalogItem() {
    if (catalogName.trim().length < 2 || !catalogDose.trim() || !catalogPosology.trim()) {
      setError("Informe nome do medicamento, dose e posologia.");
      return;
    }
    try {
      const item = await request("/medication-catalog", {
        method: "POST",
        body: JSON.stringify({
          name: catalogName,
          route: catalogRoute,
          dose: catalogDose,
          posology: catalogPosology,
        }),
      });
      setCatalog((current) => [item, ...current]);
      setSelectedMedication(item);
      setDose(item.dose || "");
      setPosology(item.posology || "");
      setCatalogName("");
      setCatalogRoute("ORAL");
      setCatalogDose("");
      setCatalogPosology("");
      setShowCatalogForm(false);
      setMessage(
        "Medicamento adicionado ao catálogo local. Confira a classificação regulatória antes de prescrever.",
      );
    } catch (cause: any) {
      setError(cause.message || "Não foi possível cadastrar o medicamento.");
    }
  }

  async function authenticateVidass() {
    if (!recordId) {
      setError("Salve o atendimento antes de autenticar o certificado.");
      return;
    }
    const popup = window.open("about:blank", "_blank", "popup,width=520,height=760");
    if (!popup) {
      setError("Permita a abertura de pop-ups para autenticar o VIDaaS.");
      return;
    }
    setStartingVidass(true);
    setError("");
    setMessage("Aguardando autenticação segura no VIDaaS…");
    try {
      const result = await request(
        `/medical-records/${recordId}/clinical-documents/signing-session`,
        { method: "POST", credentials: "include" },
      );
      const authorizationUrl = new URL(String(result.authorizationUrl || ""));
      if (
        authorizationUrl.protocol !== "https:" ||
        !(authorizationUrl.hostname === "integraicp.com.br" || authorizationUrl.hostname.endsWith(".integraicp.com.br"))
      )
        throw new Error("A URL de autenticação retornada não é confiável.");
      popup.location.assign(authorizationUrl.toString());
      popup.focus();
      setSigningSessionState("AUTHORIZING");
      setSigningPollKey((value) => value + 1);
    } catch (cause: any) {
      popup.close();
      setSigningSessionState("FAILED");
      setError(cause.message || "Não foi possível iniciar a autenticação VIDaaS.");
      setSigningPollKey((value) => value + 1);
    } finally {
      setStartingVidass(false);
    }
  }

  async function issueDocument(event: React.FormEvent) {
    event.preventDefault();
    if (!recordId) {
      setError("Salve o atendimento antes de emitir um documento.");
      return;
    }
    if (!issueReady) {
      setError(eligibilityMessage);
      return;
    }
    if (
      signatureProvider === "VIDAAS" &&
      signingSessionState !== "READY"
    ) {
      setError("Autentique o certificado VIDaaS da médica antes de emitir.");
      return;
    }
    if (tab === "RECEITA" && !items.length) {
      setError("Adicione ao menos um medicamento à receita.");
      return;
    }
    if (tab === "ATESTADO" && !template.trim()) {
      setError("Preencha o texto do atestado.");
      return;
    }
    setSaving(true);
    setError("");
    setMessage("");
    try {
      const body =
        tab === "RECEITA"
          ? {
              type: "RECEITA",
              items: items.map(({ id, dose: itemDose, posology: itemPosology }) => ({
                medicationId: id,
                dose: itemDose,
                posology: itemPosology,
              })),
            }
          : {
              type: "ATESTADO",
              subtype,
              date: attestationDate,
              daysAway: subtype === "AFASTAMENTO" ? Number(daysAway) : null,
              entryTime,
              exitTime,
              template,
              cidAuthorized,
              cid,
            };
      await request(`/medical-records/${recordId}/clinical-documents`, {
        method: "POST",
        body: JSON.stringify(body),
      });
      if (signatureProvider === "VIDAAS") {
        setSigningSessionState("USED");
        setSigningPollKey((value) => value + 1);
      }
      setItems([]);
      setCid("");
      setCidAuthorized(false);
      setMessage(
        "Documento emitido, assinado e registrado no histórico. O conteúdo não pode ser editado; para corrigir, cancele e emita outro.",
      );
      await onChanged();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível emitir o documento.");
      if (signatureProvider === "VIDAAS")
        setSigningPollKey((value) => value + 1);
    } finally {
      setSaving(false);
    }
  }

  async function openPdf(documentId: number) {
    setError("");
    try {
      const response = await fetch(
        `${API}/clinical-documents/${documentId}/pdf`,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("medclinic_token") || ""}`,
          },
        },
      );
      if (!response.ok) {
        const payload = await response.json().catch(() => ({}));
        throw new Error(payload.message || "Não foi possível abrir o PDF.");
      }
      const url = URL.createObjectURL(await response.blob());
      window.open(url, "_blank", "noopener,noreferrer");
      window.setTimeout(() => URL.revokeObjectURL(url), 60_000);
    } catch (cause: any) {
      setError(cause.message || "Não foi possível abrir o PDF.");
    }
  }

  async function cancelDocument(documentId: number) {
    const reason = window.prompt(
      "Informe o motivo do cancelamento (o documento original permanecerá no histórico):",
    );
    if (!reason?.trim()) return;
    try {
      await request(`/clinical-documents/${documentId}/cancel`, {
        method: "PATCH",
        body: JSON.stringify({ reason }),
      });
      setMessage(
        "Documento cancelado. O registro original e o motivo permanecem no histórico.",
      );
      await onChanged();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível cancelar o documento.");
    }
  }

  return (
    <section className="medical-documents-area">
      {error && (
        <div className="error medical-document-message" role="alert">
          {error}
        </div>
      )}
      {message && (
        <div className="success medical-document-message" role="status">
          {message}
        </div>
      )}
      {canIssue && active && !issueReady && (
        <div className="medical-document-readiness" role="status">
          <ShieldCheck size={15} />
          <span>{eligibilityMessage}</span>
        </div>
      )}
      {canIssue && active && issueReady && signatureProvider === "LOCAL_P12" && (
        <div className="medical-signature-card" role="status">
          <div className="medical-signature-icon" aria-hidden="true">
            <ShieldCheck size={20} />
          </div>
          <div className="medical-signature-copy">
            <strong>Assinatura digital · certificado local</strong>
            <span>{eligibilityMessage}</span>
          </div>
        </div>
      )}
      {canIssue && active && issueReady && signatureProvider === "VIDAAS" && (
        <div className="medical-signature-card" role="status">
          <div className="medical-signature-icon" aria-hidden="true">
            <ShieldCheck size={20} />
          </div>
          <div className="medical-signature-copy">
            <strong>Assinatura digital · VIDaaS</strong>
            <span>
              {signingSessionState === "READY"
                ? `Certificado autorizado${signerName ? `: ${signerName}` : ""}. Pronto para assinar.`
                : signingSessionState === "AUTHORIZING"
                  ? "Aguardando sua confirmação na janela segura da VALID…"
                  : signingSessionState === "SIGNING"
                    ? "Assinatura em andamento. Aguarde a validação do PDF…"
                    : signingSessionState === "FAILED"
                      ? "A autenticação não foi concluída. Você pode tentar novamente."
                      : signingSessionState === "EXPIRED"
                        ? "A autorização expirou. Autentique o certificado novamente."
                        : signingSessionState === "USED"
                          ? "A autorização anterior foi consumida. Autentique novamente para emitir outro documento."
                          : "Autentique o certificado ICP-Brasil da médica antes de emitir."}
            </span>
          </div>
          {signingSessionState === "READY" ? (
            <span className="medical-signature-ready">Autorizado</span>
          ) : (
            <button
              type="button"
              className="secondary medical-signature-action"
              onClick={authenticateVidass}
              disabled={
                startingVidass ||
                signingSessionState === "AUTHORIZING" ||
                signingSessionState === "SIGNING"
              }
            >
              {startingVidass || signingSessionState === "AUTHORIZING" || signingSessionState === "SIGNING"
                ? "Aguardando…"
                : signingSessionState === "NONE"
                  ? "Autenticar certificado"
                  : "Autenticar novamente"}
            </button>
          )}
        </div>
      )}

      {canIssue &&
        active &&
        (tab === "RECEITA" ? (
          <form className="medical-document-form" onSubmit={issueDocument}>
            <label className="medical-document-search">
              <input
                value={search}
                onChange={(event) => setSearch(event.target.value)}
                placeholder="Buscar medicamento no catálogo local…"
              />
            </label>
            {search.trim() && suggestions.length > 0 && (
              <div className="medical-document-suggestions">
                {suggestions.map((item) => (
                  <button
                  type="button"
                  key={item.id}
                  onClick={() => {
                    setSelectedMedication(item);
                    setDose(item.dose || "");
                    setPosology(item.posology || "");
                    setSearch(item.name);
                  }}
                  >
                    <strong>{item.name}</strong>
                    <span>{medicationRouteLabel(item.route)} · {item.dose || "Dose não cadastrada"} · {item.posology || "Posologia não cadastrada"}</span>
                  </button>
                ))}
              </div>
            )}
            {selectedMedication && (
              <div className="medical-document-selected">
                <strong>{selectedMedication.name}</strong>
                <span>Via: {medicationRouteLabel(selectedMedication.route)}</span>
                <button
                  type="button"
                  aria-label="Remover medicamento selecionado"
                  onClick={clearPrescriptionFields}
                >
                  <X size={15} />
                </button>
              </div>
            )}
            {selectedMedication && (
              <div className="medical-document-form-grid">
                <label>
                  Dose
                  <input
                    value={dose}
                    onChange={(event) => setDose(event.target.value)}
                    maxLength={100}
                    required
                  />
                </label>
                <label className="medical-document-wide">
                  Posologia
                  <input
                    value={posology}
                    onChange={(event) => setPosology(event.target.value)}
                    maxLength={300}
                    required
                  />
                </label>
                <small className="medical-document-wide">Dose e posologia podem ser ajustadas antes de adicionar. Depois disso, ficam somente para leitura.</small>
              </div>
            )}
            {showCatalogForm ? (
              <div className="medical-catalog-create">
                <div className="medical-document-form-grid">
                  <label>
                    Nome do medicamento
                    <input
                      value={catalogName}
                      onChange={(event) => setCatalogName(event.target.value)}
                      maxLength={180}
                    />
                  </label>
                  <label>
                    Via
                    <select value={catalogRoute} onChange={(event) => setCatalogRoute(event.target.value)}>
                      <option value="ORAL">Oral</option>
                      <option value="VAGINAL">Vaginal</option>
                      <option value="TOPICO">Tópico</option>
                    </select>
                  </label>
                  <label>
                    Dose
                    <input value={catalogDose} onChange={(event) => setCatalogDose(event.target.value)} maxLength={100} />
                  </label>
                  <label className="medical-document-wide">
                    Posologia
                    <input value={catalogPosology} onChange={(event) => setCatalogPosology(event.target.value)} maxLength={300} />
                  </label>
                </div>
                <div className="medical-document-inline-actions">
                  <button
                    type="button"
                    className="secondary"
                    onClick={() => setShowCatalogForm(false)}
                  >
                    Cancelar
                  </button>
                  <button
                    type="button"
                    className="primary"
                    onClick={() => void addCatalogItem()}
                  >
                    Adicionar ao catálogo
                  </button>
                </div>
                <small>
                  Cadastre somente itens confirmados pela médica e não sujeitos a controle especial.
                </small>
              </div>
            ) : (
              <button
                type="button"
                className="medical-catalog-add"
                onClick={() => setShowCatalogForm(true)}
              >
                <Plus size={15} /> Cadastrar medicamento no catálogo local
              </button>
            )}
            {selectedMedication && (
              <div className="medical-document-inline-actions">
                <button
                  type="button"
                  className="secondary"
                  onClick={addPrescriptionItem}
                >
                  <Plus size={15} /> Adicionar item
                </button>
              </div>
            )}
            {items.length > 0 && (
              <div className="medical-prescription-chips">
                {items.map((item, index) => (
                  <article
                    className="medical-prescription-chip"
                    key={`${item.id}-${index}`}
                  >
                    <div>
                      <strong>{item.name}{item.presentation ? ` · ${item.presentation}` : ""}</strong>
                      <small>Dose: {item.dose} · Via: {medicationRouteLabel(item.route)}</small>
                      <small>Posologia: {item.posology}</small>
                    </div>
                    <button
                      type="button"
                      aria-label={`Remover ${item.name}`}
                      onClick={() =>
                        setItems((current) =>
                          current.filter((_, itemIndex) => itemIndex !== index),
                        )
                      }
                    >
                      <X size={15} />
                    </button>
                  </article>
                ))}
              </div>
            )}
            <button
              type="submit"
              className="primary medical-document-issue"
              disabled={saving || !issueReady || items.length === 0 || (signatureProvider === "VIDAAS" && signingSessionState !== "READY")}
            >
              {saving ? "Assinando e emitindo…" : "Emitir receita"}
            </button>
          </form>
        ) : (
          <form className="medical-document-form" onSubmit={issueDocument}>
            <div className="medical-document-form-grid">
              <label>
                Tipo de documento
                <select
                  value={subtype}
                  onChange={(event) => {
                    setSubtype(event.target.value);
                    setTemplateEdited(false);
                  }}
                >
                  <option value="COMPARECIMENTO">Comparecimento</option>
                  <option value="AFASTAMENTO">Afastamento</option>
                  <option value="APTIDAO">Aptidão</option>
                </select>
              </label>
              <label>
                Data
                <input
                  type="date"
                  value={attestationDate}
                  onChange={(event) => {
                    setAttestationDate(event.target.value);
                    setTemplateEdited(false);
                  }}
                  required
                />
              </label>
              {subtype === "AFASTAMENTO" && (
                <label>
                  Dias de afastamento
                  <input
                    type="number"
                    min="1"
                    max="365"
                    value={daysAway}
                    onChange={(event) => {
                      setDaysAway(event.target.value);
                      setTemplateEdited(false);
                    }}
                    required
                  />
                </label>
              )}
              {subtype === "COMPARECIMENTO" && (
                <>
                  <label>
                    Horário de entrada
                    <input
                      type="time"
                      value={entryTime}
                      onChange={(event) => {
                        setEntryTime(event.target.value);
                        setTemplateEdited(false);
                      }}
                      required
                    />
                  </label>
                  <label>
                    Horário de saída
                    <input
                      type="time"
                      value={exitTime}
                      onChange={(event) => {
                        setExitTime(event.target.value);
                        setTemplateEdited(false);
                      }}
                      required
                    />
                  </label>
                </>
              )}
              <label className="medical-document-wide">
                Texto-modelo editável
                <textarea
                  value={template}
                  onChange={(event) => {
                    setTemplate(event.target.value);
                    setTemplateEdited(true);
                  }}
                  rows={5}
                  required
                  minLength={10}
                  maxLength={3000}
                />
              </label>
            </div>
            <label className="medical-cid-consent">
              <input
                type="checkbox"
                checked={cidAuthorized}
                onChange={(event) => {
                  setCidAuthorized(event.target.checked);
                  if (!event.target.checked) setCid("");
                }}
              />
              <span>
                Marque apenas após obter a autorização expressa do paciente para
                incluir o CID neste documento.
              </span>
            </label>
            {cidAuthorized && (
              <label>
                CID (opcional)
                <input
                  value={cid}
                  onChange={(event) => setCid(event.target.value)}
                  placeholder="Ex.: código CID-10"
                  maxLength={20}
                />
              </label>
            )}
            <button
              type="submit"
              className="primary medical-document-issue"
              disabled={saving || !issueReady || (signatureProvider === "VIDAAS" && signingSessionState !== "READY")}
            >
              {saving ? "Assinando e emitindo…" : "Emitir atestado"}
            </button>
          </form>
        ))}

      <div className="medical-documents-history">
        <h4>Histórico {tab === "RECEITA" ? "de receitas" : "de atestados"}</h4>
        {documents.length === 0 ? (
          <p className="clinical-empty-state">
            Nenhum documento emitido neste atendimento.
          </p>
        ) : (
          documents.map((document) => (
            <article
              className={`medical-document-history-card ${document.status === "CANCELADO" ? "cancelled" : ""}`}
              key={document.id}
            >
              <div className="medical-document-history-main">
                <strong>
                  {document.documentNumber ||
                    (tab === "RECEITA" ? "Receita" : "Atestado")}
                </strong>
                {/* <span>
                  {document.subtype === "NAO_CONTROLADA"
                    ? "Receita não controlada"
                    : document.subtype}
                </span> */}
                <small>
                  Emitido em{" "}
                  {new Date(document.issuedAt).toLocaleString("pt-BR")} por{" "}
                  {document.issuedBy?.fullName || "Médico"} · CRM{" "}
                  {document.doctor?.crm || "—"}
                </small>
                {document.status === "CANCELADO" && (
                  <small>
                    Cancelado em{" "}
                    {new Date(document.cancelledAt).toLocaleString("pt-BR")} por{" "}
                    {document.cancelledBy?.fullName || "Médico"}. Motivo:{" "}
                    {document.cancellationReason}
                  </small>
                )}
              </div>
              <span
                className={`medical-document-status ${document.status === "CANCELADO" ? "cancelled" : ""}`}
              >
                {document.status === "CANCELADO" ? "Cancelado" : "Emitido"}
              </span>
              <div className="medical-document-history-actions">
                <button
                  type="button"
                  className="secondary"
                  onClick={() => void openPdf(Number(document.id))}
                  aria-label="Abrir PDF"
                  title="Abrir PDF"
                >
                  <Eye size={16} />
                </button>
                {canIssue && document.status === "EMITIDO" && (
                  <button
                    type="button"
                    className="medical-document-cancel"
                    onClick={() => void cancelDocument(Number(document.id))}
                    aria-label="Cancelar documento"
                    title="Cancelar documento"
                  >
                    <Trash2 size={16} />
                  </button>
                )}
              </div>
            </article>
          ))
        )}
      </div>
    </section>
  );
}
