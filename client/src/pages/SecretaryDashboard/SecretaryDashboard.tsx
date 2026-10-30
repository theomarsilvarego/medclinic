import React, { useEffect, useMemo, useState } from "react";
import {
  Calendar,
  CalendarPlus,
  CircleDollarSign,
  Eye,
  FileText,
  RefreshCw,
  Search,
} from "lucide-react";
import { API, money, request } from "../../lib/app";
import type { Row } from "../../lib/app";
import { submitAppointment } from "../../lib/appointments";
import { AppointmentModal } from "../../components/appointments/AppointmentModal";
import { BillingModal } from "./BillingModal";
import { BillingDetailsModal } from "./BillingDetailsModal";
import { RequestDetailsModal } from "./RequestDetailsModal";
import "./SecretaryDashboard.css";

type RequestItem = {
  id: number;
  kind: "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO";
  category: string;
  title: string;
  code: string | null;
  requestedAt: string;
  amount: number | null;
  billingStatus: "A_FATURAR" | "FATURADO";
  schedulingStatus: "NAO_AGENDADO" | "AGENDADO";
  items: { label: string; value: number | null }[];
  pdfPath: string | null;
};
type Visit = {
  id: number;
  date: string;
  time: string;
  patient: { id: number; fullName: string };
  insurance: { id: number; name: string };
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
type PaymentMethod = "PIX" | "DEBIT_CARD" | "CREDIT_CARD" | "CASH";

function dateLabel(value: string) {
  if (!value) return "—";
  const date = new Date(`${String(value).slice(0, 10)}T12:00:00`);
  return Number.isNaN(date.getTime()) ? "—" : date.toLocaleDateString("pt-BR");
}

function requestKindLabel(kind: RequestItem["kind"]) {
  return {
    EXAME: "Exame",
    ULTRASSOM: "Ultrassom",
    INJETAVEL: "Injetável",
    PROCEDIMENTO: "Procedimento",
  }[kind];
}
function billingStatusLabel(status: RequestItem["billingStatus"]) {
  return status === "FATURADO" ? "Faturado" : "A faturar";
}
function schedulingStatusLabel(status: RequestItem["schedulingStatus"]) {
  return status === "AGENDADO" ? "Agendado" : "Não agendado";
}
function localDate(date: Date) {
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
}
export function SecretaryDashboard() {
  const today = localDate(new Date());
  const [visits, setVisits] = useState<Visit[]>([]);
  const [date, setDate] = useState(today);
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
  const [selectedRequests, setSelectedRequests] = useState<string[]>([]);
  const [billingSelected, setBillingSelected] = useState(false);
  const [billingModalOpen, setBillingModalOpen] = useState(false);
  const [appointmentDraft, setAppointmentDraft] = useState<Row | null>(null);
  const [appointmentMeta, setAppointmentMeta] = useState<any>(null);
  const [appointmentSaving, setAppointmentSaving] = useState(false);
  const [scheduleSuccess, setScheduleSuccess] = useState("");
  const [billingItemKeys, setBillingItemKeys] = useState<string[]>([]);
  const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>("PIX");
  const [discountEnabled, setDiscountEnabled] = useState(false);
  const [installments, setInstallments] = useState(1);

  async function load() {
    setLoading(true);
    setError("");
    try {
      const data = await request(
        `/secretary/dashboard/attended-patients?date=${encodeURIComponent(date)}`,
      );
      setVisits(data || []);
    } catch (cause: any) {
      setError(cause.message || "Não foi possível carregar os atendimentos.");
    } finally {
      setLoading(false);
    }
  }

  async function openAppointment(patient: PatientSummary, visit: Visit, item?: RequestItem) {
    setError("");
    setScheduleSuccess("");
    try {
      const metadata = await request("/appointments/meta");
      const selectedPatient = (metadata.patients || []).find(
        (item: Row) => Number(item.id) === Number(patient.id),
      );
      if (!selectedPatient)
        throw new Error("Não foi possível carregar o cadastro da paciente.");

      const insuranceId = visit.insurance?.id || selectedPatient.insuranceCode;
      const insurances = metadata.insurances || [];
      const hasVisitInsurance = insurances.some(
        (item: Row) => Number(item.id) === Number(insuranceId),
      );
      const modalInsurances =
        insuranceId && !hasVisitInsurance && visit.insurance?.name
          ? [...insurances, { ...visit.insurance, active: false, fromAttendedVisit: true }]
          : insurances;

      setAppointmentMeta({ ...metadata, insurances: modalInsurances });
      setAppointmentDraft({
        appointmentDate: today,
        scheduledTime: "08:00",
        status: "AGENDADO",
        itemType: "ATENDIMENTO",
        patientId: selectedPatient.id,
        insuranceId: insuranceId ? String(insuranceId) : "",
        requestKind: item?.kind || null,
        requestId: item?.id || null,
      });
    } catch (cause: any) {
      setError(cause.message || "Não foi possível abrir o novo agendamento.");
    }
  }

  async function saveAppointment(data: Row) {
    setAppointmentSaving(true);
    setError("");
    setScheduleSuccess("");
    try {
      await submitAppointment(data);
      const patientName = appointmentMeta?.patients?.find(
        (item: Row) => Number(item.id) === Number(data.patientId),
      )?.fullName;
      setScheduleSuccess(
        `Agendamento de ${patientName || "paciente"} criado para ${dateLabel(String(data.appointmentDate))} às ${data.scheduledTime}.`,
      );
      setAppointmentDraft(null);
      setAppointmentMeta(null);
      await load();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível salvar o agendamento.");
    } finally {
      setAppointmentSaving(false);
    }
  }

  useEffect(() => {
    void load();
  }, [date]);
  useEffect(() => {
    setSelectedRequests([]);
  }, [date]);

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
    return [...grouped.values()].filter((patient) => patient.requests.length > 0);
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
      sum +
      visit.requests.reduce(
        (requestSum, item) =>
          requestSum + (item.amount === null ? 0 : Number(item.amount) || 0),
        0,
      ),
    0,
  );
  const unpricedCount = visits.reduce(
    (sum, visit) =>
      sum + visit.requests.filter((item) => item.amount === null).length,
    0,
  );
  const selectedItems = useMemo(
    () =>
      visits
        .flatMap((visit) => visit.requests)
        .filter(
          (item) =>
            item.billingStatus !== "FATURADO" &&
            selectedRequests.includes(`${item.kind}:${item.id}`),
        ),
    [selectedRequests, visits],
  );
  const selectedTotal = selectedItems.reduce(
    (sum, item) => sum + (item.amount === null ? 0 : Number(item.amount) || 0),
    0,
  );
  const billingItems = selectedItems.filter((item) =>
    billingItemKeys.includes(requestKey(item)),
  );
  const billableItems = billingItems.filter(
    (item) =>
      item.amount !== null &&
      Number.isFinite(Number(item.amount)) &&
      Number(item.amount) > 0,
  );
  const billingSubtotal = billableItems.reduce(
    (sum, item) => sum + Number(item.amount),
    0,
  );
  const discountAllowed = paymentMethod === "PIX" || paymentMethod === "CASH";
  const billingDiscount =
    discountEnabled && discountAllowed ? billingSubtotal * 0.05 : 0;
  const billingTotal = billingSubtotal - billingDiscount;
  function requestKey(item: RequestItem) {
    return `${item.kind}:${item.id}`;
  }
  function toggleRequest(item: RequestItem) {
    if (item.billingStatus === "FATURADO") return;
    const key = requestKey(item);
    setSelectedRequests((current) =>
      current.includes(key)
        ? current.filter((value) => value !== key)
        : [...current, key],
    );
  }
  function openBillingModal() {
    if (!selectedItems.length) return;
    setBillingItemKeys(selectedItems.map(requestKey));
    setPaymentMethod("PIX");
    setDiscountEnabled(false);
    setInstallments(1);
    setBillingModalOpen(true);
  }
  async function confirmBilling() {
    if (!billableItems.length) return;
    setBillingSelected(true);
    setError("");
    try {
      await request("/secretary/dashboard/billing", {
        method: "POST",
        body: JSON.stringify({
          items: billableItems.map(({ kind, id }) => ({ kind, id })),
          paymentMethod,
          discountPercent: billingDiscount ? 5 : 0,
          installments: paymentMethod === "CREDIT_CARD" ? installments : 1,
        }),
      });
      const billedKeys = new Set(billableItems.map(requestKey));
      setSelectedRequests((current) =>
        current.filter((key) => !billedKeys.has(key)),
      );
      setBillingModalOpen(false);
      await load();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível faturar as solicitações.");
    } finally {
      setBillingSelected(false);
    }
  }

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
            Solicitações dos atendimentos finalizados hoje pela equipe médica.
          </p>
        </div>
        <div className="secretary-heading-actions">
          <label className="secretary-date-picker">
            <Calendar size={16} aria-hidden="true" />
            <span>Dia</span>
            <input
              type="date"
              value={date}
              onChange={(event) => setDate(event.target.value || today)}
              aria-label="Selecionar dia dos pacientes atendidos"
            />
          </label>
          {date !== today && (
            <button
              className="secondary secretary-today-button"
              type="button"
              onClick={() => setDate(today)}
            >
              Hoje
            </button>
          )}
          <button
            className="secondary secretary-refresh"
            type="button"
            onClick={() => void load()}
            disabled={loading}
          >
            <RefreshCw
              size={16}
              className={loading ? "secretary-spinning" : ""}
            />
            Atualizar
          </button>
        </div>
      </div>

      {error && !appointmentDraft && (
        <div className="error page-error" role="alert">
          {error}
        </div>
      )}
      {scheduleSuccess && (
        <div className="success page-success" role="status">
          {scheduleSuccess}
        </div>
      )}

      <div
        className="secretary-summary-grid"
        aria-label="Resumo dos atendimentos"
      >
        <article className="secretary-summary-card">
          <span>Pacientes atendidas hoje</span>
          <strong>{patients.length}</strong>
        </article>
        <article className="secretary-summary-card">
          <span>Solicitações</span>
          <strong>{totalRequests}</strong>
        </article>
        <article className="secretary-summary-card secretary-summary-total">
          <span>Total conhecido das solicitações</span>
          <strong>{money(totalAmount)}</strong>
          {unpricedCount > 0 && (
            <small>{unpricedCount} solicitação(ões) sem preço vinculado</small>
          )}
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
        <div className="secretary-state-card" role="status">
          Carregando atendimentos…
        </div>
      ) : filteredPatients.length === 0 ? (
        <div className="secretary-state-card">
          {search
            ? "Nenhuma paciente encontrada para esta busca."
            : "Ainda não há atendimentos finalizados hoje."}
        </div>
      ) : (
        <div className="secretary-patient-list">
          {filteredPatients.map((patient) => (
            <article className="secretary-patient-card" key={patient.id}>
              <header className="secretary-patient-header">
                <div>
                  <span className="secretary-section-kicker">PACIENTE</span>
                  <h2>{patient.fullName}</h2>
                  <p>
                    Atendimento finalizado ·{" "}
                    {patient.visits[0]?.insurance?.name ||
                      "Convênio não informado"}
                  </p>
                </div>
                <div className="secretary-patient-total">
                  <span>Total das solicitações</span>
                  <strong>{money(patient.total)}</strong>
                  {patient.unpriced > 0 && (
                    <small>{patient.unpriced} sem preço vinculado</small>
                  )}
                </div>
              </header>

              <div className="secretary-visits">
                {patient.visits.map((visit) => (
                  <section className="secretary-visit" key={visit.id}>
                    <div className="secretary-visit-heading"></div>
                    {visit.requests.length === 0 ? (
                      <p className="secretary-empty-request">
                        Nenhuma solicitação registrada neste atendimento.
                      </p>
                    ) : (
                      <div className="secretary-request-table">
                        {visit.requests.map((item) => (
                          <div
                            className="secretary-request-row"
                            key={`${item.kind}-${item.id}`}
                          >
                            <label className="secretary-request-check">
                              <input
                                type="checkbox"
                                disabled={item.billingStatus === "FATURADO"}
                                checked={selectedRequests.includes(
                                  requestKey(item),
                                )}
                                onChange={() => toggleRequest(item)}
                                aria-label={`Selecionar ${item.title} para faturamento`}
                              />
                            </label>
                            <div className="secretary-request-copy">
                              <div className="secretary-request-labels">
                                <span
                                  className={`secretary-request-tag secretary-tag-${item.kind.toLowerCase()}`}
                                >
                                  {item.category}
                                </span>
                                {item.code && (
                                  <span className="secretary-request-code">
                                    {item.code}
                                  </span>
                                )}
                              </div>
                              <strong>{item.title}</strong>
                            </div>
                            <span className="secretary-request-value">
                              {item.amount === null
                                ? "Preço não vinculado"
                                : money(item.amount)}
                            </span>
                            <span
                              className={`secretary-request-status secretary-billing-${item.billingStatus.toLowerCase()}`}
                            >
                              {billingStatusLabel(item.billingStatus)}
                            </span>
                            <span
                              className={`secretary-request-status secretary-scheduling-${item.schedulingStatus.toLowerCase()}`}
                            >
                              {schedulingStatusLabel(item.schedulingStatus)}
                            </span>
                            <div
                              className="secretary-request-actions"
                              aria-label={`Ações para ${item.title}`}
                            >
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
                                title={
                                  item.pdfPath
                                    ? "Visualizar PDF"
                                    : "Visualizar detalhes"
                                }
                                aria-label={`Visualizar solicitação ${item.title} de ${patient.fullName}`}
                                onClick={() =>
                                  void openPdfOrDetails(patient.fullName, item)
                                }
                              >
                                {item.pdfPath ? (
                                  <FileText size={17} />
                                ) : (
                                  <Eye size={17} />
                                )}
                              </button>
                              <button
                                type="button"
                                title="Abrir novo agendamento"
                                aria-label={`Abrir novo agendamento para ${patient.fullName}`}
                                onClick={() => void openAppointment(patient, visit, item)}
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
      {selectedItems.length > 0 && (
        <div
          className="secretary-bulk-bar"
          role="region"
          aria-label="Ações em lote"
        >
          <div>
            <strong>{selectedItems.length} selecionada(s)</strong>
            <span>Total: {money(selectedTotal)}</span>
          </div>
          <button
            type="button"
            className="primary"
            onClick={openBillingModal}
            disabled={billingSelected || selectedItems.length === 0}
          >
            Faturar selecionadas
          </button>
        </div>
      )}

      {billingModalOpen && (
        <BillingModal
          billingItems={billingItems}
          billingItemKeys={billingItemKeys}
          setBillingItemKeys={setBillingItemKeys}
          billingSelected={billingSelected}
          setError={setError}
          paymentMethod={paymentMethod}
          setPaymentMethod={setPaymentMethod}
          discountAllowed={discountAllowed}
          discountEnabled={discountEnabled}
          setDiscountEnabled={setDiscountEnabled}
          installments={installments}
          setInstallments={setInstallments}
          billableItems={billableItems}
          billingSubtotal={billingSubtotal}
          billingDiscount={billingDiscount}
          billingTotal={billingTotal}
          confirmBilling={confirmBilling}
          close={() => setBillingModalOpen(false)}
        />
      )}
      {billing && <BillingDetailsModal billing={billing} close={() => setBilling(null)} />}
      {viewing && <RequestDetailsModal viewing={viewing} close={() => setViewing(null)} />}
      {appointmentDraft && appointmentMeta && (
        <AppointmentModal
          initial={appointmentDraft}
          meta={appointmentMeta}
          date={String(appointmentDraft.appointmentDate || date)}
          onClose={() => {
            setError("");
            setAppointmentDraft(null);
            setAppointmentMeta(null);
          }}
          onSave={saveAppointment}
          saving={appointmentSaving}
          saveError={error}
        />
      )}
    </>
  );
}
