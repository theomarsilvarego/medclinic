import React, { useEffect, useMemo, useState } from "react";
import {
  CalendarDays,
  ChevronLeft,
  ChevronRight,
  ClipboardList,
  Eye,
  Play,
  QrCode,
  X,
} from "lucide-react";
import type { Row } from "../lib/app";
import { request } from "../lib/app";
import { AnamnesisAppointmentModal } from "./AnamnesisAppointmentModal";

function isSindicatoInsurance(name: unknown) {
  const normalized = String(name || "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .trim()
    .toUpperCase();
  return /^SINDICATO(?:$|[\s\-/])/.test(normalized);
}

function isAnamnesisEligible(row: Row) {
  if (!isSindicatoInsurance(row.insurance?.name)) return false;
  if (
    row.patient?.insuranceCode === null ||
    row.patient?.insuranceCode === undefined
  )
    return true;
  return isSindicatoInsurance(row.patient?.insuranceName);
}

const localDate = (date: Date) =>
  `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
const statusLabel: Record<string, string> = {
  AGENDADO: "Agendado",
  CONFIRMADO: "Confirmado",
  EM_ATENDIMENTO: "Em Atendimento",
  ATENDIDO: "Atendido",
  FALTOU: "Faltou",
};

function moveDate(dateValue: string, days: number) {
  const date = new Date(`${dateValue}T12:00:00`);
  date.setDate(date.getDate() + days);
  return localDate(date);
}

export function DoctorAgendaPage({
  onOpenPatient,
  onViewRecord,
}: {
  onOpenPatient: (patientId: number, appointmentId: number) => void;
  onViewRecord: (patientId: number, appointmentId: number) => void;
}) {
  const [date, setDate] = useState(() => localDate(new Date()));
  const [rows, setRows] = useState<Row[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [selected, setSelected] = useState<Row | null>(null);
  const [selectedAnamnesis, setSelectedAnamnesis] = useState<Row | null>(null);
  const [startingId, setStartingId] = useState<number | null>(null);
  const today = localDate(new Date());
  const isToday = date === today;

  const weekday = useMemo(() => {
    const text = new Date(`${date}T12:00:00`).toLocaleDateString("pt-BR", {
      weekday: "long",
      day: "2-digit",
      month: "long",
      year: "numeric",
    });
    return text.charAt(0).toUpperCase() + text.slice(1);
  }, [date]);

  const selectedDateLabel = useMemo(() => {
    const text = new Date(`${date}T12:00:00`).toLocaleDateString("pt-BR", {
      day: "2-digit",
      month: "long",
      year: "numeric",
    });
    return text.charAt(0).toUpperCase() + text.slice(1);
  }, [date]);

  useEffect(() => {
    let active = true;
    setLoading(true);
    setError("");
    request(`/appointments?date=${date}`)
      .then((result) => {
        if (active) setRows(result || []);
      })
      .catch((e: any) => {
        if (active) {
          setRows([]);
          setError(e.message);
        }
      })
      .finally(() => {
        if (active) setLoading(false);
      });
    return () => {
      active = false;
    };
  }, [date]);

  const startAppointment = async (row: Row) => {
    setStartingId(Number(row.id));
    setError("");
    try {
      await request(`/appointments/${row.id}/start`, { method: "PATCH" });
      onOpenPatient(Number(row.patient?.id), Number(row.id));
    } catch (e: any) {
      setError(e.message);
    } finally {
      setStartingId(null);
    }
  };

  const confirmed = rows.filter((row) => row.status === "CONFIRMADO").length;
  const attended = rows.filter((row) => row.status === "ATENDIDO").length;

  return (
    <>
      <div className="doctor-page-heading">
        <div className="doctor-heading-copy">
          <p className="eyebrow">ÁREA MÉDICA</p>
          <h1>Agenda do dia</h1>
          <p className="doctor-date">{weekday}</p>
        </div>
        <div
          className="doctor-agenda-date-controls"
          aria-label="Navegação da agenda por data"
        >
          <button
            className="doctor-agenda-date-nav"
            type="button"
            aria-label="Dia anterior"
            title="Dia anterior"
            onClick={() => setDate((current) => moveDate(current, -1))}
          >
            <ChevronLeft size={18} />
          </button>
          <label className="doctor-agenda-date-input">
            <input
              type="date"
              value={date}
              onChange={(event) => {
                if (event.target.value) setDate(event.target.value);
              }}
              aria-label="Selecionar data da agenda"
            />
          </label>
          <button
            className="doctor-agenda-date-nav"
            type="button"
            aria-label="Próximo dia"
            title="Próximo dia"
            onClick={() => setDate((current) => moveDate(current, 1))}
          >
            <ChevronRight size={18} />
          </button>
          <button
            className="doctor-agenda-today"
            type="button"
            onClick={() => setDate(today)}
            disabled={isToday}
          >
            Hoje
          </button>
        </div>
      </div>
      {error && <div className="error page-error">{error}</div>}
      <div className="doctor-stat-grid">
        <div className="doctor-stat-card">
          <span>Pacientes agendados</span>
          <strong className="patients">{loading ? "—" : rows.length}</strong>
        </div>
        <div className="doctor-stat-card">
          <span>Confirmados</span>
          <strong className="confirmed">{loading ? "—" : confirmed}</strong>
        </div>
        <div className="doctor-stat-card">
          <span>Atendidos</span>
          <strong className="attended">{loading ? "—" : attended}</strong>
        </div>
      </div>
      <section className="doctor-agenda-card">
        <div className="doctor-agenda-header">
          <div>
            <h2>
              {isToday
                ? "Pacientes de hoje"
                : `Pacientes de ${selectedDateLabel}`}
            </h2>
            <p>Acesse os dados clínicos sem alterar o agendamento.</p>
          </div>
          <CalendarDays size={22} />
        </div>
        {loading ? (
          <div className="doctor-empty">Carregando agenda…</div>
        ) : rows.length === 0 ? (
          <div className="doctor-empty">
            <ClipboardList size={30} />
            <strong>
              {isToday
                ? "Nenhum paciente agendado para hoje"
                : "Nenhum paciente agendado nesta data"}
            </strong>
            <span>
              {isToday
                ? "A agenda do dia está livre."
                : `Nenhum agendamento encontrado em ${selectedDateLabel}.`}
            </span>
          </div>
        ) : (
          <div className="doctor-patient-list">
            {rows.map((row) => (
              <div className="doctor-patient-row" key={row.id}>
                <div className="doctor-time">{row.scheduledTime}</div>
                <div className="doctor-patient-info">
                  <div className="doctor-patient-name">
                    <strong>
                      {row.patient?.fullName || "Paciente não informado"}
                    </strong>
                    <span
                      className={`doctor-status ${String(row.status || "").toLowerCase()}`}
                    >
                      {statusLabel[row.status] || row.status}
                    </span>
                  </div>
                  <p>
                    {row.itemType === "PROCEDIMENTO"
                      ? row.procedure?.name
                      : row.attendance?.name || "Atendimento"}
                    {row.insurance?.name ? ` · ${row.insurance.name}` : ""}
                  </p>
                </div>
                <div className="doctor-agenda-actions">
                  {isAnamnesisEligible(row) && (
                    <button
                      className="doctor-anamnesis-icon"
                      type="button"
                      title="Ficha de anamnese · QR e WhatsApp"
                      aria-label={`Abrir ficha de anamnese de ${row.patient?.fullName}`}
                      onClick={() => setSelectedAnamnesis(row)}
                    >
                      <QrCode size={18} />
                    </button>
                  )}
                  {row.status === "ATENDIDO" ? (
                    <button
                      className="doctor-record-icon view-record"
                      type="button"
                      title={`Visualizar prontuário de ${row.patient?.fullName}`}
                      aria-label={`Visualizar prontuário de ${row.patient?.fullName}`}
                      onClick={() =>
                        onViewRecord(Number(row.patient?.id), Number(row.id))
                      }
                    >
                      <Eye size={18} />
                    </button>
                  ) : (
                    <button
                      className="doctor-record-icon"
                      type="button"
                      title="Iniciar atendimento"
                      aria-label={`Iniciar atendimento de ${row.patient?.fullName}`}
                      disabled={startingId === Number(row.id)}
                      onClick={() => startAppointment(row)}
                    >
                      <Play size={18} />
                    </button>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </section>
      {selectedAnamnesis && (
        <AnamnesisAppointmentModal
          appointment={selectedAnamnesis}
          onClose={() => setSelectedAnamnesis(null)}
        />
      )}
      {selected && (
        <div className="modal-backdrop">
          <div className="doctor-detail-modal">
            <div className="modal-header">
              <div>
                <p className="eyebrow">DADOS DO PACIENTE</p>
                <h2>{selected.patient?.fullName || "Paciente"}</h2>
              </div>
              <button className="icon-button" onClick={() => setSelected(null)}>
                <X size={19} />
              </button>
            </div>
            <div className="doctor-detail-grid">
              <div>
                <span>Horário</span>
                <strong>{selected.scheduledTime}</strong>
              </div>
              <div>
                <span>Status</span>
                <strong>
                  {statusLabel[selected.status] || selected.status}
                </strong>
              </div>
              <div>
                <span>Telefone</span>
                <strong>{selected.patient?.phone || "Não informado"}</strong>
              </div>
              <div>
                <span>Médico</span>
                <strong>{selected.doctor?.fullName || "Não informado"}</strong>
              </div>
              <div>
                <span>Convênio</span>
                <strong>{selected.insurance?.name || "Não informado"}</strong>
              </div>
              <div>
                <span>Atendimento</span>
                <strong>
                  {selected.itemType === "PROCEDIMENTO"
                    ? selected.procedure?.name
                    : selected.attendance?.name || "Não informado"}
                </strong>
              </div>
              <div className="doctor-detail-wide">
                <span>Observação</span>
                <strong>
                  {selected.notes || "Nenhuma observação registrada."}
                </strong>
              </div>
            </div>
            <div className="modal-footer">
              <button className="secondary" onClick={() => setSelected(null)}>
                Fechar
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
