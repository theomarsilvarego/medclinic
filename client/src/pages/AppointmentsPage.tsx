import React, { useEffect, useMemo, useState } from "react";
import { ChevronLeft, ChevronRight, Plus, QrCode } from "lucide-react";
import type { Row } from "../lib/app";
import { request } from "../lib/app";
import { submitAppointment } from "../lib/appointments";
import { AppointmentModal } from "./AppointmentModal";
import { AnamnesisAppointmentModal } from "./AnamnesisAppointmentModal";

function localDate(date: Date) {
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
}

function isSindicatoInsurance(name: unknown) {
  const normalized = String(name || "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .trim()
    .toUpperCase();
  return /^SINDICATO(?:$|[\s\-/])/.test(normalized);
}

function isEligibleAppointment(row: Row) {
  if (!isSindicatoInsurance(row.insurance?.name)) return false;
  if (
    row.patient?.insuranceCode === null ||
    row.patient?.insuranceCode === undefined
  )
    return true;
  return isSindicatoInsurance(row.patient?.insuranceName);
}

export function AppointmentsPage({
  user,
}: {
  user: any;
}) {
  const canManage =
    user.profile === "ADMINISTRADOR" || user.profile === "SECRETARIA";
  const [date, setDate] = useState(localDate(new Date()));
  const [rows, setRows] = useState<Row[]>([]);
  const [meta, setMeta] = useState<any>({
    patients: [],
    doctors: [],
    insurances: [],
    attendances: [],
    procedures: [],
    injectables: [],
  });
  const [editing, setEditing] = useState<Row | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [selectedAnamnesis, setSelectedAnamnesis] = useState<Row | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const slots = useMemo(
    () =>
      Array.from({ length: 49 }, (_, index) => {
        const minutes = 8 * 60 + index * 15;
        return `${String(Math.floor(minutes / 60)).padStart(2, "0")}:${String(minutes % 60).padStart(2, "0")}`;
      }),
    [],
  );
  const today = localDate(new Date());
  const isToday = date === today;
  const weekday = new Date(`${date}T12:00:00`).toLocaleDateString("pt-BR", {
    weekday: "long",
    day: "2-digit",
    month: "long",
    year: "numeric",
  });

  async function load(targetDate = date) {
    setLoading(true);
    setError("");
    try {
      const [day, metadata] = await Promise.all([
        request(`/appointments?date=${targetDate}`),
        meta.patients.length
          ? Promise.resolve(meta)
          : request("/appointments/meta"),
      ]);
      setRows(day || []);
      if (!meta.patients.length) setMeta(metadata);
    } catch (cause: any) {
      setError(cause.message);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    void load();
  }, [date]);

  function openNew(time: string) {
    setEditing({
      appointmentDate: date,
      scheduledTime: time,
      status: "AGENDADO",
      itemType: "ATENDIMENTO",
    });
    setModalOpen(true);
  }

  function openEdit(row: Row) {
    setEditing(row);
    setModalOpen(true);
  }

  function navigateDate(days: number) {
    const next = new Date(`${date}T12:00:00`);
    next.setDate(next.getDate() + days);
    setDate(localDate(next));
  }

  async function save(data: Row) {
    try {
      const appointmentDate = String(data.appointmentDate || date).slice(0, 10);
      await submitAppointment({ ...data, appointmentDate }, editing?.id);
      setModalOpen(false);
      setEditing(null);
      if (appointmentDate !== date) setDate(appointmentDate);
      else await load(appointmentDate);
    } catch (cause: any) {
      setError(cause.message);
    }
  }

  async function remove(id: number) {
    if (!confirm("Excluir este agendamento?")) return;
    try {
      await request(`/appointments/${id}`, { method: "DELETE" });
      await load();
    } catch (cause: any) {
      setError(cause.message);
    }
  }

  const byTime = (time: string) =>
    rows.filter((row) => row.scheduledTime === time);

  return (
    <>
      <div className="page-heading">
        <div>
          <p className="eyebrow">AGENDA CLÍNICA</p>
          <h1>Agendamentos</h1>
          <p className="muted">
            {weekday[0].toUpperCase() + weekday.slice(1)} · horários de 08:00 a
            20:00 · intervalos de 15 min
          </p>
        </div>
        {canManage && (
          <button
            className="primary"
            type="button"
            onClick={() => openNew("08:00")}
          >
            <Plus size={17} /> Novo agendamento
          </button>
        )}
      </div>
      {error && (
        <div className="error page-error" role="alert">
          {error}
        </div>
      )}
      <div className="agenda-toolbar">
        <div className="agenda-date-controls">
          <button
            className="agenda-nav-button"
            type="button"
            onClick={() => navigateDate(-1)}
            title="Dia anterior"
            aria-label="Dia anterior"
          >
            <ChevronLeft size={17} />
          </button>
          <label>
            <input
              type="date"
              value={date}
              onChange={(event) => setDate(event.target.value)}
            />
          </label>
          <button
            className="agenda-nav-button"
            type="button"
            onClick={() => navigateDate(1)}
            title="Próximo dia"
            aria-label="Próximo dia"
          >
            <ChevronRight size={17} />
          </button>
          <button
            className="today-button"
            type="button"
            onClick={() => setDate(today)}
            disabled={isToday}
          >
            Hoje
          </button>
        </div>
      </div>
      <div className="table-card agenda-card">
        <div className="table-head">
          <strong>
            {loading
              ? "Carregando…"
              : `${rows.length} agendamento${rows.length === 1 ? "" : "s"}`}
          </strong>
          <span className="muted">
            {canManage
              ? "Clique em um horário livre para agendar"
              : "Lista do dia"}
          </span>
        </div>
        {!loading && (
          <div className="agenda-grid">
            {slots.map((time) => (
              <div className="agenda-row" key={time}>
                <div className="agenda-time">{time}</div>
                <div className="agenda-slots">
                  {byTime(time).map((row) => (
                    <div
                      className={`appointment-chip ${String(row.status || "").toLowerCase()}`}
                      key={row.id}
                      onClick={() => canManage && openEdit(row)}
                    >
                      <strong>{row.patient?.fullName}</strong>
                      <span>{row.doctor?.fullName}</span>
                      <small>
                        {row.itemType === "PROCEDIMENTO"
                          ? row.procedure?.name
                          : row.itemType === "INJETAVEL"
                            ? row.injectable?.name
                            : row.itemType === "COLETA"
                              ? "Exame de sangue"
                              : row.attendance?.name}{" "}
                        · {row.insurance?.name}
                      </small>
                      {canManage && isEligibleAppointment(row) && (
                        <button
                          className="anamnesis-chip-action"
                          type="button"
                          onClick={(event) => {
                            event.stopPropagation();
                            setSelectedAnamnesis(row);
                          }}
                          aria-label={`Abrir ficha de anamnese de ${row.patient?.fullName}`}
                          title="Ficha de anamnese · QR e WhatsApp"
                        >
                          <QrCode size={14} />
                          Ficha
                        </button>
                      )}
                      {canManage && (
                        <button
                          className="appointment-delete-button"
                          type="button"
                          onClick={(event) => {
                            event.stopPropagation();
                            void remove(Number(row.id));
                          }}
                          title="Excluir agendamento"
                          aria-label={`Excluir agendamento de ${row.patient?.fullName}`}
                        >
                          ×
                        </button>
                      )}
                    </div>
                  ))}
                  {canManage && byTime(time).length === 0 && (
                    <button
                      className="slot-empty"
                      type="button"
                      onClick={() => openNew(time)}
                    >
                      + Agendar neste horário
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
      {modalOpen && (
        <AppointmentModal
          initial={editing || {}}
          meta={meta}
          date={date}
          onClose={() => {
            setModalOpen(false);
            setEditing(null);
          }}
          onSave={save}
        />
      )}
      {selectedAnamnesis && (
        <AnamnesisAppointmentModal
          appointment={selectedAnamnesis}
          onClose={() => setSelectedAnamnesis(null)}
        />
      )}
    </>
  );
}
