import React, { useEffect, useMemo, useRef, useState } from "react";
import {
  Activity,
  CheckCircle2,
  ChevronDown,
  ClipboardCheck,
  Eye,
  EyeOff,
  FlaskConical,
  Clock3,
  Syringe,
  FileImage,
  FilePlus2,
  FileText,
  Paperclip,
  Pencil,
  Plus,
  Search,
  ShieldAlert,
  Trash2,
  Upload,
  UserRound,
  X,
} from "lucide-react";
import type { Row } from "../lib/app";
import { API, request } from "../lib/app";

type MedicalRecordsPageProps = { patientId: number | null; appointmentId?: number | null };
const today = () => {
  const d = new Date();
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-${String(d.getDate()).padStart(2, "0")}`;
};
const emptyRecord = (patientId: number | null, appointmentId?: number | null): Row => ({
  patientId: patientId || "",
  appointmentId: appointmentId || "",
  recordDate: today(),
  title: "Atendimento",
  conduct: "",
});
type EvolutionFields = { anamnesis: string; physicalExam: string; diagnosis: string; conduct: string };
const evolutionSections: { key: keyof EvolutionFields; label: string }[] = [
  { key: "anamnesis", label: "Queixa e anamnese" },
  { key: "physicalExam", label: "Exame físico" },
  { key: "diagnosis", label: "Diagnóstico (CID)" },
  { key: "conduct", label: "Conduta" },
];
const evolutionMarker = "[[MEDCLINIC_EVOLUTION_V1]]";
function parseEvolution(value: unknown): EvolutionFields {
  const raw = String(value || "");
  const empty: EvolutionFields = { anamnesis: "", physicalExam: "", diagnosis: "", conduct: "" };
  if (!raw.startsWith(evolutionMarker)) return { ...empty, conduct: raw };
  const body = raw.slice(evolutionMarker.length).replace(/^\s*/, "");
  const positions = evolutionSections.map((section) => body.indexOf(`${section.label}:\n`));
  if (positions.some((position) => position < 0)) return { ...empty, conduct: raw };
  return evolutionSections.reduce((fields, section, index) => {
    const start = positions[index] + section.label.length + 2;
    const nextPosition = positions[index + 1];
    const end = nextPosition >= 0 ? Math.max(start, nextPosition - 2) : body.length;
    fields[section.key] = body.slice(start, end).trimEnd();
    return fields;
  }, { ...empty });
}
function serializeEvolution(fields: EvolutionFields) {
  if (!evolutionSections.some((section) => fields[section.key].trim())) return "";
  return `${evolutionMarker}\n${evolutionSections.map((section) => `${section.label}:\n${fields[section.key] || ""}`).join("\n\n")}`;
}
function cpfDigits(value: unknown) { return String(value || "").replace(/\D/g, ""); }
function formattedCpf(value: unknown) {
  const digits = cpfDigits(value);
  return digits.length === 11 ? `${digits.slice(0, 3)}.${digits.slice(3, 6)}.${digits.slice(6, 9)}-${digits.slice(9)}` : display(value);
}
function maskedCpf(value: unknown) {
  const digits = cpfDigits(value);
  if (!digits) return "Não informado";
  return digits.length === 11 ? `${digits.slice(0, 3)}.***.***-${digits.slice(-2)}` : "***.***.***-**";
}
function fileTypeLabel(mimeType: string, fileName = "") {
  if (mimeType === "application/pdf" || fileName.toLocaleLowerCase().endsWith(".pdf")) return "PDF";
  if (mimeType === "image/png" || fileName.toLocaleLowerCase().endsWith(".png")) return "PNG";
  return "JPG";
}

function dateLabel(value: string) {
  return new Date(`${value.slice(0, 10)}T12:00:00`)
    .toLocaleDateString("pt-BR", {
      day: "2-digit",
      month: "short",
      year: "numeric",
    })
    .replace(".", "")
    .toUpperCase();
}
function formatDateInput(value: string) {
  return value ? value.slice(0, 10) : today();
}
function ageToday(value?: string | null) {
  if (!value) return "Não informado";
  const birth = new Date(`${value.slice(0, 10)}T12:00:00`);
  const now = new Date();
  let age = now.getFullYear() - birth.getFullYear();
  const beforeBirthday =
    now.getMonth() < birth.getMonth() ||
    (now.getMonth() === birth.getMonth() && now.getDate() < birth.getDate());
  if (beforeBirthday) age -= 1;
  return `${age} anos`;
}
function display(value: unknown) {
  return value === null || value === undefined || value === ""
    ? "Não informado"
    : String(value);
}
function fileSize(value: number) {
  if (value < 1024) return `${value} B`;
  if (value < 1024 * 1024) return `${Math.round(value / 1024)} KB`;
  return `${(value / (1024 * 1024)).toFixed(1)} MB`;
}
function fileIcon(mimeType: string) {
  return mimeType === "application/pdf" ? (
    <FileText size={16} />
  ) : (
    <FileImage size={16} />
  );
}

function AttachmentsArea({
  recordId,
  attachments = [],
  onChanged,
}: {
  recordId: number;
  attachments?: Row[];
  onChanged: () => Promise<void>;
}) {
  const inputRef = useRef<HTMLInputElement>(null);
  const [dragging, setDragging] = useState(false);
  const [uploading, setUploading] = useState(false);
  const [message, setMessage] = useState("");
  async function upload(files: FileList | File[]) {
    const selected = Array.from(files);
    if (!selected.length) return;
    const invalid = selected.find(file => !["application/pdf", "image/jpeg", "image/png"].includes(file.type) || file.size > 10 * 1024 * 1024);
    if (invalid) { setMessage(`\"${invalid.name}\": use PDF, JPG ou PNG com até 10 MB por arquivo.`); return; }
    setUploading(true);
    setMessage("");
    try {
      const token = localStorage.getItem("medclinic_token");
      for (const file of selected) {
        const data = new FormData();
        data.append("file", file);
        const response = await fetch(`${API}/medical-records/${recordId}/attachments`, {
          method: "POST",
          headers: token ? { Authorization: `Bearer ${token}` } : {},
          body: data,
        });
        const result = await response.json().catch(() => ({}));
        if (!response.ok) throw new Error(result.message || `Não foi possível anexar ${file.name}.`);
      }
      await onChanged();
    } catch (error: any) {
      setMessage(error.message);
    } finally {
      setUploading(false);
      if (inputRef.current) inputRef.current.value = "";
    }
  }
  async function view(attachment: Row) {
    try {
      const token = localStorage.getItem("medclinic_token");
      const attachmentPath = String(attachment.url || "").replace(
        /^\/api(?=\/)/,
        "",
      );
      const response = await fetch(`${API}${attachmentPath}`, {
        headers: token ? { Authorization: `Bearer ${token}` } : {},
      });
      if (!response.ok) throw new Error("Não foi possível abrir o anexo.");
      const blobUrl = URL.createObjectURL(await response.blob());
      window.open(blobUrl, "_blank", "noopener,noreferrer");
    } catch (error: any) {
      setMessage(error.message);
    }
  }
  async function remove(attachment: Row) {
    if (!confirm(`Remover o anexo "${attachment.fileName}"?`)) return;
    try {
      await request(`/medical-record-attachments/${attachment.id}`, {
        method: "DELETE",
      });
      await onChanged();
    } catch (error: any) {
      setMessage(error.message);
    }
  }
  return (
    <section className="record-attachments">
      <div className="attachments-heading">
        <strong>
          Arquivos do prontuário {attachments.length > 0 && <span>{attachments.length}</span>}
        </strong>
      </div>
      <div
        className={
          dragging ? "attachment-dropzone dragging" : "attachment-dropzone"
        }
        onDragOver={(event) => {
          event.preventDefault();
          setDragging(true);
        }}
        onDragLeave={() => setDragging(false)}
        onDrop={(event) => {
          event.preventDefault();
          setDragging(false);
          void upload(event.dataTransfer.files);
        }}
      >
        <span>Arraste arquivos aqui ou</span>
        <button
          className="attachment-upload-button"
          onClick={() => inputRef.current?.click()}
          disabled={uploading}
        >
          <Upload size={14} />
          {uploading ? "Enviando…" : "Anexar arquivo"}
        </button>
        <input
          ref={inputRef}
          type="file"
          multiple
          accept="application/pdf,image/jpeg,image/png"
          hidden
          onChange={(event) => void upload(event.target.files || [])}
        />
      </div>
      <small className="attachment-help">
        PDF, JPG ou PNG, até 10 MB por arquivo.
      </small>
      {attachments.length > 0 && (
        <div className="attachment-chips">
          {attachments.map((attachment) => (
            <div className="attachment-chip" key={attachment.id}>
              <button className="attachment-main" onClick={() => view(attachment)} title="Visualizar anexo" aria-label={`Visualizar ${attachment.fileName}`}>
                <span className="attachment-type">{fileIcon(attachment.mimeType)}<small>{fileTypeLabel(attachment.mimeType, attachment.fileName)}</small></span>
                <span className="attachment-info"><strong>{attachment.fileName}</strong><small>{new Date(attachment.uploadedAt).toLocaleDateString("pt-BR")} · {fileSize(attachment.sizeBytes)} · {attachment.uploadedBy?.fullName || "Médico"}</small></span>
                <Eye size={14} />
              </button>
              <button className="attachment-remove" onClick={() => remove(attachment)} title="Excluir anexo" aria-label={`Excluir anexo ${attachment.fileName}`}><Trash2 size={15} /></button>
            </div>
          ))}
        </div>
      )}
      {message && <span className="attachment-error">{message}</span>}
    </section>
  );
}

function AppointmentContextRow({ appointment, eventLabel, onChanged }: { appointment?: Row; eventLabel?: string; onChanged: () => Promise<void> }) {
  const [editing, setEditing] = useState(false);
  const [notes, setNotes] = useState(String(appointment?.notes || ""));
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState("");
  useEffect(() => { setNotes(String(appointment?.notes || "")); setEditing(false); }, [appointment?.id, appointment?.notes]);
  if (!appointment) return null;
  const appointmentId = Number(appointment.id);
  async function saveNotes() {
    setSaving(true); setMessage("");
    try {
      await request(`/appointments/${appointmentId}/clinical`, { method: "PATCH", body: JSON.stringify({ notes }) });
      setEditing(false); await onChanged();
    } catch (error: any) { setMessage(error.message || "Não foi possível salvar a observação."); }
    finally { setSaving(false); }
  }
  return <div className="appointment-context-row">
    <div className="appointment-context-line">
      <span className="appointment-context-type"><Clock3 size={15} />{appointment.scheduledTime || "Horário não informado"} · {eventLabel || "Atendimento"}</span>
      <span className="appointment-context-note"><strong>Observação:</strong> {notes.trim() || "Não informada"}</span>
    </div>
    <button type="button" className="appointment-context-edit" onClick={() => setEditing(value => !value)} title="Editar observação do agendamento" aria-label="Editar observação do agendamento"><Pencil size={14} /></button>
    {editing && <div className="appointment-context-editor"><label htmlFor={`appointment-note-${appointment.id}`}>Observação do agendamento</label><textarea id={`appointment-note-${appointment.id}`} rows={2} value={notes} onChange={event => setNotes(event.target.value)} /><button type="button" className="primary" onClick={() => void saveNotes()} disabled={saving}>{saving ? "Salvando…" : "Salvar observação"}</button>{message && <span className="attachment-error">{message}</span>}</div>}
  </div>;
}

function AppointmentAttachmentsArea({ appointment, onChanged }: { appointment?: Row; onChanged: () => Promise<void> }) {
  const inputRef = useRef<HTMLInputElement>(null);
  const [uploading, setUploading] = useState(false);
  const [message, setMessage] = useState("");
  if (!appointment) return null;
  const appointmentId = Number(appointment.id);
  const attachments: Row[] = appointment.attachments || [];
  async function upload(files: FileList | null) {
    if (!files?.length) return;
    const selected = Array.from(files);
    const invalid = selected.find(file => !["application/pdf", "image/jpeg", "image/png"].includes(file.type) || file.size > 10 * 1024 * 1024);
    if (invalid) { setMessage("PDF, JPG ou PNG, até 10 MB por arquivo."); return; }
    setUploading(true); setMessage("");
    try {
      const form = new FormData(); selected.forEach(file => form.append("files", file));
      await request(`/appointments/${appointmentId}/attachments`, { method: "POST", body: form });
      await onChanged();
    } catch (error: any) { setMessage(error.message || "Não foi possível anexar os arquivos."); }
    finally { setUploading(false); if (inputRef.current) inputRef.current.value = ""; }
  }
  async function view(attachment: Row) {
    const token = localStorage.getItem("medclinic_token");
    const path = String(attachment.url || "").replace(/^\/api(?=\/)/, "");
    const response = await fetch(`${API}${path}`, { headers: token ? { Authorization: `Bearer ${token}` } : {} });
    if (!response.ok) { setMessage("Não foi possível abrir o arquivo."); return; }
    window.open(URL.createObjectURL(await response.blob()), "_blank", "noopener,noreferrer");
  }
  async function remove(attachment: Row) {
    if (!confirm(`Excluir o arquivo \"${attachment.fileName}\"?`)) return;
    try { await request(`/appointment-attachments/${attachment.id}`, { method: "DELETE" }); await onChanged(); }
    catch (error: any) { setMessage(error.message || "Não foi possível excluir o arquivo."); }
  }
  return <section className="appointment-attachments-area">
    <div className="attachments-heading"><strong>Arquivos do agendamento {attachments.length > 0 && <span>{attachments.length}</span>}</strong></div>
    <div className="appointment-upload-row"><button type="button" className="appointment-timeline-upload" onClick={() => inputRef.current?.click()} disabled={uploading}><Upload size={14} />{uploading ? "Enviando…" : "Anexar arquivo"}</button><input ref={inputRef} hidden type="file" multiple accept="application/pdf,image/jpeg,image/png" onChange={event => void upload(event.target.files)} /></div>
    <small className="attachment-help">PDF, JPG ou PNG, até 10 MB por arquivo.</small>
    {attachments.length > 0 && <div className="attachment-chips">{attachments.map((attachment: Row) => <div className="attachment-chip" key={attachment.id}><button type="button" className="attachment-main" onClick={() => void view(attachment)} title="Visualizar arquivo" aria-label={`Visualizar ${attachment.fileName}`}><span className="attachment-type">{fileIcon(attachment.mimeType)}<small>{fileTypeLabel(attachment.mimeType, attachment.fileName)}</small></span><span className="attachment-info"><strong>{attachment.fileName}</strong><small>{new Date(attachment.uploadedAt).toLocaleDateString("pt-BR")} · {fileSize(attachment.sizeBytes)} · {attachment.uploadedBy?.fullName || "Usuário"}</small></span><Eye size={14} /></button><button type="button" className="attachment-remove" onClick={() => void remove(attachment)} title="Excluir arquivo" aria-label={`Excluir arquivo ${attachment.fileName}`}><Trash2 size={15} /></button></div>)}</div>}
    {message && <span className="attachment-error">{message}</span>}
  </section>;
}

function UltrasoundRequestsArea({
  recordId,
  requests = [],
  procedureRequests = [],
  onChanged,
  canCompose,
}: {
  recordId: number;
  requests?: Row[];
  procedureRequests?: Row[];
  onChanged: () => Promise<void>;
  canCompose: boolean;
}) {
  const [catalog, setCatalog] = useState<Row[]>([]);
  const [selectedProcedures, setSelectedProcedures] = useState<Row[]>([]);
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState("");
  const requestedProcedureIds = new Set(procedureRequests.map((item) => Number(item.procedureId || item.procedure?.id)));
  const imagingProcedures = catalog.filter((item) => item.type === "DIAGNOSTICO_POR_IMAGEM");
  useEffect(() => {
    if (canCompose)
      request("/procedures/catalog")
        .then(setCatalog)
        .catch((error: any) => setMessage(error.message));
  }, [canCompose]);
  async function submitCatalogProcedures() {
    if (!selectedProcedures.length) return;
    setSaving(true); setMessage("");
    try {
      await request(`/medical-records/${recordId}/procedure-requests`, { method: "POST", body: JSON.stringify({ procedureIds: selectedProcedures.map((item) => Number(item.id)) }) });
      setSelectedProcedures([]); await onChanged();
    } catch (error: any) { setMessage(error.message); } finally { setSaving(false); }
  }
  async function viewRequest(item: Row) {
    try {
      const token = localStorage.getItem("medclinic_token");
      const response = await fetch(`${API}/medical-record-ultrasound-requests/${item.id}/pdf`, { headers: token ? { Authorization: `Bearer ${token}` } : {} });
      if (!response.ok) throw new Error("Não foi possível abrir a solicitação de USG.");
      const blobUrl = URL.createObjectURL(await response.blob()); window.open(blobUrl, "_blank", "noopener,noreferrer");
    } catch (error: any) { setMessage(error.message); }
  }
  if (!canCompose && requests.length === 0 && procedureRequests.length === 0) return null;
  return <section className="ultrasound-requests-area">
    <div className="ultrasound-heading"><strong>Ultrassonografia (USG) {(requests.length + procedureRequests.length) > 0 && <span>{requests.length + procedureRequests.length}</span>}</strong></div>
    {canCompose && <>
      <div className="procedure-heading"><strong>Exames cadastrados · Diagnóstico por Imagem</strong></div>
      <div className="ultrasound-options">
        {imagingProcedures.length === 0 ? <p className="exam-request-empty">Nenhum procedimento ativo cadastrado como Diagnóstico por Imagem.</p> : imagingProcedures.map((item) => {
          const checked = selectedProcedures.some((selectedItem) => Number(selectedItem.id) === Number(item.id));
          const requested = requestedProcedureIds.has(Number(item.id));
          return <button type="button" key={item.id} className={`ultrasound-option ${checked ? "selected" : ""} ${requested ? "requested" : ""}`} onClick={() => { if (!requested) setSelectedProcedures((current) => checked ? current.filter((selectedItem) => Number(selectedItem.id) !== Number(item.id)) : [...current, item]); setMessage(""); }} disabled={requested}>
            <span className="ultrasound-check">{checked || requested ? "✓" : ""}</span><span><strong>{item.name}</strong><small>{requested ? "Já solicitado neste prontuário" : Number(item.value || 0).toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</small></span>
          </button>;
        })}
      </div>
      <div className="ultrasound-actions"><button type="button" className="primary" disabled={!selectedProcedures.length || saving} onClick={() => void submitCatalogProcedures()}>{saving ? "Solicitando…" : selectedProcedures.length ? "Gerar pedido" : "Selecione ao menos um exame"}</button>{selectedProcedures.length > 0 && <button type="button" className="secondary" onClick={() => setSelectedProcedures([])}>Limpar seleção</button>}</div>
    </>}
    {requests.length > 0 && <div className="ultrasound-generated">{requests.map((item) => <div className="ultrasound-generated-item" key={item.id}><span><strong>{String(item.type || "USG").split("_").join(" ")}</strong><small>{item.description || "Pedido anterior"} · {item.code}</small></span><span className="exam-request-status">Aguardando resultado</span><button type="button" className="exam-request-view" onClick={() => void viewRequest(item)} title="Visualizar pedido em PDF"><Eye size={16} /></button></div>)}</div>}
    {procedureRequests.length > 0 && <div className="ultrasound-generated">{procedureRequests.map((item) => <div className="ultrasound-generated-item" key={item.id}><span><strong>{item.name || item.procedure?.name}</strong><small>Diagnóstico por Imagem · {Number(item.value || item.procedure?.value || 0).toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</small></span><span className="procedure-status">Aguardando agendamento</span></div>)}</div>}
    {message && <span className="attachment-error">{message}</span>}
  </section>;
}

function ExamRequestsArea({
  recordId,
  requests = [],
  onChanged,
  canCompose,
}: {
  recordId: number;
  requests?: Row[];
  onChanged: () => Promise<void>;
  canCompose: boolean;
}) {
  const [groups, setGroups] = useState<Row[]>([]);
  const [examCatalog, setExamCatalog] = useState<Row[]>([]);
  const [selectedIds, setSelectedIds] = useState<number[]>([]);
  const [selectedExamTypeIds, setSelectedExamTypeIds] = useState<Record<number, number[]>>({});
  const [examTypeSearch, setExamTypeSearch] = useState<Record<number, string>>({});
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState("");
  useEffect(() => {
    if (canCompose)
      Promise.all([request("/exam-groups"), request("/exam-types/catalog")])
        .then(([groupResult, catalogResult]) => { setGroups(groupResult || []); setExamCatalog(catalogResult || []); })
        .catch((error: any) => setMessage(error.message))
        .finally(() => setLoading(false));
    else setLoading(false);
  }, [canCompose]);
  const requestedIds = new Set(
    requests.map((item) => Number(item.examGroupId || item.examGroup?.id)),
  );
  const selectedGroups = selectedIds
    .map((id) => groups.find((group) => Number(group.id) === id))
    .filter(Boolean) as Row[];
  const hasExamSelection = selectedIds.some((id) => (selectedExamTypeIds[id] || []).length > 0);
  const selectedExamTotal = selectedIds.reduce((total, groupId) => total + (selectedExamTypeIds[groupId] || []).reduce((subtotal, examTypeId) => {
    const exam = examCatalog.find((item) => Number(item.id) === examTypeId)
      || (groups.find((group) => Number(group.id) === groupId)?.items || []).find((item: Row) => Number(item.examTypeId || item.examType?.id) === examTypeId)?.examType;
    return subtotal + Number(exam?.value || 0);
  }, 0), 0);
  const selectedExamItems = selectedIds.flatMap(groupId => {
    const group = groups.find(item => Number(item.id) === groupId);
    return (selectedExamTypeIds[groupId] || []).map(examTypeId => {
      const groupItem = (group?.items || []).find((item: Row) => Number(item.examTypeId || item.examType?.id) === examTypeId);
      const exam = examCatalog.find(item => Number(item.id) === examTypeId) || groupItem?.examType;
      return { ...(exam || {}), id: examTypeId, groupId, groupName: group?.name || "Exame", value: exam?.value ?? groupItem?.value };
    });
  });
  const suggestions = groups
    .filter(
      (group) =>
        !requestedIds.has(Number(group.id)) &&
        !selectedIds.includes(Number(group.id)) &&
        String(group.name || "")
          .toLocaleLowerCase()
          .includes(search.toLocaleLowerCase()),
    )
    .slice(0, 8);
  function addGroup(id: number) {
    const group = groups.find((item) => Number(item.id) === id);
    setSelectedIds((current) =>
      current.includes(id) ? current : [...current, id],
    );
    setSelectedExamTypeIds((current) => current[id] ? current : ({ ...current, [id]: (group?.items || []).filter((item: Row) => item.examType?.active !== false).map((item: Row) => Number(item.examTypeId || item.examType?.id)) }));
    setSearch("");
    setMessage("");
  }
  function removeSelected(id: number) {
    setSelectedIds((current) => current.filter((item) => item !== id));
    setSelectedExamTypeIds((current) => { const next = { ...current }; delete next[id]; return next; });
    setExamTypeSearch((current) => { const next = { ...current }; delete next[id]; return next; });
  }
  function addExamType(groupId: number, examTypeId: number) {
    setSelectedExamTypeIds((current) => ({ ...current, [groupId]: [...new Set([...(current[groupId] || []), examTypeId])] }));
    setExamTypeSearch((current) => ({ ...current, [groupId]: "" }));
  }
  function toggleExamType(groupId: number, examTypeId: number) {
    setSelectedExamTypeIds((current) => ({
      ...current,
      [groupId]: (current[groupId] || []).includes(examTypeId)
        ? (current[groupId] || []).filter((id) => id !== examTypeId)
        : [...(current[groupId] || []), examTypeId],
    }));
  }
  async function generate() {
    const groupsToSubmit = selectedIds.filter(id => (selectedExamTypeIds[id] || []).length > 0);
    if (groupsToSubmit.length === 0) {
      setMessage("Selecione ao menos um exame.");
      return;
    }
    setSaving(true);
    setMessage("");
    try {
      await request(`/medical-records/${recordId}/exam-requests`, {
        method: "POST",
        body: JSON.stringify({ groups: groupsToSubmit.map((examGroupId) => ({ examGroupId, examTypeIds: selectedExamTypeIds[examGroupId] || [] })) }),
      });
      setSelectedIds([]);
      setSelectedExamTypeIds({});
      setExamTypeSearch({});
      setSearch("");
      await onChanged();
    } catch (error: any) {
      setMessage(error.message);
    } finally {
      setSaving(false);
    }
  }
  async function viewRequest(item: Row) {
    try {
      const token = localStorage.getItem("medclinic_token");
      const response = await fetch(
        `${API}/medical-record-exam-requests/${item.id}/pdf`,
        { headers: token ? { Authorization: `Bearer ${token}` } : {} },
      );
      if (!response.ok)
        throw new Error("Não foi possível abrir o pedido de exames.");
      const blobUrl = URL.createObjectURL(await response.blob());
      window.open(blobUrl, "_blank", "noopener,noreferrer");
    } catch (error: any) {
      setMessage(error.message);
    }
  }
  if (!canCompose && requests.length === 0) return null;
  return (
    <section className="exam-requests-area">
      <div className="exam-requests-heading">
        <strong>
          Solicitação de exames {requests.length > 0 && <span>{requests.length}</span>}
        </strong>
      </div>
      {canCompose && (
        <>
          <div className="exam-request-search">
            <Search size={16} />
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Buscar grupo de exames cadastrado..."
            />
            {search && (
              <button
                type="button"
                title="Limpar busca"
                onClick={() => setSearch("")}
              >
                <X size={14} />
              </button>
            )}
          </div>
          {search && (
            <div className="exam-request-suggestions">
              {loading ? (
                <span>Carregando grupos…</span>
              ) : suggestions.length === 0 ? (
                <span>Nenhum grupo disponível para adicionar.</span>
              ) : (
                suggestions.map((group) => (
                  <button
                    type="button"
                    key={group.id}
                    onClick={() => addGroup(Number(group.id))}
                  >
                    <strong>{group.name}</strong>
                    <small>
                      {group.items?.length || 0}{" "}
                      {(group.items?.length || 0) === 1 ? "exame" : "exames"}
                    </small>
                  </button>
                ))
              )}
            </div>
          )}
          {selectedGroups.length > 0 && (
            <div className="exam-request-selection">
              <div className="exam-request-selection-summary"><strong>Pedido</strong><span>Total: {selectedExamTotal.toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</span></div>
              <div className="selected-exam-chips">{selectedExamItems.map(item => <span className="selected-exam-chip" key={`${item.groupId}-${item.id}`}><span>{item.code ? `${item.code} · ` : ""}{item.name}</span><button type="button" title={`Remover ${item.name}`} aria-label={`Remover ${item.name} do pedido`} onClick={() => toggleExamType(item.groupId, Number(item.id))}><X size={12} /></button></span>)}</div>
              {selectedGroups.map((group) => (
                <div className="exam-request-group-editor" key={group.id}>
                  <div className="exam-request-chip selected">
                    <span>{group.name}</span>
                    <button
                      type="button"
                      onClick={() => removeSelected(Number(group.id))}
                      title="Remover grupo"
                      aria-label={`Remover grupo ${group.name} do pedido`}
                    >
                      <X size={13} />
                    </button>
                  </div>
                  <label className="exam-request-type-search"><Search size={13} /><input value={examTypeSearch[Number(group.id)] || ""} onChange={(event) => setExamTypeSearch((current) => ({ ...current, [Number(group.id)]: event.target.value }))} placeholder="Acrescentar exame ativo..." /></label>
                  {(examTypeSearch[Number(group.id)] || "").trim() && <div className="exam-request-type-suggestions">{examCatalog.filter((exam) => !(selectedExamTypeIds[Number(group.id)] || []).includes(Number(exam.id)) && `${exam.code} ${exam.name}`.toLocaleLowerCase().includes((examTypeSearch[Number(group.id)] || "").toLocaleLowerCase())).slice(0, 6).map((exam) => <button type="button" key={exam.id} onClick={() => addExamType(Number(group.id), Number(exam.id))}><strong>{exam.code}</strong><span>{exam.name}</span></button>)}</div>}
                  <div className="exam-request-group-items">
                    {(selectedExamTypeIds[Number(group.id)] || []).map((examTypeId) => {
                      const exam = examCatalog.find((item) => Number(item.id) === examTypeId) || (group.items || []).find((item: Row) => Number(item.examTypeId || item.examType?.id) === examTypeId)?.examType;
                      const checked = (selectedExamTypeIds[Number(group.id)] || []).includes(examTypeId);
                      return <label className="exam-request-type-option" key={examTypeId}><input type="checkbox" checked={checked} onChange={() => toggleExamType(Number(group.id), examTypeId)} /><span><strong>{exam?.code ? `${exam.code} · ` : ""}{exam?.name || "Exame"}</strong><small>{exam?.value === undefined ? "Preço não informado" : Number(exam.value).toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</small></span></label>;
                    })}
                  </div>
                </div>
              ))}
            </div>
          )}
          {requests.length === 0 && selectedGroups.length === 0 && (
            <p className="exam-request-empty">
              Nenhum exame solicitado neste atendimento.
            </p>
          )}
        </>
      )}
      {requests.length > 0 && (
        <div className="exam-request-generated">
          {requests.map((item) => (
            <div className="exam-request-chip generated" key={item.id}>
              <CheckCircle2 size={15} />
              <span className="exam-request-chip-content">
                <strong>
                  {item.code || `RX-${String(item.id).padStart(6, "0")}`} ·{" "}
                  {item.groupName || item.examGroup?.name}
                </strong>
                <small>
                  Por: {item.requestedBy?.fullName || "Médico"} ·{" "}
                  {new Date(item.requestedAt).toLocaleDateString("pt-BR")}
                </small>
              </span>
              <span className="exam-request-status">Aguardando resultado</span>
              <button
                type="button"
                className="exam-request-view"
                onClick={() => void viewRequest(item)}
                title="Visualizar pedido em PDF"
              >
                <Eye size={16} />
              </button>
            </div>
          ))}
        </div>
      )}
      {canCompose && (
        <div className="exam-request-actions">
          <button
            type="button"
            className="primary exam-request-generate"
            disabled={!hasExamSelection || saving}
            onClick={() => void generate()}
          >
            <CheckCircle2 size={16} />
            {saving ? "Gerando…" : hasExamSelection ? "Gerar pedido" : "Selecione ao menos um exame"}
          </button>
          {selectedIds.length > 0 && (
            <button
              type="button"
              className="secondary"
              onClick={() => {
                setSelectedIds([]);
                setSelectedExamTypeIds({});
                setExamTypeSearch({});
              }}
            >
              Limpar
            </button>
          )}
        </div>
      )}
      {message && <span className="attachment-error">{message}</span>}
    </section>
  );
}
function InjectableRequestsArea({
  recordId,
  requests = [],
  onChanged,
  canCompose,
}: {
  recordId: number;
  requests?: Row[];
  onChanged: () => Promise<void>;
  canCompose: boolean;
}) {
  const [catalog, setCatalog] = useState<Row[]>([]);
  const [selected, setSelected] = useState<Row[]>([]);
  const [category, setCategory] = useState("TODOS");
  const [search, setSearch] = useState("");
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState("");
  useEffect(() => {
    if (canCompose)
      request("/injectables/catalog")
        .then(setCatalog)
        .catch((error: any) => setMessage(error.message));
  }, [canCompose]);
  const requestedIds = new Set(
    requests.map((item) => Number(item.injectableId || item.injectable?.id)),
  );
  const filtered = catalog
    .filter(
      (item) =>
        !requestedIds.has(Number(item.id)) &&
        !selected.some((row) => Number(row.id) === Number(item.id)) &&
        (category === "TODOS" || item.type === category) &&
        String(item.name)
          .toLocaleLowerCase()
          .includes(search.toLocaleLowerCase()),
    )
    .slice(0, 8);
  const categoryLabel = (value: string) =>
    (
      ({
        VITAMINAS: "Vitaminas",
        PROTOCOLOS: "Protocolos",
        IMUNIDADES: "Imunidade",
      }) as Record<string, string>
    )[value] || value;
  function add(item: Row) {
    setSelected((rows) => [...rows, { ...item, route: "IM", sessions: 1 }]);
    setSearch("");
  }
  function update(id: number, key: string, value: string | number) {
    setSelected((rows) =>
      rows.map((row) =>
        Number(row.id) === id ? { ...row, [key]: value } : row,
      ),
    );
  }
  async function submit() {
    if (!selected.length) return;
    setSaving(true);
    setMessage("");
    try {
      await request(`/medical-records/${recordId}/injectable-requests`, {
        method: "POST",
        body: JSON.stringify({
          items: selected.map((row) => ({
            injectableId: Number(row.id),
            route: row.route,
            sessions: Number(row.sessions),
          })),
        }),
      });
      setSelected([]);
      await onChanged();
    } catch (error: any) {
      setMessage(error.message);
    } finally {
      setSaving(false);
    }
  }
  if (!canCompose && requests.length === 0) return null;
  return (
    <section className="injectable-requests-area">
      <div className="injectable-heading">
        <strong>
          Injetáveis {requests.length > 0 && <span>{requests.length}</span>}
        </strong>
      </div>
      {canCompose && (
        <>
          <div className="injectable-tabs">
            {["TODOS", "VITAMINAS", "PROTOCOLOS", "IMUNIDADES"].map((item) => (
              <button
                type="button"
                className={category === item ? "active" : ""}
                key={item}
                onClick={() => setCategory(item)}
              >
                {item === "TODOS" ? "Todos" : categoryLabel(item)}
              </button>
            ))}
          </div>
          <div className="injectable-search">
            <Search size={16} />
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Buscar injetável cadastrado..."
            />
            {search && (
              <button type="button" onClick={() => setSearch("")}>
                <X size={14} />
              </button>
            )}
          </div>
          {search && (
            <div className="injectable-suggestions">
              {filtered.length ? (
                filtered.map((item) => (
                  <button type="button" key={item.id} onClick={() => add(item)}>
                    <strong>{item.name}</strong>
                    <small>{categoryLabel(item.type)} · {item.value === undefined ? "Preço não informado" : Number(item.value).toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</small>
                  </button>
                ))
              ) : (
                <span>Nenhum injetável disponível.</span>
              )}
            </div>
          )}
          {selected.length > 0 && (
            <div className="injectable-selected-list">
              {selected.map((item) => (
                <div className="injectable-row" key={item.id}>
                  <div className="injectable-selection-line">
                    <div className="injectable-row-name">
                      <Syringe size={17} />
                      <div>
                        <strong>{item.name}</strong>
                        <small>{categoryLabel(item.type)} · {item.value === undefined ? "Preço não informado" : Number(item.value).toLocaleString("pt-BR", { style: "currency", currency: "BRL" })}</small>
                      </div>
                    </div>
                    <button type="button" className="injectable-remove" onClick={() => setSelected(rows => rows.filter(row => Number(row.id) !== Number(item.id)))} title="Remover do pedido" aria-label={`Remover ${item.name} do pedido`}><X size={16} /></button>
                  </div>
                  <label>
                    Via
                    <select
                      value={item.route}
                      onChange={(event) =>
                        update(Number(item.id), "route", event.target.value)
                      }
                    >
                      <option value="IM">IM</option>
                      <option value="EV">EV</option>
                      <option value="SC">SC</option>
                    </select>
                  </label>
                  <label>
                    Sessões
                    <input
                      type="number"
                      min={1}
                      max={99}
                      value={item.sessions}
                      onChange={(event) =>
                        update(
                          Number(item.id),
                          "sessions",
                          Math.max(1, Number(event.target.value) || 1),
                        )
                      }
                    />
                  </label>
                </div>
              ))}
            </div>
          )}
          {selected.length === 0 && (
            <p className="exam-request-empty">
              Nenhum injetável selecionado neste atendimento.
            </p>
          )}
          <div className="exam-request-actions">
            <button
              type="button"
              className="primary"
              disabled={!selected.length || saving}
              onClick={() => void submit()}
            >
              <Syringe size={16} />
              {saving ? "Solicitando…" : selected.length ? "Solicitar aplicação" : "Selecione ao menos um injetável"}
            </button>
            {selected.length > 0 && (
              <button
                type="button"
                className="secondary"
                onClick={() => setSelected([])}
              >
                Limpar
              </button>
            )}
          </div>
        </>
      )}
      {requests.length > 0 && (
        <div className="injectable-requested-list">
          {requests.map((item) => (
            <div className="injectable-row requested" key={item.id}>
              <div className="injectable-row-name">
                <Syringe size={17} />
                <div>
                  <strong>{item.name || item.injectable?.name}</strong>
                  <small>
                    {categoryLabel(item.category || item.injectable?.type)} ·{" "}
                    {item.route} · {item.sessions}{" "}
                    {item.sessions === 1 ? "sessão" : "sessões"}
                  </small>
                </div>
              </div>
              <span className="injectable-status">Aguardando aplicação</span>
              <small className="injectable-audit">
                Por: {item.requestedBy?.fullName || "Médico"} ·{" "}
                {new Date(item.requestedAt).toLocaleDateString("pt-BR")}
              </small>
            </div>
          ))}
        </div>
      )}
      {message && <span className="attachment-error">{message}</span>}
    </section>
  );
}

function ProcedureRequestsArea({
  recordId,
  requests = [],
  onChanged,
  canCompose,
}: {
  recordId: number;
  requests?: Row[];
  onChanged: () => Promise<void>;
  canCompose: boolean;
}) {
  const [catalog, setCatalog] = useState<Row[]>([]);
  const [selected, setSelected] = useState<Row[]>([]);
  const [search, setSearch] = useState("");
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState("");
  useEffect(() => {
    if (canCompose)
      request("/procedures/catalog")
        .then(setCatalog)
        .catch((error: any) => setMessage(error.message));
  }, [canCompose]);
  const standardRequests = requests.filter(
    (item) => (item.procedure?.type || item.type) !== "DIAGNOSTICO_POR_IMAGEM",
  );
  const requestedIds = new Set(
    standardRequests.map((item) => Number(item.procedureId || item.procedure?.id)),
  );
  const filtered = catalog
    .filter(
      (item) =>
        item.type !== "DIAGNOSTICO_POR_IMAGEM" &&
        !requestedIds.has(Number(item.id)) &&
        !selected.some((row) => Number(row.id) === Number(item.id)) &&
        String(item.name)
          .toLocaleLowerCase()
          .includes(search.toLocaleLowerCase()),
    )
    .slice(0, 8);
  function add(item: Row) {
    setSelected((rows) => [...rows, item]);
    setSearch("");
    setMessage("");
  }
  async function submit() {
    if (!selected.length) return;
    setSaving(true);
    setMessage("");
    try {
      await request(`/medical-records/${recordId}/procedure-requests`, {
        method: "POST",
        body: JSON.stringify({
          procedureIds: selected.map((row) => Number(row.id)),
        }),
      });
      setSelected([]);
      await onChanged();
    } catch (error: any) {
      setMessage(error.message);
    } finally {
      setSaving(false);
    }
  }
  if (!canCompose && standardRequests.length === 0) return null;
  return (
    <section className="procedure-requests-area">
      <div className="procedure-heading">
        <strong>
          Procedimentos {standardRequests.length > 0 && <span>{standardRequests.length}</span>}
        </strong>
      </div>
      {canCompose && (
        <>
          <div className="procedure-search">
            <Search size={16} />
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Buscar procedimento cadastrado..."
            />
            {search && (
              <button type="button" onClick={() => setSearch("")}>
                <X size={14} />
              </button>
            )}
          </div>
          {search && (
            <div className="procedure-suggestions">
              {filtered.length ? (
                filtered.map((item) => (
                  <button type="button" key={item.id} onClick={() => add(item)}>
                    <strong>{item.name}</strong>
                    <small>
                      {Number(item.value || 0).toLocaleString("pt-BR", {
                        style: "currency",
                        currency: "BRL",
                      })}
                    </small>
                  </button>
                ))
              ) : (
                <span>Nenhum procedimento disponível.</span>
              )}
            </div>
          )}
          {selected.length > 0 && (
            <div className="procedure-selected-list">
              {selected.map((item) => (
                <div className="procedure-row selected-procedure-chip" key={item.id}>
                  <div className="procedure-row-name">
                    <ClipboardCheck size={17} />
                    <div>
                      <strong>{item.name}</strong>
                      <small>{Number(item.value || 0).toLocaleString("pt-BR", { style: "currency", currency: "BRL" })} · Procedimento selecionado</small>
                    </div>
                  </div>
                  <button
                    type="button"
                    className="procedure-remove"
                    onClick={() =>
                      setSelected((rows) =>
                        rows.filter(
                          (row) => Number(row.id) !== Number(item.id),
                        ),
                      )
                    }
                    title="Remover"
                    aria-label={`Remover ${item.name} do pedido`}
                  >
                    <X size={16} />
                  </button>
                </div>
              ))}
            </div>
          )}
          {selected.length === 0 && (
            <p className="exam-request-empty">
              Nenhum procedimento selecionado neste atendimento.
            </p>
          )}
          <div className="exam-request-actions">
            <button
              type="button"
              className="primary"
              disabled={!selected.length || saving}
              onClick={() => void submit()}
            >
              <ClipboardCheck size={16} />
              {saving ? "Solicitando…" : selected.length ? "Solicitar procedimento" : "Selecione ao menos um procedimento"}
            </button>
            {selected.length > 0 && (
              <button
                type="button"
                className="secondary"
                onClick={() => setSelected([])}
              >
                Limpar
              </button>
            )}
          </div>
        </>
      )}
      {standardRequests.length > 0 && (
        <div className="procedure-requested-list">
          {standardRequests.map((item) => (
            <div className="procedure-row requested" key={item.id}>
              <div className="procedure-row-name">
                <ClipboardCheck size={17} />
                <div>
                  <strong>{item.name || item.procedure?.name}</strong>
                  <small>
                    {Number(
                      item.value || item.procedure?.value || 0,
                    ).toLocaleString("pt-BR", {
                      style: "currency",
                      currency: "BRL",
                    })}
                  </small>
                </div>
              </div>
              <span className="procedure-status">Aguardando agendamento</span>
              <small className="procedure-audit">
                Por: {item.requestedBy?.fullName || "Médico"} ·{" "}
                {new Date(item.requestedAt).toLocaleDateString("pt-BR")}
              </small>
            </div>
          ))}
        </div>
      )}
      {message && <span className="attachment-error">{message}</span>}
    </section>
  );
}

function ClinicalAlertsBand({ allergies = [], comorbidities = [], medications = [] }: { allergies?: string[]; comorbidities?: string[]; medications?: string[] }) {
  // TODO: ligar estes props a campos explícitos da API quando forem adicionados. Patient.notes é texto livre e não deve ser interpretado como alerta clínico.
  const groups = [
    { label: "Alergias", values: allergies },
    { label: "Comorbidades", values: comorbidities },
    { label: "Medicamentos em uso", values: medications },
  ].filter(group => group.values.length > 0);
  return <section className="clinical-alerts-band" aria-label="Alertas clínicos">
    <ShieldAlert size={17} aria-hidden="true" />
    {groups.length > 0 ? groups.map(group => <div className="clinical-alert-group" key={group.label}><strong>{group.label}</strong><span>{group.values.join(" · ")}</span></div>) : <div className="clinical-alert-group"><strong>Alertas clínicos</strong><span>Dados ainda não disponíveis na API.</span></div>}
  </section>;
}

function ClinicalEvolutionSummary({ record }: { record: Row }) {
  const fields = parseEvolution(record.conduct);
  const hasContent = evolutionSections.some(section => fields[section.key].trim());
  return <div className="clinical-evolution-summary">
    {hasContent ? evolutionSections.map(section => <section className="clinical-evolution-field" key={section.key}><strong>{section.label}</strong><p>{fields[section.key].trim() || "—"}</p></section>) : <p className="clinical-empty-state">Nenhuma evolução registrada.</p>}
  </div>;
}

function GrowingTextarea({ label, value, onChange, placeholder }: { label: string; value: string; onChange: (value: string) => void; placeholder?: string }) {
  const ref = useRef<HTMLTextAreaElement>(null);
  useEffect(() => { if (ref.current) { ref.current.style.height = "auto"; ref.current.style.height = `${Math.max(ref.current.scrollHeight, 88)}px`; } }, [value]);
  return <label className="clinical-evolution-input"><span>{label}</span><textarea ref={ref} rows={3} value={value} placeholder={placeholder} onChange={event => onChange(event.target.value)} onInput={event => { event.currentTarget.style.height = "auto"; event.currentTarget.style.height = `${Math.max(event.currentTarget.scrollHeight, 88)}px`; }} /></label>;
}

function ClinicalEvolutionEditor({ record, onSave, onPersisted, onFinalize }: { record: Row; onSave: (value: Row) => Promise<Row>; onPersisted: (saved: Row) => void; onFinalize: () => void }) {
  const [fields, setFields] = useState<EvolutionFields>(() => parseEvolution(record.conduct));
  const [status, setStatus] = useState<"idle" | "pending" | "saving" | "saved" | "error">("idle");
  const [lastSavedAt, setLastSavedAt] = useState<Date | null>(null);
  const [revision, setRevision] = useState(0);
  const fieldsRef = useRef(fields);
  const recordRef = useRef<Row>(record);
  const idRef = useRef<number | null>(record.id ? Number(record.id) : null);
  const dirtyRef = useRef(false);
  const savePromiseRef = useRef<Promise<boolean> | null>(null);
  const saveTimerRef = useRef<number | null>(null);
  const saveCallbackRef = useRef(onSave);
  const persistedCallbackRef = useRef(onPersisted);
  const finalizeCallbackRef = useRef(onFinalize);
  const flushRef = useRef<() => Promise<boolean>>(async () => true);
  saveCallbackRef.current = onSave;
  persistedCallbackRef.current = onPersisted;
  finalizeCallbackRef.current = onFinalize;
  recordRef.current = { ...recordRef.current, ...record };
  if (record.id) idRef.current = Number(record.id);

  flushRef.current = async () => {
    if (savePromiseRef.current) {
      const result = await savePromiseRef.current;
      if (dirtyRef.current) {
        if (saveTimerRef.current !== null) window.clearTimeout(saveTimerRef.current);
        saveTimerRef.current = null;
        return flushRef.current();
      }
      return result;
    }
    if (!dirtyRef.current) return true;
    dirtyRef.current = false;
    setStatus("saving");
    const payload: Row = {
      ...recordRef.current,
      ...(idRef.current ? { id: idRef.current } : {}),
      title: recordRef.current.title || "Atendimento",
      conduct: serializeEvolution(fieldsRef.current),
    };
    const pending = (async () => {
      try {
        const saved = await saveCallbackRef.current(payload);
        idRef.current = Number(saved.id);
        recordRef.current = { ...recordRef.current, ...saved };
        persistedCallbackRef.current(saved);
        setStatus("saved");
        setLastSavedAt(new Date());
        return true;
      } catch {
        dirtyRef.current = true;
        setStatus("error");
        return false;
      }
    })();
    savePromiseRef.current = pending;
    const result = await pending;
    savePromiseRef.current = null;
    if (result && dirtyRef.current) saveTimerRef.current = window.setTimeout(() => { void flushRef.current(); }, 700);
    return result;
  };

  useEffect(() => {
    if (!dirtyRef.current) return;
    if (saveTimerRef.current !== null) window.clearTimeout(saveTimerRef.current);
    saveTimerRef.current = window.setTimeout(() => { void flushRef.current(); }, 700);
    return () => { if (saveTimerRef.current !== null) window.clearTimeout(saveTimerRef.current); };
  }, [revision]);
  useEffect(() => () => { if (saveTimerRef.current !== null) window.clearTimeout(saveTimerRef.current); }, []);

  function updateField(key: keyof EvolutionFields, value: string) {
    const next = { ...fieldsRef.current, [key]: value };
    fieldsRef.current = next;
    setFields(next);
    dirtyRef.current = true;
    setStatus("pending");
    setRevision(current => current + 1);
  }
  async function finalize() {
    const saved = await flushRef.current();
    if (saved && (idRef.current || evolutionSections.some(section => fieldsRef.current[section.key].trim()))) finalizeCallbackRef.current();
  }
  const hasAnyField = evolutionSections.some(section => fields[section.key].trim());
  const statusText = status === "saving" ? "Salvando…" : status === "saved" && lastSavedAt ? `Salvo automaticamente às ${lastSavedAt.toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" })}` : status === "error" ? "Falha ao salvar. Tente novamente." : status === "pending" ? "Alterações pendentes" : "Salvamento automático ativo";

  return <div className="clinical-evolution-editor">
    <p className="clinical-field-mapping-note">A evolução é serializada no campo Conduta já existente, mantendo compatibilidade sem alterar a API.</p>
    <div className="clinical-evolution-fields">
      {evolutionSections.map(section => <GrowingTextarea key={section.key} label={section.label} value={fields[section.key]} onChange={value => updateField(section.key, value)} placeholder={`Descreva ${section.label.toLocaleLowerCase()}…`} />)}
    </div>
    <footer className="clinical-evolution-footer">
      <span className={`autosave-status ${status}`} aria-live="polite">{status === "saved" && <CheckCircle2 size={15} />}{statusText}</span>
      {status === "error" && <button type="button" className="secondary" onClick={() => void flushRef.current()}>Tentar novamente</button>}
      <button type="button" className="primary" onClick={() => void finalize()} disabled={!idRef.current && !hasAnyField}>Finalizar atendimento</button>
    </footer>
  </div>;
}

type EncounterTab = "evolution" | "exams" | "injectables" | "procedures" | "attachments";
function RecordTimelineCard({ record, isEditing, canEdit, canCompose, onRetify, onSave, onPersisted, onFinish, onChanged }: {
  record: Row; isEditing: boolean; canEdit: boolean; canCompose: boolean; onRetify: () => void;
  onSave: (value: Row) => Promise<Row>; onPersisted: (saved: Row) => void; onFinish: () => void; onChanged: () => Promise<void>;
}) {
  const [expanded, setExpanded] = useState(isEditing);
  const [activeTab, setActiveTab] = useState<EncounterTab>("evolution");
  const [examCategory, setExamCategory] = useState<"exams" | "ultrasound">("exams");
  useEffect(() => { if (isEditing) { setExpanded(true); setActiveTab("evolution"); } }, [isEditing]);
  const examRequests: Row[] = record.examRequests || [];
  const ultrasoundRequests: Row[] = record.ultrasoundRequests || [];
  const injectableRequests: Row[] = record.injectableRequests || [];
  const procedureRequests: Row[] = record.procedureRequests || [];
  const standardProcedures = procedureRequests.filter(item => (item.procedure?.type || item.type) !== "DIAGNOSTICO_POR_IMAGEM");
  const imageProcedures = procedureRequests.filter(item => (item.procedure?.type || item.type) === "DIAGNOSTICO_POR_IMAGEM");
  const attachments: Row[] = record.attachments || [];
  const appointmentAttachments: Row[] = record.appointment?.attachments || [];
  const counts: Record<EncounterTab, number> = {
    evolution: 0,
    exams: examRequests.length + ultrasoundRequests.length + imageProcedures.length,
    injectables: injectableRequests.length,
    procedures: standardProcedures.length,
    attachments: attachments.length + appointmentAttachments.length,
  };
  const tabs: { id: EncounterTab; label: string; icon: React.ReactNode }[] = [
    { id: "evolution", label: "Evolução", icon: <Activity size={16} /> },
    { id: "exams", label: "Exames", icon: <FlaskConical size={16} /> },
    { id: "injectables", label: "Injetáveis", icon: <Syringe size={16} /> },
    { id: "procedures", label: "Procedimentos", icon: <ClipboardCheck size={16} /> },
    { id: "attachments", label: "Anexos", icon: <Paperclip size={16} /> },
  ];
  const parsed = parseEvolution(record.conduct);
  const summaryText = parsed.anamnesis || parsed.conduct || parsed.physicalExam || parsed.diagnosis || String(record.appointment?.notes || "") || "Sem evolução registrada";
  const oneLine = summaryText.replace(/\s+/g, " ").trim();
  const instanceId = record.id ? String(record.id) : "draft";

  return <article className="medical-timeline-item" key={instanceId}>
    <div className="medical-date-rail"><strong>{dateLabel(String(record.recordDate || today()))}</strong><span /></div>
    <section className="medical-record-card">
      <header className={`medical-record-header ${expanded ? "expanded" : ""}`}>
        {isEditing ? <div className="record-editing-title"><strong>{record.id ? "Retificando atendimento" : "Novo atendimento"}</strong><small>Por: {record.author?.fullName || "Médico"}</small></div> : <button type="button" className="record-summary-toggle" aria-expanded={expanded} aria-controls={`record-panel-${instanceId}`} onClick={() => setExpanded(value => !value)}>
          <span className="record-summary-line"><strong>{record.appointment?.scheduledTime ? `${record.appointment.scheduledTime} · ` : ""}{record.title || "Atendimento"}</strong><span>{oneLine}</span></span>
          <ChevronDown size={18} aria-hidden="true" />
        </button>}
        {!isEditing && canEdit && <button type="button" className="record-edit-action" onClick={onRetify} title="Retificar registro clínico" aria-label="Retificar registro clínico"><Pencil size={15} /><span>Retificar</span></button>}
      </header>
      <div className="record-panel" id={`record-panel-${instanceId}`} hidden={!expanded}>
        {expanded && <>
        <AppointmentContextRow appointment={record.appointment} eventLabel={record.title} onChanged={onChanged} />
        <nav className="record-tabs" role="tablist" aria-label="Seções do prontuário">
          {tabs.map(tab => <button key={tab.id} type="button" role="tab" id={`tab-${instanceId}-${tab.id}`} aria-controls={`panel-${instanceId}-${tab.id}`} aria-selected={activeTab === tab.id} className={activeTab === tab.id ? "active" : ""} onClick={() => setActiveTab(tab.id)}>{tab.icon}<span>{tab.label}</span>{counts[tab.id] > 0 && <b className="record-tab-count">{counts[tab.id]}</b>}</button>)}
        </nav>
        <div className="record-tab-panels">
          <section role="tabpanel" id={`panel-${instanceId}-evolution`} aria-labelledby={`tab-${instanceId}-evolution`} hidden={activeTab !== "evolution"}>
            {isEditing ? <ClinicalEvolutionEditor key={`editor-${instanceId}`} record={record} onSave={onSave} onPersisted={onPersisted} onFinalize={onFinish} /> : <ClinicalEvolutionSummary record={record} />}
          </section>
          <section role="tabpanel" id={`panel-${instanceId}-exams`} aria-labelledby={`tab-${instanceId}-exams`} hidden={activeTab !== "exams"}>
            <div className="request-category-chips" role="group" aria-label="Categoria de exames"><button type="button" aria-pressed={examCategory === "exams"} className={examCategory === "exams" ? "active" : ""} onClick={() => setExamCategory("exams")}>Exames</button><button type="button" aria-pressed={examCategory === "ultrasound"} className={examCategory === "ultrasound" ? "active" : ""} onClick={() => setExamCategory("ultrasound")}>Ultrassonografia</button></div>
            <div hidden={examCategory !== "exams"}><ExamRequestsArea recordId={Number(record.id || 0)} requests={examRequests} canCompose={canCompose} onChanged={onChanged} /></div>
            <div hidden={examCategory !== "ultrasound"}><UltrasoundRequestsArea recordId={Number(record.id || 0)} requests={ultrasoundRequests} procedureRequests={imageProcedures} canCompose={canCompose} onChanged={onChanged} /></div>
            {!canCompose && counts.exams === 0 && <p className="clinical-empty-state">Nenhum exame solicitado neste atendimento.</p>}
          </section>
          <section role="tabpanel" id={`panel-${instanceId}-injectables`} aria-labelledby={`tab-${instanceId}-injectables`} hidden={activeTab !== "injectables"}>
            <InjectableRequestsArea recordId={Number(record.id || 0)} requests={injectableRequests} canCompose={canCompose} onChanged={onChanged} />
            {!canCompose && counts.injectables === 0 && <p className="clinical-empty-state">Nenhum injetável solicitado neste atendimento.</p>}
          </section>
          <section role="tabpanel" id={`panel-${instanceId}-procedures`} aria-labelledby={`tab-${instanceId}-procedures`} hidden={activeTab !== "procedures"}>
            <ProcedureRequestsArea recordId={Number(record.id || 0)} requests={standardProcedures} canCompose={canCompose} onChanged={onChanged} />
            {!canCompose && counts.procedures === 0 && <p className="clinical-empty-state">Nenhum procedimento solicitado neste atendimento.</p>}
          </section>
          <section role="tabpanel" id={`panel-${instanceId}-attachments`} aria-labelledby={`tab-${instanceId}-attachments`} hidden={activeTab !== "attachments"}>
            {record.id ? <AttachmentsArea recordId={Number(record.id)} attachments={attachments} onChanged={onChanged} /> : <p className="clinical-empty-state">Os arquivos do prontuário estarão disponíveis após o primeiro salvamento automático.</p>}
            <AppointmentAttachmentsArea appointment={record.appointment} onChanged={onChanged} />
          </section>
        </div>
        </>}
      </div>
    </section>
  </article>;
}

export function MedicalRecordsPage({
  patientId,
  appointmentId = null,
  allowNewRecord = false,
  enableExamRequests = false,
}: MedicalRecordsPageProps & {
  allowNewRecord?: boolean;
  enableExamRequests?: boolean;
}) {
  const [patients, setPatients] = useState<Row[]>([]);
  const [selectedPatientId, setSelectedPatientId] = useState<number | null>(
    patientId,
  );
  const [records, setRecords] = useState<Row[]>([]);
  const [editing, setEditing] = useState<Row | null>(null);
  const [composingRecordId, setComposingRecordId] = useState<number | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    setSelectedPatientId(patientId);
    setComposingRecordId(null);
    setEditing(null);
  }, [patientId]);
  useEffect(() => {
    request("/patients")
      .then(setPatients)
      .catch((e: any) => setError(e.message));
  }, []);
  useEffect(() => {
    setLoading(true);
    setError("");
    request(
      `/medical-records${selectedPatientId ? `?patientId=${selectedPatientId}` : ""}`,
    )
      .then(setRecords)
      .catch((e: any) => setError(e.message))
      .finally(() => setLoading(false));
  }, [selectedPatientId]);

  const selectedPatient = useMemo(
    () => patients.find((patient) => Number(patient.id) === selectedPatientId),
    [patients, selectedPatientId],
  );
  const displayedRecords = useMemo(() => {
    if (!editing) return records;
    if (!editing.id) return [editing, ...records];
    const exists = records.some(record => Number(record.id) === Number(editing.id));
    return exists ? records.map(record => Number(record.id) === Number(editing.id) ? { ...record, ...editing } : record) : [editing, ...records];
  }, [editing, records]);
  const [patientPhoto, setPatientPhoto] = useState<string | null>(null);
  const [showCpf, setShowCpf] = useState(false);
  useEffect(() => {
    let objectUrl: string | null = null;
    setPatientPhoto(null);
    if (!selectedPatient?.photoUrl) return;
    fetch(`${API}${selectedPatient.photoUrl}`, { headers: { Authorization: `Bearer ${localStorage.getItem("medclinic_token") || ""}` } })
      .then((response) => response.ok ? response.blob() : null)
      .then((blob) => { if (blob) { objectUrl = URL.createObjectURL(blob); setPatientPhoto(objectUrl); } })
      .catch(() => undefined);
    return () => { if (objectUrl) URL.revokeObjectURL(objectUrl); };
  }, [selectedPatient?.photoUrl]);
  async function saveRecord(values: Row): Promise<Row> {
    const existingId = values.id ? Number(values.id) : null;
    const payload = {
      ...(existingId ? { id: existingId } : {}),
      patientId: Number(selectedPatientId),
      appointmentId: values.appointmentId ? Number(values.appointmentId) : null,
      recordDate: formatDateInput(values.recordDate || today()),
      title: values.title || "Atendimento",
      conduct: values.conduct ?? null,
    };
    if (!payload.patientId) throw new Error("Selecione um paciente.");
    const savedRecord = await request(`/medical-records${existingId ? `/${existingId}` : ""}`, {
      method: existingId ? "PUT" : "POST",
      body: JSON.stringify(payload),
    });
    if (!existingId && payload.recordDate === today() && appointmentId) setComposingRecordId(Number(savedRecord.id));
    await reload(payload.patientId);
    return savedRecord;
  }
  async function reload(forPatient = selectedPatientId) {
    const result = await request(
      `/medical-records${forPatient ? `?patientId=${forPatient}` : ""}`,
    );
    setRecords(result || []);
  }
  function syncSavedRecord(saved: Row) {
    setEditing(current => {
      if (!current || (current.id && Number(current.id) !== Number(saved.id))) return current;
      return { ...current, ...saved, id: Number(saved.id) };
    });
  }

  return (
    <>
      <div className="page-heading medical-records-heading">
        <div>
          <p className="eyebrow">ÁREA MÉDICA</p>
          <h1>Prontuários</h1>
          <p className="muted">Histórico clínico organizado por paciente.</p>
        </div>
        {allowNewRecord && (
          <button
            className="primary"
            disabled={!selectedPatientId || loading || Boolean(editing)}
            onClick={() => setEditing(emptyRecord(selectedPatientId, appointmentId))}
          >
            <Plus size={17} /> Novo atendimento
          </button>
        )}
      </div>
      {error && <div className="error page-error">{error}</div>}
      {selectedPatient && (
        <section className="clinical-patient-card">
          <div className="clinical-patient-heading">
            <div className="clinical-patient-identity">
              <div className="clinical-patient-avatar">
                {patientPhoto ? (
                  <img src={patientPhoto} alt={`Foto de ${selectedPatient.fullName}`} />
                ) : (
                  <UserRound size={32} />
                )}
              </div>
              <div className="clinical-patient-name-block">
                <span>FICHA CLÍNICA</span>
                <h2>{selectedPatient.fullName}</h2>
                <div className="clinical-patient-meta">
                  <span><small>IDADE</small><strong>{ageToday(selectedPatient.birthDate)}</strong></span>
                  <span><small>CONVÊNIO</small><strong>{display(selectedPatient.insuranceName)}</strong></span>
                  <span><small>CÓDIGO</small><strong>{display(selectedPatient.sourceCode ?? selectedPatient.id)}</strong></span>
                  {selectedPatient.recordNumber && <span><small>Nº PRONTUÁRIO</small><strong>{selectedPatient.recordNumber}</strong></span>}
                </div>
              </div>
            </div>
            <div className="patient-cpf-privacy">
              <span>CPF</span>
              <strong>{showCpf ? formattedCpf(selectedPatient.cpf) : maskedCpf(selectedPatient.cpf)}</strong>
              <button type="button" onClick={() => setShowCpf(value => !value)} disabled={!cpfDigits(selectedPatient.cpf)} aria-label={showCpf ? "Ocultar CPF" : "Mostrar CPF"} aria-pressed={showCpf}>
                {showCpf ? <EyeOff size={15} /> : <Eye size={15} />}{showCpf ? "Ocultar" : "Mostrar"}
              </button>
            </div>
          </div>
          <ClinicalAlertsBand />
        </section>
      )}
      {!selectedPatientId ? (
        <div className="medical-record-empty">
          <FilePlus2 size={36} />
          <strong>Selecione um paciente</strong>
          <span>
            Escolha um paciente para consultar ou criar registros clínicos.
          </span>
        </div>
      ) : loading ? (
        <div className="medical-record-empty">Carregando prontuário…</div>
      ) : displayedRecords.length === 0 ? (
        <div className="medical-record-empty">
          <FilePlus2 size={36} />
          <strong>Nenhum registro clínico</strong>
          <span>
            Crie o primeiro registro deste paciente usando o botão acima.
          </span>
        </div>
      ) : (
        <div className="medical-timeline">
          {displayedRecords.map((record) => {
            const isEditingRecord = Boolean(editing) && (editing?.id ? Number(editing.id) === Number(record.id) : !record.id);
            const canCompose = Boolean(enableExamRequests && record.id && Number(composingRecordId) === Number(record.id));
            return <RecordTimelineCard
              key={isEditingRecord ? "active-editor" : String(record.id)}
              record={record}
              isEditing={isEditingRecord}
              canEdit={Boolean(allowNewRecord && !editing)}
              canCompose={canCompose}
              onRetify={() => setEditing({ ...record, recordDate: formatDateInput(record.recordDate) })}
              onSave={saveRecord}
              onPersisted={syncSavedRecord}
              onFinish={() => setEditing(null)}
              onChanged={() => reload(selectedPatientId)}
            />;
          })}
        </div>
      )}
    </>
  );
}
