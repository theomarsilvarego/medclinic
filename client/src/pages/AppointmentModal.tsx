import React, { useState } from "react";
import {
  Calendar,
  CalendarDays,
  Clock3,
  Eye,
  FileImage,
  FileText,
  Plus,
  Stethoscope,
  Syringe,
  Upload,
  X,
} from "lucide-react";
import type { Row } from "../lib/app";
import { API, money, request } from "../lib/app";

const examLabels: Record<string, string> = {
  laboratorial: "Exames laboratoriais",
  usg_tv: "USG TV",
  usg_mama: "USG Mama",
  preventivo: "Preventivo",
  LABORATORIAIS: "Exames laboratoriais",
  USG_TRANSVAGINAL: "USG TV",
  USG_MANA: "USG Mama",
  PREVENTIVO: "Preventivo",
};

export function AppointmentModal({
  initial,
  meta,
  date,
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
  const [examUploads, setExamUploads] = useState<
    { examType: string; examDate: string; file: File | null }[]
  >([]);
  const [savedAttachments, setSavedAttachments] = useState<Row[]>(
    (initial.attachments || []).filter((item: Row) => Boolean(item.examType)),
  );

  const update = (key: string, value: any) =>
    setData({ ...data, [key]: value });
  const itemType = data.itemType || "ATENDIMENTO";
  const attendances = (meta.attendances || []).filter(
    (x: Row) =>
      !data.insuranceId || Number(x.insuranceId) === Number(data.insuranceId),
  );
  const normalizedPatientSearch = patientSearch
    .trim()
    .toLocaleLowerCase("pt-BR");
  const filteredPatients = (meta.patients || []).filter((patient: Row) => {
    if (!normalizedPatientSearch) return true;
    return String(patient.fullName || "")
      .toLocaleLowerCase("pt-BR")
      .includes(normalizedPatientSearch);
  });
  const selectedPatient = (meta.patients || []).find(
    (patient: Row) => Number(patient.id) === Number(data.patientId),
  );
  const patientOptions =
    selectedPatient &&
    !filteredPatients.some(
      (patient: Row) => Number(patient.id) === Number(selectedPatient.id),
    )
      ? [selectedPatient, ...filteredPatients]
      : filteredPatients;
  const formattedDate = new Date(`${date}T12:00:00`).toLocaleDateString(
    "pt-BR",
    {
      weekday: "long",
      day: "2-digit",
      month: "long",
    },
  );
  const fileSize = (bytes: number) =>
    bytes < 1024 * 1024
      ? `${Math.round(bytes / 1024)} KB`
      : `${(bytes / 1024 / 1024).toFixed(1)} MB`;
  const iconFor = (mime: string) =>
    mime.startsWith("image/") ? (
      <FileImage size={18} />
    ) : (
      <FileText size={18} />
    );

  const viewAttachment = async (attachment: Row) => {
    const response = await fetch(`${API}${attachment.url}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("medclinic_token") || ""}`,
      },
    });
    if (!response.ok) return;
    const blobUrl = URL.createObjectURL(await response.blob());
    window.open(blobUrl, "_blank", "noopener,noreferrer");
    setTimeout(() => URL.revokeObjectURL(blobUrl), 60000);
  };

  const removeSavedAttachment = async (attachment: Row) => {
    if (!confirm(`Remover o anexo "${attachment.fileName}"?`)) return;
    try {
      await request(`/appointment-attachments/${attachment.id}`, {
        method: "DELETE",
      });
      setSavedAttachments((current) =>
        current.filter((item) => item.id !== attachment.id),
      );
    } catch (error: any) {
      alert(error.message);
    }
  };

  const save = () => {
    const missing = [
      !data.patientId && "Paciente",
      !data.doctorId && "Médico",
      !data.insuranceId && "Convênio",
      itemType === "ATENDIMENTO" && !data.attendanceId && "Atendimento",
      itemType === "PROCEDIMENTO" && !data.procedureId && "Procedimento",
    ].filter(Boolean) as string[];
    const incompleteExam = examUploads.some((exam) => !exam.examType || !exam.file);
    if (missing.length) {
      alert(`Preencha os campos obrigatórios: ${missing.join(", ")}.`);
      return;
    }
    if (incompleteExam) {
      alert("Preencha a classificação e selecione um arquivo para cada exame anexado.");
      return;
    }
    onSave({ ...data, examUploads: examUploads as Row[] });
  };

  return (
    <div className="modal-backdrop appointment-backdrop">
      <div className="modal">
        <div className="modal-header appointment-modal-header">
          <div>
            <h2>{initial.id ? "Editar agendamento" : "Novo agendamento"}</h2>
            <div className="appointment-context">
              <span>
                <CalendarDays size={19} />
                {formattedDate}
              </span>
              <span>
                <Clock3 size={19} />
                {data.scheduledTime || "08:00"}
              </span>
            </div>
          </div>
          <button className="icon-button" onClick={onClose} aria-label="Fechar">
            <X size={21} />
          </button>
        </div>

        <div className="modal-fields appointment-modal-fields">
          <section className="appointment-section appointment-people-section">
            <label className="appointment-patient-field">
              <div className="appointment-patient-picker">
                <input
                  className="appointment-patient-search"
                  type="search"
                  value={patientSearch || selectedPatient?.fullName || ""}
                  onFocus={() => setPatientPickerOpen(true)}
                  onBlur={() =>
                    setTimeout(() => setPatientPickerOpen(false), 120)
                  }
                  onChange={(e) => {
                    setPatientSearch(e.target.value);
                    setPatientPickerOpen(true);
                    if (!e.target.value) update("patientId", "");
                  }}
                  placeholder="Buscar paciente por nome"
                  aria-label="Buscar paciente por nome"
                />
                {patientPickerOpen && (
                  <div className="appointment-patient-options" role="listbox">
                    {patientOptions.length ? (
                      patientOptions.map((patient: Row) => (
                        <button
                          type="button"
                          key={patient.id}
                          className={
                            Number(data.patientId) === Number(patient.id)
                              ? "selected"
                              : ""
                          }
                          onMouseDown={(e) => e.preventDefault()}
                          onClick={() => {
                            update("patientId", patient.id);
                            setPatientSearch(patient.fullName);
                            setPatientPickerOpen(false);
                          }}
                        >
                          {patient.fullName}
                        </button>
                      ))
                    ) : (
                      <span className="appointment-patient-empty">
                        Nenhum paciente encontrado.
                      </span>
                    )}
                  </div>
                )}
              </div>
            </label>
            <label>
              <select
                required
                value={data.doctorId || ""}
                onChange={(e) => update("doctorId", e.target.value)}
              >
                <option value="">Selecione o médico</option>
                {meta.doctors.map((x: Row) => (
                  <option key={x.id} value={x.id}>
                    {x.fullName}
                  </option>
                ))}
              </select>
            </label>
            <label>
              <select
                required
                value={data.insuranceId || ""}
                onChange={(e) =>
                  setData({
                    ...data,
                    insuranceId: e.target.value,
                    attendanceId: "",
                  })
                }
              >
                <option value="">Selecione o convênio</option>
                {meta.insurances.map((x: Row) => (
                  <option key={x.id} value={x.id}>
                    {x.name}
                  </option>
                ))}
              </select>
            </label>
          </section>

          <section className="appointment-section appointment-care-section">
            <div
              className="appointment-type-toggle"
              role="tablist"
              aria-label="Tipo de agendamento"
            >
              <button
                type="button"
                className={itemType === "ATENDIMENTO" ? "active" : ""}
                onClick={() =>
                  setData({
                    ...data,
                    itemType: "ATENDIMENTO",
                    attendanceId: "",
                    procedureId: "",
                  })
                }
              >
                <Stethoscope size={19} /> Atendimento
              </button>
              <button
                type="button"
                className={itemType === "PROCEDIMENTO" ? "active" : ""}
                onClick={() =>
                  setData({
                    ...data,
                    itemType: "PROCEDIMENTO",
                    attendanceId: "",
                    procedureId: "",
                  })
                }
              >
                <Syringe size={18} /> Procedimento
              </button>
            </div>
            {itemType === "ATENDIMENTO" ? (
              <label>
                <select
                  required
                  value={data.attendanceId || ""}
                  onChange={(e) => update("attendanceId", e.target.value)}
                >
                  <option value="">Selecione o atendimento</option>
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
                <select
                  required
                  value={data.procedureId || ""}
                  onChange={(e) => update("procedureId", e.target.value)}
                >
                  <option value="">Selecione o procedimento</option>
                  {meta.procedures.map((x: Row) => (
                    <option key={x.id} value={x.id}>
                      {x.name} · {money(x.value)}
                    </option>
                  ))}
                </select>
              </label>
            )}
            <div className="appointment-inline-fields">
              <label>
                <select
                  value={data.status || "AGENDADO"}
                  onChange={(e) => update("status", e.target.value)}
                >
                  <option value="AGENDADO">Agendado</option>
                  <option value="CONFIRMADO">Confirmado</option>
                  <option value="EM_ATENDIMENTO">Em atendimento</option>
                  <option value="ATENDIDO">Atendido</option>
                  <option value="FALTOU">Faltou</option>
                </select>
              </label>
              <label>
                <select
                  value={data.scheduledTime || "08:00"}
                  onChange={(e) => update("scheduledTime", e.target.value)}
                >
                  {Array.from({ length: 49 }, (_, i) => {
                    const minutes = 8 * 60 + i * 15;
                    const time = `${String(Math.floor(minutes / 60)).padStart(2, "0")}:${String(minutes % 60).padStart(2, "0")}`;
                    return <option key={time}>{time}</option>;
                  })}
                </select>
              </label>
            </div>
            <label className="appointment-notes-field">
              <textarea
                rows={3}
                value={data.notes || ""}
                onChange={(e) => update("notes", e.target.value)}
                placeholder="Informações úteis para a recepção ou para o médico (opcional)"
              />
            </label>
          </section>

          <section className="appointment-section appointment-exam-attachments">
            <div className="appointment-attachments-title">
              <span>
                Exames anexados{" "}
                <b>{savedAttachments.length + examUploads.length}</b>
              </span>
              <button
                type="button"
                className="secondary"
                disabled={examUploads.length >= 10}
                onClick={() =>
                  setExamUploads((current) =>
                    current.length >= 10
                      ? current
                      : [
                          ...current,
                          { examType: "", examDate: "", file: null },
                        ],
                  )
                }
              >
                <Plus size={16} /> Adicionar exame
              </button>
            </div>
            {savedAttachments.length > 0 && (
              <div className="appointment-attachment-list">
                {savedAttachments.map((attachment) => (
                  <div
                    className="appointment-attachment-chip"
                    key={`saved-${attachment.id}`}
                  >
                    <button
                      type="button"
                      className="appointment-attachment-main"
                      onClick={() => viewAttachment(attachment)}
                      aria-label={`Visualizar ${attachment.fileName}`}
                    >
                      {iconFor(attachment.mimeType)}
                      <span>
                        <strong>{attachment.fileName}</strong>
                        <small>
                          {examLabels[attachment.examType] ||
                            attachment.examType}{" "}
                          ·{" "}
                          {attachment.examDate
                            ? new Date(
                                `${String(attachment.examDate).slice(0, 10)}T12:00:00`,
                              ).toLocaleDateString("pt-BR")
                            : "Data não informada"}{" "}
                          · {fileSize(attachment.sizeBytes)}
                        </small>
                      </span>
                    </button>
                    <button
                      type="button"
                      className="appointment-attachment-view"
                      onClick={() => viewAttachment(attachment)}
                      title="Visualizar"
                      aria-label={`Visualizar ${attachment.fileName}`}
                    >
                      <Eye size={16} />
                    </button>
                    <button
                      type="button"
                      className="appointment-attachment-remove"
                      onClick={() => removeSavedAttachment(attachment)}
                      title="Remover"
                      aria-label={`Remover anexo ${attachment.fileName}`}
                    >
                      <X size={16} />
                    </button>
                  </div>
                ))}
              </div>
            )}
            {examUploads.map((exam, index) => (
              <div className="appointment-exam-upload-row" key={index}>
                <label>
                  <span>Classificação</span>
                  <select
                    value={exam.examType}
                    onChange={(event) =>
                      setExamUploads((current) =>
                        current.map((item, itemIndex) =>
                          itemIndex === index
                            ? { ...item, examType: event.target.value }
                            : item,
                        ),
                      )
                    }
                  >
                    <option value="">Selecione o tipo</option>
                    {Object.entries(examLabels).filter(([value]) => !value.toUpperCase().startsWith("LABORATORIAIS") && !["USG_TRANSVAGINAL", "USG_MANA", "PREVENTIVO"].includes(value)).map(([value, label]) => (
                      <option key={value} value={value}>
                        {label}
                      </option>
                    ))}
                  </select>
                </label>
                <label>
                  <span>Data do exame (opcional)</span>
                  <input
                    type="date"
                    value={exam.examDate}
                    onChange={(event) =>
                      setExamUploads((current) =>
                        current.map((item, itemIndex) =>
                          itemIndex === index
                            ? { ...item, examDate: event.target.value }
                            : item,
                        ),
                      )
                    }
                  />
                </label>
                <label className="appointment-exam-file">
                  <span>Arquivo (PDF, JPG ou PNG)</span>
                  <input
                    type="file"
                    accept="application/pdf,image/jpeg,image/png"
                    aria-label="Selecionar arquivo do exame (PDF, JPG ou PNG)"
                    onChange={(event) => {
                      const file = event.target.files?.[0] || null;
                      if (file && file.size > 10 * 1024 * 1024) {
                        alert("O arquivo deve ter no máximo 10 MB.");
                        event.target.value = "";
                        return;
                      }
                      setExamUploads((current) =>
                        current.map((item, itemIndex) =>
                          itemIndex === index ? { ...item, file } : item,
                        ),
                      );
                    }}
                  />
                </label>
                <button
                  type="button"
                  className="appointment-attachment-remove appointment-exam-remove"
                  onClick={() =>
                    setExamUploads((current) =>
                      current.filter((_, itemIndex) => itemIndex !== index),
                    )
                  }
                  title="Remover exame"
                  aria-label={`Remover exame ${index + 1}`}
                >
                  <X size={16} />
                </button>
              </div>
            ))}
          </section>
        </div>

        <div className="modal-footer appointment-modal-footer">
          <button className="secondary" onClick={onClose}>
            Cancelar
          </button>
          <button className="primary" onClick={save}>
            Salvar agendamento
          </button>
        </div>
      </div>
    </div>
  );
}
