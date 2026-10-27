import React, { useEffect, useMemo, useState } from "react";
import {
  CalendarPlus,
  CircleDollarSign,
  Eye,
  FileText,
  RefreshCw,
  Search,
  X,
} from "lucide-react";
import { API, money, request } from "../lib/app";
import type { Row } from "../lib/app";

type RequestItem = {
  id: number;
  kind: "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO";
  category: string;
  title: string;
  code: string | null;
  requestedAt: string;
  amount: number | null;
  items: { label: string; value: number | null }[];
  pdfPath: string | null;
};
type Visit = {
  id: number;
  date: string;
  time: string;
  patient: { id: number; fullName: string };
  doctor: { fullName: string };
  requests: RequestItem[];
};
type PatientSummary = {
  id: number;
  fullName: string;
  visits: Visit[];
  requests: RequestItem[];
  total: number;
  unpriced: number;
};

function dateLabel(value: string) {
  if (!value) return "—";
  const date = new Date(`${String(value).slice(0, 10)}T12:00:00`);
  return Number.isNaN(date.getTime())
    ? "—"
    : date.toLocaleDateString("pt-BR");
}

function requestKindLabel(kind: RequestItem["kind"]) {
  return {
    EXAME: "Exame",
    ULTRASSOM: "Ultrassom",
    INJETAVEL: "Injetável",
    PROCEDIMENTO: "Procedimento",
  }[kind];
}

export function SecretaryDashboard({
  onSchedule,
}: {
  onSchedule: () => void;
}) {
  const [visits, setVisits] = useState<Visit[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [search, setSearch] = useState("");
  const [billing, setBilling] = useState<{
    patient: PatientSummary;
    item: RequestItem;
  } | null>(null);
  const [viewing, setViewing] = useState<{
    patient: string;
    item: RequestItem;
  } | null>(null);

  async function load() {
    setLoading(true);
    setError("");
    try {
      const data = await request("/secretary/dashboard/attended-patients");
      setVisits(data || []);
    } catch (cause: any) {
      setError(cause.message || "Não foi possível carregar os atendimentos.");
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    void load();
  }, []);

  const patients = useMemo(() => {
    const grouped = new Map<number, PatientSummary>();
    visits.forEach((visit) => {
      const patientId = Number(visit.patient?.id);
      if (!patientId) return;
      let summary = grouped.get(patientId);
      if (!summary) {
        summary = {
          id: patientId,
          fullName: visit.patient.fullName,
          visits: [],
          requests: [],
          total: 0,
          unpriced: 0,
        };
        grouped.set(patientId, summary);
      }
      summary.visits.push(visit);
      visit.requests.forEach((item) => {
        summary.requests.push(item);
        if (item.amount === null || !Number.isFinite(Number(item.amount)))
          summary.unpriced += 1;
        else summary.total += Number(item.amount);
      });
    });
    return [...grouped.values()];
  }, [visits]);

  const filteredPatients = useMemo(() => {
    const query = search.trim().toLocaleLowerCase("pt-BR");
    if (!query) return patients;
    return patients.filter((patient) =>
      patient.fullName.toLocaleLowerCase("pt-BR").includes(query),
    );
  }, [patients, search]);

  const totalRequests = visits.reduce(
    (sum, visit) => sum + visit.requests.length,
    0,
  );
  const totalAmount = visits.reduce(
    (sum, visit) =>
      sum + visit.requests.reduce(
        (requestSum, item) => requestSum + (item.amount === null ? 0 : Number(item.amount) || 0),
        0,
      ),
    0,
  );
  const unpricedCount = visits.reduce(
    (sum, visit) => sum + visit.requests.filter((item) => item.amount === null).length,
    0,
  );

  async function openPdfOrDetails(patient: string, item: RequestItem) {
    if (!item.pdfPath) {
      setViewing({ patient, item });
      return;
    }
    const popup = window.open("about:blank", "_blank");
    if (!popup) {
      setError("Permita a abertura de janelas pop-up para visualizar o PDF.");
      return;
    }
    popup.opener = null;
    try {
      const token = localStorage.getItem("medclinic_token");
      const response = await fetch(`${API}${item.pdfPath}`, {
        headers: token ? { Authorization: `Bearer ${token}` } : {},
      });
      if (!response.ok) {
        const result = await response.json().catch(() => ({}));
        throw new Error(result.message || "Não foi possível abrir o PDF.");
      }
      const fileUrl = URL.createObjectURL(await response.blob());
      popup.location.href = fileUrl;
      window.setTimeout(() => URL.revokeObjectURL(fileUrl), 60_000);
    } catch (cause: any) {
      popup.close();
      setError(cause.message || "Não foi possível abrir o PDF.");
    }
  }

  return (
    <>
      <div className="page-heading secretary-dashboard-heading">
        <div>
          <p className="eyebrow">GESTÃO CLÍNICA</p>
          <h1>Pacientes atendidas</h1>
          <p className="muted">
            Solicitações dos atendimentos finalizados pela equipe médica.
          </p>
        </div>
        <button className="secondary secretary-refresh" type="button" onClick={() => void load()} disabled={loading}>
          <RefreshCw size={16} className={loading ? "secretary-spinning" : ""} />
          Atualizar
        </button>
      </div>

      {error && <div className="error page-error" role="alert">{error}</div>}

      <div className="secretary-summary-grid" aria-label="Resumo dos atendimentos">
        <article className="secretary-summary-card">
          <span>Pacientes atendidas</span>
          <strong>{patients.length}</strong>
        </article>
        <article className="secretary-summary-card">
          <span>Solicitações</span>
          <strong>{totalRequests}</strong>
        </article>
        <article className="secretary-summary-card secretary-summary-total">
          <span>Total conhecido das solicitações</span>
          <strong>{money(totalAmount)}</strong>
          {unpricedCount > 0 && <small>{unpricedCount} solicitação(ões) sem preço vinculado</small>}
        </article>
      </div>

      <div className="secretary-list-toolbar">
        <label className="secretary-search">
          <Search size={17} aria-hidden="true" />
          <input
            type="search"
            value={search}
            onChange={(event) => setSearch(event.target.value)}
            placeholder="Buscar paciente pelo nome"
            aria-label="Buscar paciente pelo nome"
          />
        </label>
        <span>{filteredPatients.length} paciente(s)</span>
      </div>

      {loading ? (
        <div className="secretary-state-card" role="status">Carregando atendimentos…</div>
      ) : filteredPatients.length === 0 ? (
        <div className="secretary-state-card">
          {search ? "Nenhuma paciente encontrada para esta busca." : "Ainda não há pacientes com atendimentos finalizados."}
        </div>
      ) : (
        <div className="secretary-patient-list">
          {filteredPatients.map((patient) => (
            <article className="secretary-patient-card" key={patient.id}>
              <header className="secretary-patient-header">
                <div>
                  <span className="secretary-section-kicker">PACIENTE</span>
                  <h2>{patient.fullName}</h2>
                  <p>{patient.visits.length} atendimento(s) finalizado(s)</p>
                </div>
                <div className="secretary-patient-total">
                  <span>Total das solicitações</span>
                  <strong>{money(patient.total)}</strong>
                  {patient.unpriced > 0 && <small>{patient.unpriced} sem preço vinculado</small>}
                </div>
              </header>

              <div className="secretary-visits">
                {patient.visits.map((visit) => (
                  <section className="secretary-visit" key={visit.id}>
                    <div className="secretary-visit-heading">
                      <strong>{dateLabel(visit.date)} · {visit.time}</strong>
                      <span>Atendida por {visit.doctor.fullName}</span>
                    </div>
                    {visit.requests.length === 0 ? (
                      <p className="secretary-empty-request">Nenhuma solicitação registrada neste atendimento.</p>
                    ) : (
                      <div className="secretary-request-list">
                        {visit.requests.map((item) => (
                          <div className="secretary-request-row" key={`${item.kind}-${item.id}`}>
                            <div className="secretary-request-copy">
                              <div className="secretary-request-labels">
                                <span className={`secretary-request-tag secretary-tag-${item.kind.toLowerCase()}`}>
                                  {item.category}
                                </span>
                                {item.code && <span className="secretary-request-code">{item.code}</span>}
                              </div>
                              <strong>{item.title}</strong>
                              <span className="secretary-request-value">
                                {item.amount === null ? "Preço não vinculado" : money(item.amount)}
                              </span>
                            </div>
                            <div className="secretary-request-actions" aria-label={`Ações para ${item.title}`}>
                              <button
                                type="button"
                                title="Abrir resumo de cobrança"
                                aria-label={`Abrir resumo de cobrança de ${item.title} para ${patient.fullName}`}
                                onClick={() => setBilling({ patient, item })}
                              >
                                <CircleDollarSign size={17} />
                              </button>
                              <button
                                type="button"
                                title={item.pdfPath ? "Visualizar PDF" : "Visualizar detalhes"}
                                aria-label={`Visualizar solicitação ${item.title} de ${patient.fullName}`}
                                onClick={() => void openPdfOrDetails(patient.fullName, item)}
                              >
                                {item.pdfPath ? <FileText size={17} /> : <Eye size={17} />}
                              </button>
                              <button
                                type="button"
                                title="Abrir novo agendamento"
                                aria-label={`Agendar para ${patient.fullName}; formulário em branco`}
                                onClick={onSchedule}
                              >
                                <CalendarPlus size={17} />
                              </button>
                            </div>
                          </div>
                        ))}
                      </div>
                    )}
                  </section>
                ))}
              </div>
            </article>
          ))}
        </div>
      )}

      {billing && (
        <div className="modal-backdrop secretary-modal-backdrop" onMouseDown={(event) => event.target === event.currentTarget && setBilling(null)}>
          <section className="modal secretary-dialog" role="dialog" aria-modal="true" aria-labelledby="secretary-billing-title">
            <header className="modal-header secretary-dialog-header">
              <div>
                <p className="eyebrow">COBRANÇA · RESUMO</p>
                <h2 id="secretary-billing-title">{billing.item.title}</h2>
                <span>{billing.patient.fullName}</span>
              </div>
              <button className="icon-button" type="button" onClick={() => setBilling(null)} aria-label="Fechar resumo de cobrança"><X size={18} /></button>
            </header>
            <div className="secretary-dialog-content">
              <div className="secretary-billing-items">
                {billing.item.items.map((line, index) => (
                  <div key={`${line.label}-${index}`}>
                    <span>{line.label}</span>
                    <strong>{line.value === null ? "Preço não vinculado" : money(line.value)}</strong>
                  </div>
                ))}
              </div>
              <div className="secretary-billing-total">
                <span>Valor desta solicitação</span>
                <strong>{billing.item.amount === null ? "Preço não vinculado" : money(billing.item.amount)}</strong>
              </div>
              <div className="secretary-billing-patient-total">
                <span>Total conhecido de todas as solicitações da paciente</span>
                <strong>{money(billing.patient.total)}</strong>
              </div>
              {billing.patient.unpriced > 0 && (
                <p className="secretary-unpriced-note">
                  Há {billing.patient.unpriced} solicitação(ões) sem preço cadastrado/vinculado; por isso o total geral pode estar incompleto.
                </p>
              )}
              <p className="secretary-summary-only-note">Este resumo não registra nem confirma pagamento.</p>
            </div>
            <footer className="modal-footer">
              <button className="secondary" type="button" onClick={() => setBilling(null)}>Fechar</button>
            </footer>
          </section>
        </div>
      )}

      {viewing && (
        <div className="modal-backdrop secretary-modal-backdrop" onMouseDown={(event) => event.target === event.currentTarget && setViewing(null)}>
          <section className="modal secretary-dialog" role="dialog" aria-modal="true" aria-labelledby="secretary-view-title">
            <header className="modal-header secretary-dialog-header">
              <div>
                <p className="eyebrow">{requestKindLabel(viewing.item.kind)} · {viewing.item.category}</p>
                <h2 id="secretary-view-title">{viewing.item.title}</h2>
                <span>{viewing.patient}{viewing.item.code ? ` · ${viewing.item.code}` : ""}</span>
              </div>
              <button className="icon-button" type="button" onClick={() => setViewing(null)} aria-label="Fechar detalhes da solicitação"><X size={18} /></button>
            </header>
            <div className="secretary-dialog-content">
              <div className="secretary-billing-items">
                {viewing.item.items.map((line, index) => (
                  <div key={`${line.label}-${index}`}>
                    <span>{line.label}</span>
                    <strong>{line.value === null ? "Preço não vinculado" : money(line.value)}</strong>
                  </div>
                ))}
              </div>
              <div className="secretary-billing-total">
                <span>Valor desta solicitação</span>
                <strong>{viewing.item.amount === null ? "Preço não vinculado" : money(viewing.item.amount)}</strong>
              </div>
              <p className="secretary-view-date">Solicitado em {dateLabel(viewing.item.requestedAt)}</p>
            </div>
            <footer className="modal-footer">
              <button className="secondary" type="button" onClick={() => setViewing(null)}>Fechar</button>
            </footer>
          </section>
        </div>
      )}
    </>
  );
}
