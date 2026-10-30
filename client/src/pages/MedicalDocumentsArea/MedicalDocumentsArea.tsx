import React, { useEffect, useMemo, useRef, useState } from "react";
import { FileCheck2, FileText, Plus, Search, ShieldCheck, Trash2, X } from "lucide-react";
import type { Row } from "../../lib/app";
import { API, request } from "../../lib/app";
import "./MedicalDocumentsArea.css";

type Medication = { id: number; name: string; presentation: string };
type PrescriptionItem = Medication & {
  dose: string;
  route: string;
  posology: string;
  duration: string;
  quantity: string;
};
type DocumentTab = "RECEITA" | "ATESTADO";

function dateToday() {
  const now = new Date();
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
}
function datePt(value: string) {
  if (!value) return "";
  const [year, month, day] = value.split("-");
  return `${day}/${month}/${year}`;
}
function attestationTemplate(patient: string, subtype: string, date: string, days: string, entry: string, exit: string) {
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
  const documents: Row[] = (record.clinicalDocuments || []).filter((item: Row) => item.type === tab);
  const patientName = String(record.patient?.fullName || "");
  const recordId = Number(record.id || 0);
  const [catalog, setCatalog] = useState<Medication[]>([]);
  const [search, setSearch] = useState("");
  const [selectedMedication, setSelectedMedication] = useState<Medication | null>(null);
  const [dose, setDose] = useState("");
  const [route, setRoute] = useState("");
  const [posology, setPosology] = useState("");
  const [duration, setDuration] = useState("");
  const [quantity, setQuantity] = useState("");
  const [items, setItems] = useState<PrescriptionItem[]>([]);
  const [instructions, setInstructions] = useState("");
  const [catalogName, setCatalogName] = useState("");
  const [catalogPresentation, setCatalogPresentation] = useState("");
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
  const [eligibilityMessage, setEligibilityMessage] = useState("Verificando certificado e validação pública…");
  const searchSequence = useRef(0);

  useEffect(() => {
    if (!active || tab !== "RECEITA" || !canIssue) return;
    const sequence = ++searchSequence.current;
    request(`/medication-catalog?search=${encodeURIComponent(search)}`)
      .then((rows: Medication[]) => { if (sequence === searchSequence.current) setCatalog(rows || []); })
      .catch((cause: any) => { if (sequence === searchSequence.current) setError(cause.message || "Não foi possível carregar o catálogo."); });
    return () => { searchSequence.current += 1; };
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
      .then((result: { ready: boolean; message: string }) => {
        if (!mounted) return;
        setIssueReady(Boolean(result.ready));
        setEligibilityMessage(result.message || "Emissão indisponível.");
      })
      .catch((cause: any) => {
        if (!mounted) return;
        setIssueReady(false);
        setEligibilityMessage(cause.message || "Não foi possível verificar o certificado.");
      });
    return () => { mounted = false; };
  }, [active, canIssue, recordId]);

  useEffect(() => {
    if (tab !== "ATESTADO" || templateEdited) return;
    setTemplate(attestationTemplate(patientName, subtype, attestationDate, daysAway, entryTime, exitTime));
  }, [patientName, subtype, attestationDate, daysAway, entryTime, exitTime, tab, templateEdited]);

  const suggestions = useMemo(() => catalog.filter((item) => !selectedMedication || item.id !== selectedMedication.id), [catalog, selectedMedication]);

  function clearPrescriptionFields() {
    setSelectedMedication(null);
    setDose(""); setRoute(""); setPosology(""); setDuration(""); setQuantity(""); setSearch("");
  }

  function addPrescriptionItem() {
    if (!selectedMedication || !dose.trim() || !route.trim() || !posology.trim() || !duration.trim() || !quantity.trim()) {
      setError("Selecione um medicamento e preencha dose, via, posologia, duração e quantidade.");
      return;
    }
    setItems((current) => [...current, { ...selectedMedication, dose: dose.trim(), route: route.trim(), posology: posology.trim(), duration: duration.trim(), quantity: quantity.trim() }]);
    setError("");
    clearPrescriptionFields();
  }

  async function addCatalogItem() {
    if (catalogName.trim().length < 2 || catalogPresentation.trim().length < 2) {
      setError("Informe o nome do medicamento e sua apresentação.");
      return;
    }
    try {
      const item = await request("/medication-catalog", {
        method: "POST",
        body: JSON.stringify({ name: catalogName, presentation: catalogPresentation }),
      });
      setCatalog((current) => [item, ...current]);
      setSelectedMedication(item);
      setCatalogName(""); setCatalogPresentation(""); setShowCatalogForm(false);
      setMessage("Medicamento adicionado ao catálogo local. Confira a classificação regulatória antes de prescrever.");
    } catch (cause: any) {
      setError(cause.message || "Não foi possível cadastrar o medicamento.");
    }
  }

  async function issueDocument(event: React.FormEvent) {
    event.preventDefault();
    if (!recordId) { setError("Salve o atendimento antes de emitir um documento."); return; }
    if (!issueReady) { setError(eligibilityMessage); return; }
    if (tab === "RECEITA" && !items.length) { setError("Adicione ao menos um medicamento à receita."); return; }
    if (tab === "ATESTADO" && !template.trim()) { setError("Preencha o texto do atestado."); return; }
    setSaving(true); setError(""); setMessage("");
    try {
      const body = tab === "RECEITA"
        ? { type: "RECEITA", items: items.map(({ id, dose: itemDose, route: itemRoute, posology: itemPosology, duration: itemDuration, quantity: itemQuantity }) => ({ medicationId: id, dose: itemDose, route: itemRoute, posology: itemPosology, duration: itemDuration, quantity: itemQuantity })), instructions }
        : { type: "ATESTADO", subtype, date: attestationDate, daysAway: subtype === "AFASTAMENTO" ? Number(daysAway) : null, entryTime, exitTime, template, cidAuthorized, cid };
      await request(`/medical-records/${recordId}/clinical-documents`, { method: "POST", body: JSON.stringify(body) });
      setItems([]); setInstructions(""); setCid(""); setCidAuthorized(false); setMessage("Documento emitido, assinado e registrado no histórico. O conteúdo não pode ser editado; para corrigir, cancele e emita outro.");
      await onChanged();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível emitir o documento.");
    } finally {
      setSaving(false);
    }
  }

  async function openPdf(documentId: number) {
    setError("");
    try {
      const response = await fetch(`${API}/clinical-documents/${documentId}/pdf`, {
        headers: { Authorization: `Bearer ${localStorage.getItem("medclinic_token") || ""}` },
      });
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
    const reason = window.prompt("Informe o motivo do cancelamento (o documento original permanecerá no histórico):");
    if (!reason?.trim()) return;
    try {
      await request(`/clinical-documents/${documentId}/cancel`, { method: "PATCH", body: JSON.stringify({ reason }) });
      setMessage("Documento cancelado. O registro original e o motivo permanecem no histórico.");
      await onChanged();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível cancelar o documento.");
    }
  }

  return (
    <section className="medical-documents-area">
      <header className="medical-documents-heading">
        {tab === "RECEITA" ? <FileText size={18} /> : <FileCheck2 size={18} />}
        <div><h3>{tab === "RECEITA" ? "Receitas" : "Atestados"}</h3><p>Documentos assinados digitalmente, com código de validação e histórico de auditoria.</p></div>
      </header>
      {error && <div className="error medical-document-message" role="alert">{error}</div>}
      {message && <div className="success medical-document-message" role="status">{message}</div>}
      {canIssue && active && !issueReady && <div className="medical-document-readiness" role="status"><ShieldCheck size={15} /><span>{eligibilityMessage}</span></div>}

      {canIssue && active && (tab === "RECEITA" ? (
        <form className="medical-document-form" onSubmit={issueDocument}>
          <div className="medical-document-safety-note"><ShieldCheck size={16} /><span>Esta versão aceita somente medicamentos não controlados. Receitas sujeitas a controle/retensão exigem integração regulatória própria e não podem ser emitidas aqui.</span></div>
          <label className="medical-document-search"><Search size={16} /><input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Buscar medicamento no catálogo local…" /></label>
          {search.trim() && suggestions.length > 0 && <div className="medical-document-suggestions">{suggestions.map((item) => <button type="button" key={item.id} onClick={() => { setSelectedMedication(item); setSearch(item.name); }}><strong>{item.name}</strong><span>{item.presentation}</span></button>)}</div>}
          {selectedMedication && <div className="medical-document-selected"><strong>{selectedMedication.name}</strong><span>{selectedMedication.presentation}</span><button type="button" aria-label="Remover medicamento selecionado" onClick={clearPrescriptionFields}><X size={15} /></button></div>}
          {showCatalogForm ? (
            <div className="medical-catalog-create"><div className="medical-document-form-grid"><label>Nome do medicamento<input value={catalogName} onChange={(event) => setCatalogName(event.target.value)} maxLength={180} /></label><label>Apresentação<input value={catalogPresentation} onChange={(event) => setCatalogPresentation(event.target.value)} placeholder="Ex.: comprimido 500 mg" maxLength={180} /></label></div><div className="medical-document-inline-actions"><button type="button" className="secondary" onClick={() => setShowCatalogForm(false)}>Cancelar</button><button type="button" className="primary" onClick={() => void addCatalogItem()}>Adicionar ao catálogo</button></div><small>Cadastre somente itens confirmados pela médica e não sujeitos a controle especial.</small></div>
          ) : <button type="button" className="medical-catalog-add" onClick={() => setShowCatalogForm(true)}><Plus size={15} /> Cadastrar medicamento no catálogo local</button>}
          {selectedMedication && <div className="medical-document-form-grid prescription-fields">
            <label>Dose<input value={dose} onChange={(event) => setDose(event.target.value)} placeholder="Ex.: 1 comprimido" required /></label>
            <label>Via<input value={route} onChange={(event) => setRoute(event.target.value)} placeholder="Ex.: oral" required /></label>
            <label className="medical-document-wide">Posologia<input value={posology} onChange={(event) => setPosology(event.target.value)} placeholder="Ex.: a cada 12 horas" required /></label>
            <label>Duração<input value={duration} onChange={(event) => setDuration(event.target.value)} placeholder="Ex.: 7 dias" required /></label>
            <label>Quantidade<input value={quantity} onChange={(event) => setQuantity(event.target.value)} placeholder="Ex.: 14 comprimidos" required /></label>
            <button type="button" className="secondary medical-document-wide" onClick={addPrescriptionItem}><Plus size={15} /> Adicionar item</button>
          </div>}
          {items.length > 0 && <div className="medical-prescription-chips">{items.map((item, index) => <article className="medical-prescription-chip" key={`${item.id}-${index}`}><div><strong>{item.name} · {item.presentation}</strong><small>{item.dose} · {item.route} · {item.posology} · {item.duration} · {item.quantity}</small></div><button type="button" aria-label={`Remover ${item.name}`} onClick={() => setItems((current) => current.filter((_, itemIndex) => itemIndex !== index))}><X size={15} /></button></article>)}</div>}
          <label className="medical-document-label">Orientações adicionais (opcional)<textarea value={instructions} onChange={(event) => setInstructions(event.target.value)} rows={2} maxLength={1200} /></label>
          <button type="submit" className="primary medical-document-issue" disabled={saving || !issueReady || items.length === 0}>{saving ? "Assinando e emitindo…" : "Emitir receita"}</button>
        </form>
      ) : (
        <form className="medical-document-form" onSubmit={issueDocument}>
          <div className="medical-document-form-grid">
            <label>Tipo de documento<select value={subtype} onChange={(event) => { setSubtype(event.target.value); setTemplateEdited(false); }}><option value="COMPARECIMENTO">Comparecimento</option><option value="AFASTAMENTO">Afastamento</option><option value="APTIDAO">Aptidão</option></select></label>
            <label>Data<input type="date" value={attestationDate} onChange={(event) => { setAttestationDate(event.target.value); setTemplateEdited(false); }} required /></label>
            {subtype === "AFASTAMENTO" && <label>Dias de afastamento<input type="number" min="1" max="365" value={daysAway} onChange={(event) => { setDaysAway(event.target.value); setTemplateEdited(false); }} required /></label>}
            {subtype === "COMPARECIMENTO" && <><label>Horário de entrada<input type="time" value={entryTime} onChange={(event) => { setEntryTime(event.target.value); setTemplateEdited(false); }} required /></label><label>Horário de saída<input type="time" value={exitTime} onChange={(event) => { setExitTime(event.target.value); setTemplateEdited(false); }} required /></label></>}
            <label className="medical-document-wide">Texto-modelo editável<textarea value={template} onChange={(event) => { setTemplate(event.target.value); setTemplateEdited(true); }} rows={5} required minLength={10} maxLength={3000} /></label>
            <button type="button" className="secondary medical-document-wide" onClick={() => { setTemplateEdited(false); setTemplate(attestationTemplate(patientName, subtype, attestationDate, daysAway, entryTime, exitTime)); }}>Restaurar texto-modelo automático</button>
          </div>
          <label className="medical-cid-consent"><input type="checkbox" checked={cidAuthorized} onChange={(event) => { setCidAuthorized(event.target.checked); if (!event.target.checked) setCid(""); }} /><span>Marque apenas após obter a autorização expressa do paciente para incluir o CID neste documento.</span></label>
          {cidAuthorized && <label>CID (opcional)<input value={cid} onChange={(event) => setCid(event.target.value)} placeholder="Ex.: código CID-10" maxLength={20} /></label>}
          <button type="submit" className="primary medical-document-issue" disabled={saving || !issueReady}>{saving ? "Assinando e emitindo…" : "Emitir atestado"}</button>
        </form>
      ))}

      <div className="medical-documents-history">
        <h4>Histórico {tab === "RECEITA" ? "de receitas" : "de atestados"}</h4>
        {documents.length === 0 ? <p className="clinical-empty-state">Nenhum documento emitido neste atendimento.</p> : documents.map((document) => <article className={`medical-document-history-card ${document.status === "CANCELADO" ? "cancelled" : ""}`} key={document.id}>
          <div className="medical-document-history-main"><strong>{document.documentNumber || (tab === "RECEITA" ? "Receita" : "Atestado")}</strong><span>{document.subtype === "NAO_CONTROLADA" ? "Receita não controlada" : document.subtype}</span><small>Emitido em {new Date(document.issuedAt).toLocaleString("pt-BR")} por {document.issuedBy?.fullName || "Médico"} · CRM {document.doctor?.crm || "—"}</small>{document.status === "CANCELADO" && <small>Cancelado em {new Date(document.cancelledAt).toLocaleString("pt-BR")} por {document.cancelledBy?.fullName || "Médico"}. Motivo: {document.cancellationReason}</small>}<small>Código de validação: {document.validationCode}</small></div>
          <span className={`medical-document-status ${document.status === "CANCELADO" ? "cancelled" : ""}`}>{document.status === "CANCELADO" ? "Cancelado" : "Emitido"}</span>
          <div className="medical-document-history-actions"><button type="button" className="secondary" onClick={() => void openPdf(Number(document.id))}>Abrir PDF</button>{canIssue && document.status === "EMITIDO" && <button type="button" className="medical-document-cancel" onClick={() => void cancelDocument(Number(document.id))}><Trash2 size={14} /> Cancelar</button>}</div>
        </article>)}
      </div>
    </section>
  );
}
