import React, { useState } from "react";
import { Eye, FileImage, FileText, Plus, Upload, X } from "lucide-react";
import type { Row } from "../lib/app";
import { API, money, request } from "../lib/app";
export function AppointmentModal({
  initial,
  meta,
  onClose,
  onSave,
}: {
  initial: Row;
  meta: any;
  date: string;
  onClose: () => void;
  onSave: (data: Row) => void;
}) {
  const [data, setData] = useState<Row>({ ...initial });
  const [patientSearch, setPatientSearch] = useState("");
  const [patientPickerOpen, setPatientPickerOpen] = useState(false);
  const [attachmentFiles, setAttachmentFiles] = useState<File[]>([]);
  const [examUploads, setExamUploads] = useState<{ examType: string; examDate: string; file: File | null }[]>([]);
  const [savedAttachments, setSavedAttachments] = useState<Row[]>(initial.attachments || []);
  const [dragging, setDragging] = useState(false);
  const update = (key: string, value: any) =>
    setData({ ...data, [key]: value });
  const itemType = data.itemType || "ATENDIMENTO";
  const attendances = (meta.attendances || []).filter(
    (x: Row) =>
      !data.insuranceId || Number(x.insuranceId) === Number(data.insuranceId),
  );
  const normalizedPatientSearch = patientSearch.trim().toLocaleLowerCase("pt-BR");
  const filteredPatients = (meta.patients || []).filter((patient: Row) => {
    if (!normalizedPatientSearch) return true;
    return String(patient.fullName || "").toLocaleLowerCase("pt-BR").includes(normalizedPatientSearch);
  });
  const selectedPatient = (meta.patients || []).find((patient: Row) => Number(patient.id) === Number(data.patientId));
  const patientOptions = selectedPatient && !filteredPatients.some((patient: Row) => Number(patient.id) === Number(selectedPatient.id))
    ? [selectedPatient, ...filteredPatients]
    : filteredPatients;
  const addAttachments = (files: FileList | null) => {
    if (!files) return;
    const incoming = Array.from(files);
    if (incoming.some(file => !["application/pdf", "image/jpeg", "image/png"].includes(file.type))) {
      alert("Envie apenas arquivos PDF, JPG ou PNG.");
      return;
    }
    if (incoming.some(file => file.size > 10 * 1024 * 1024)) {
      alert("Cada arquivo deve ter no máximo 10 MB.");
      return;
    }
    setAttachmentFiles(current => [...current, ...incoming].slice(0, 10));
  };
  const fileSize = (bytes: number) => bytes < 1024 * 1024 ? `${Math.round(bytes / 1024)} KB` : `${(bytes / 1024 / 1024).toFixed(1)} MB`;
  const iconFor = (mime: string) => mime.startsWith("image/") ? <FileImage size={18} /> : <FileText size={18} />;
  const viewAttachment = async (attachment: Row) => {
    const response = await fetch(`${API}${attachment.url}`, { headers: { Authorization: `Bearer ${localStorage.getItem("medclinic_token") || ""}` } });
    if (!response.ok) return;
    const blobUrl = URL.createObjectURL(await response.blob());
    window.open(blobUrl, "_blank", "noopener,noreferrer");
    setTimeout(() => URL.revokeObjectURL(blobUrl), 60000);
  };
  const removeSavedAttachment = async (attachment: Row) => {
    if (!confirm(`Remover o anexo "${attachment.fileName}"?`)) return;
    try {
      await request(`/appointment-attachments/${attachment.id}`, { method: "DELETE" });
      setSavedAttachments(current => current.filter(item => item.id !== attachment.id));
    } catch (error: any) { alert(error.message); }
  };
  const handleDrop = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault(); setDragging(false); addAttachments(event.dataTransfer.files);
  };
  return (
    <div className="modal-backdrop">
      <div className="modal appointment-modal">
        <div className="modal-header">
          <div>
            <p className="eyebrow">AGENDA</p>
            <h2>{initial.id ? "Editar agendamento" : "Novo agendamento"}</h2>
          </div>
          <button className="icon-button" onClick={onClose}>
            <X size={19} />
          </button>
        </div>
        <div className="modal-fields">
          <label className="appointment-patient-field">
            Paciente
            <div className="appointment-patient-picker">
              <input
                className="appointment-patient-search"
                type="search"
                value={patientSearch || selectedPatient?.fullName || ""}
                onFocus={() => setPatientPickerOpen(true)}
                onBlur={() => setTimeout(() => setPatientPickerOpen(false), 120)}
                onChange={(e) => {
                  setPatientSearch(e.target.value);
                  setPatientPickerOpen(true);
                  if (!e.target.value) update("patientId", "");
                }}
                placeholder="Consultar por nome…"
                aria-label="Consultar paciente por nome"
              />
              {patientPickerOpen && (
                <div className="appointment-patient-options" role="listbox">
                  {patientOptions.length ? patientOptions.map((x: Row) => (
                    <button
                      type="button"
                      key={x.id}
                      className={Number(data.patientId) === Number(x.id) ? "selected" : ""}
                      onMouseDown={(e) => e.preventDefault()}
                      onClick={() => {
                        update("patientId", x.id);
                        setPatientSearch(x.fullName);
                        setPatientPickerOpen(false);
                      }}
                    >
                      {x.fullName}
                    </button>
                  )) : <span className="appointment-patient-empty">Nenhum paciente encontrado.</span>}
                </div>
              )}
            </div>
          </label>
          <label>
            Médico
            <select
              value={data.doctorId || ""}
              onChange={(e) => update("doctorId", e.target.value)}
            >
              <option value="">Selecione…</option>
              {meta.doctors.map((x: Row) => (
                <option key={x.id} value={x.id}>
                  {x.fullName}
                </option>
              ))}
            </select>
          </label>
          <label>
            Convênio
            <select
              value={data.insuranceId || ""}
              onChange={(e) =>
                setData({
                  ...data,
                  insuranceId: e.target.value,
                  attendanceId: "",
                })
              }
            >
              <option value="">Selecione…</option>
              {meta.insurances.map((x: Row) => (
                <option key={x.id} value={x.id}>
                  {x.name}
                </option>
              ))}
            </select>
          </label>
          <label>
            Tipo
            <select
              value={itemType}
              onChange={(e) =>
                setData({
                  ...data,
                  itemType: e.target.value,
                  attendanceId: "",
                  procedureId: "",
                })
              }
            >
              <option value="ATENDIMENTO">Atendimento</option>
              <option value="PROCEDIMENTO">Procedimento</option>
            </select>
          </label>
          {itemType === "ATENDIMENTO" ? (
            <label>
              Atendimento
              <select
                value={data.attendanceId || ""}
                onChange={(e) => update("attendanceId", e.target.value)}
              >
                <option value="">Selecione…</option>
                {attendances.map((x: Row) => (
                  <option key={x.id} value={x.id}>
                    {x.name}
                    {x.insurance?.name ? ` · ${x.insurance.name}` : ""}
                  </option>
                ))}
              </select>
            </label>
          ) : (
            <label>
              Procedimento
              <select
                value={data.procedureId || ""}
                onChange={(e) => update("procedureId", e.target.value)}
              >
                <option value="">Selecione…</option>
                {meta.procedures.map((x: Row) => (
                  <option key={x.id} value={x.id}>
                    {x.name} · {money(x.value)}
                  </option>
                ))}
              </select>
            </label>
          )}
          <label>
            Status
            <select
              value={data.status || "AGENDADO"}
              onChange={(e) => update("status", e.target.value)}
            >
              <option value="AGENDADO">Agendado</option>
              <option value="CONFIRMADO">Confirmado</option>
              <option value="EM_ATENDIMENTO">Em Atendimento</option>
              <option value="ATENDIDO">Atendido</option>
              <option value="FALTOU">Faltou</option>
            </select>
          </label>
          <label>
            Horário
            <select
              value={data.scheduledTime || "08:00"}
              onChange={(e) => update("scheduledTime", e.target.value)}
            >
              {Array.from({ length: 49 }, (_, i) => {
                const minutes = 8 * 60 + i * 15;
                const t = `${String(Math.floor(minutes / 60)).padStart(2, "0")}:${String(minutes % 60).padStart(2, "0")}`;
                return <option key={t}>{t}</option>;
              })}
            </select>
          </label>
          <label className="wide">
            Observação
            <textarea
              rows={4}
              value={data.notes || ""}
              onChange={(e) => update("notes", e.target.value)}
            />
          </label>
          <label className="wide appointment-attachments-field">
            <span className="appointment-attachments-title">Anexos <b>{savedAttachments.length + attachmentFiles.length + examUploads.length}</b></span>
            {savedAttachments.length + attachmentFiles.length > 0 && <div className="appointment-attachment-list">{savedAttachments.map(attachment => <div className="appointment-attachment-chip" key={`saved-${attachment.id}`}><button type="button" className="appointment-attachment-main" onClick={() => viewAttachment(attachment)}>{iconFor(attachment.mimeType)}<span><strong>{attachment.fileName}</strong><small>{attachment.examType ? `${({ LABORATORIAIS: "Laboratoriais", USG_TRANSVAGINAL: "USG Transvaginal", USG_MANA: "USG Mana", PREVENTIVO: "Preventivo" } as Record<string, string>)[attachment.examType] || attachment.examType} · ${attachment.examDate ? new Date(`${String(attachment.examDate).slice(0, 10)}T12:00:00`).toLocaleDateString("pt-BR") : "Data não informada"} · ` : ""}{fileSize(attachment.sizeBytes)} · {attachment.uploadedBy?.fullName || "Usuário"} · {new Date(attachment.uploadedAt).toLocaleDateString("pt-BR")}</small></span></button><button type="button" className="appointment-attachment-view" onClick={() => viewAttachment(attachment)} title="Visualizar"><Eye size={16} /></button><button type="button" className="appointment-attachment-remove" onClick={() => removeSavedAttachment(attachment)} title="Remover"><X size={16} /></button></div>)}{attachmentFiles.map((file, index) => <div className="appointment-attachment-chip" key={`new-${file.name}-${index}`}><button type="button" className="appointment-attachment-main"><FileText size={18} /><span><strong>{file.name}</strong><small>Novo anexo · {fileSize(file.size)}</small></span></button><button type="button" className="appointment-attachment-remove" onClick={() => setAttachmentFiles(current => current.filter((_, fileIndex) => fileIndex !== index))} title="Remover"><X size={16} /></button></div>)}</div>}
            <div className={`appointment-attachment-dropzone ${dragging ? "dragging" : ""}`} onDragOver={event => { event.preventDefault(); setDragging(true); }} onDragLeave={() => setDragging(false)} onDrop={handleDrop}><span>Arraste arquivos aqui ou</span><button type="button" className="appointment-attachment-upload-button" onClick={event => { event.preventDefault(); (event.currentTarget.nextElementSibling as HTMLInputElement)?.click(); }}><Upload size={16} /> Anexar arquivo</button><input className="appointment-hidden-file-input" type="file" multiple accept="application/pdf,image/jpeg,image/png" onChange={e => addAttachments(e.target.files)} /></div>
            <small>PDF, JPG ou PNG, até 10 MB por arquivo. Cada anexo registra quem enviou e quando.</small>
          </label>
          <section className="wide appointment-exam-attachments">
            <div className="appointment-attachments-title"><span>Exames anexados</span><button type="button" className="secondary" disabled={examUploads.length >= 10} onClick={() => setExamUploads(current => current.length >= 10 ? current : [...current, { examType: "", examDate: "", file: null }])}><Plus size={15} /> Adicionar exame</button></div>
            {examUploads.map((exam, index) => <div className="appointment-exam-upload-row" key={index}>
              <label>Tipo do exame<select value={exam.examType} onChange={event => setExamUploads(current => current.map((item, itemIndex) => itemIndex === index ? { ...item, examType: event.target.value } : item))}><option value="">Selecione…</option><option value="LABORATORIAIS">Laboratoriais</option><option value="USG_TRANSVAGINAL">USG Transvaginal</option><option value="USG_MANA">USG Mana</option><option value="PREVENTIVO">Preventivo</option></select></label>
              <label>Data do exame<input type="date" value={exam.examDate} onChange={event => setExamUploads(current => current.map((item, itemIndex) => itemIndex === index ? { ...item, examDate: event.target.value } : item))} /></label>
              <label className="appointment-exam-file">Anexar exame<input type="file" accept="application/pdf,image/jpeg,image/png" onChange={event => { const file = event.target.files?.[0] || null; if (file && file.size > 10 * 1024 * 1024) { alert("O arquivo deve ter no máximo 10 MB."); event.target.value = ""; return; } setExamUploads(current => current.map((item, itemIndex) => itemIndex === index ? { ...item, file } : item)); }} /><small>{exam.file?.name || "Nenhum arquivo selecionado"}</small></label>
              <button type="button" className="appointment-attachment-remove" onClick={() => setExamUploads(current => current.filter((_, itemIndex) => itemIndex !== index))} title="Remover exame"><X size={16} /></button>
            </div>)}
            <small>Tipos aceitos: PDF, JPG ou PNG, até 10 MB por exame.</small>
          </section>
        </div>
        <div className="modal-footer">
          <button className="secondary" onClick={onClose}>
            Cancelar
          </button>
          <button className="primary" onClick={() => { const incomplete = examUploads.some(exam => !exam.examType || !exam.examDate || !exam.file); if (incomplete) { alert("Preencha tipo, data e arquivo de cada exame anexado."); return; } onSave({ ...data, attachmentFiles, examUploads: examUploads as Row[] }); }}>
            Salvar agendamento
          </button>
        </div>
      </div>
    </div>
  );
}
