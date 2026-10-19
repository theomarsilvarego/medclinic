import React, { useState } from "react";
import { FileText, X } from "lucide-react";
import type { Row } from "../lib/app";
import { money } from "../lib/app";
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
            Anexos do agendamento
            <input type="file" multiple accept="application/pdf,image/jpeg,image/png" onChange={e => addAttachments(e.target.files)} />
            <small>PDF, JPG ou PNG · até 10 MB por arquivo · máximo de 10 arquivos.</small>
            {attachmentFiles.length > 0 && <div className="appointment-attachment-list">{attachmentFiles.map((file, index) => <div className="appointment-attachment-chip" key={`${file.name}-${index}`}><FileText size={15} /><span>{file.name}</span><button type="button" onClick={() => setAttachmentFiles(current => current.filter((_, fileIndex) => fileIndex !== index))} aria-label={`Remover ${file.name}`}><X size={14} /></button></div>)}</div>}
          </label>
        </div>
        <div className="modal-footer">
          <button className="secondary" onClick={onClose}>
            Cancelar
          </button>
          <button className="primary" onClick={() => onSave({ ...data, attachmentFiles })}>
            Salvar agendamento
          </button>
        </div>
      </div>
    </div>
  );
}
