import React, { useCallback, useEffect, useMemo, useState } from "react";
import {
  ArrowDownLeft,
  ArrowDownUp,
  ArrowUpRight,
  CalendarDays,
  CircleDollarSign,
  Clock3,
  CreditCard,
  FilePlus2,
  Filter,
  Landmark,
  Plus,
  Receipt,
  RefreshCw,
  Search,
  ShoppingCart,
  Wallet,
} from "lucide-react";
import type { ModuleKey, Row } from "../../lib/app";
import { money, request } from "../../lib/app";
import { FinancialFormModal } from "./FinancialFormModal";
import { SettlementModal } from "./SettlementModal";
import type { FinancialForm, FormMode, PaymentTarget } from "./financialTypes";
import "./FinancialPage.css";

type FinancialModule = Extract<ModuleKey, "finance" | "cash" | "accounts" | "sales">;
type Entry = { id: number; description: string; person: string; date: string; status: string; value: number; paid?: number; balance?: number; kind?: string; method?: string; installmentId?: number; paymentMethod?: string; raw: Row };

const pageConfig: Record<FinancialModule, { eyebrow: string; title: string; description: string; icon: React.ComponentType<{ size?: number }>; action: string; empty: string; headers: string[] }> = {
  finance: { eyebrow: "GESTÃO FINANCEIRA", title: "Financeiro", description: "Acompanhe vendas, recebimentos, despesas e saldos por conta.", icon: CircleDollarSign, action: "", empty: "Ainda não há vendas ou movimentações financeiras.", headers: ["Origem", "Paciente / origem", "Data", "Status", "Valor"] },
  cash: { eyebrow: "GESTÃO FINANCEIRA", title: "Caixa", description: "Controle entradas e saídas efetivas, contas físicas e bancárias e sessões de caixa.", icon: Wallet, action: "Nova movimentação", empty: "Nenhuma movimentação registrada.", headers: ["Descrição", "Conta", "Data", "Tipo", "Valor"] },
  accounts: { eyebrow: "GESTÃO FINANCEIRA", title: "Contas a pagar e receber", description: "Acompanhe vencimentos, parcelas, baixas e saldos pendentes.", icon: Receipt, action: "Nova despesa", empty: "Nenhuma conta encontrada.", headers: ["Descrição", "Pessoa / fornecedor", "Vencimento", "Status", "Saldo"] },
  sales: { eyebrow: "GESTÃO FINANCEIRA", title: "Vendas", description: "Registre serviços comercializados e acompanhe as contas a receber vinculadas.", icon: ShoppingCart, action: "Nova venda", empty: "Nenhuma venda registrada.", headers: ["Venda", "Paciente", "Data", "Status", "Total"] },
};
const statusLabel: Record<string, string> = { PENDING: "Pendente", PARTIAL: "Parcial", PAID: "Pago", CANCELED: "Cancelado" };
const methodLabel: Record<string, string> = { PIX: "Pix", DEBIT_CARD: "Débito", CREDIT_CARD: "Crédito", CASH: "Dinheiro", BANK_TRANSFER: "Transferência", OTHER: "Outro" };
const movementLabel: Record<string, string> = { ENTRADA: "Entrada", SAIDA: "Saída", TRANSFERENCIA_ENTRADA: "Transferência recebida", TRANSFERENCIA_SAIDA: "Transferência enviada", SUPRIMENTO: "Suprimento", SANGRIA: "Sangria", ABERTURA: "Abertura", AJUSTE_ENTRADA: "Ajuste de entrada", AJUSTE_SAIDA: "Ajuste de saída", ESTORNO_ENTRADA: "Estorno recebido", ESTORNO_SAIDA: "Estorno pago" };
const localDateKey = (date: Date) => `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
const localDate = () => localDateKey(new Date());
const makeIdempotencyKey = () => globalThis.crypto?.randomUUID?.() || `mc-${Date.now()}-${Math.random().toString(36).slice(2)}`;
const displayDate = (value?: string) => value ? new Date(`${String(value).slice(0, 10)}T12:00:00`).toLocaleDateString("pt-BR") : "—";
const displayDateTime = (value?: string) => value ? new Date(value).toLocaleString("pt-BR", { dateStyle: "short", timeStyle: "short" }) : "—";
const timestampLocalDate = (value?: string) => { const date = value ? new Date(value) : null; return date && !Number.isNaN(date.getTime()) ? localDateKey(date) : ""; };
const getError = (error: unknown) => error instanceof Error ? error.message : "Não foi possível concluir a operação.";
const defaultPaymentBreakdown = (date: string) => [{ method: "PIX", amount: "", date, installments: "1" }];
const splitLabel = (breakdown: any) => Array.isArray(breakdown) && breakdown.length ? ` · ${breakdown.map((payment: any) => `${methodLabel[payment.method] || payment.method} ${money(Number(payment.amount || 0))}${payment.installments > 1 ? ` ${payment.installments}x` : ""}`).join(" + ")}` : "";

export function FinancialPage({ module }: { module: FinancialModule }) {
  const config = pageConfig[module];
  const Icon = config.icon;
  const [sales, setSales] = useState<Row[]>([]);
  const [receivables, setReceivables] = useState<Row[]>([]);
  const [payables, setPayables] = useState<Row[]>([]);
  const [movements, setMovements] = useState<Row[]>([]);
  const [accounts, setAccounts] = useState<Row[]>([]);
  const [suppliers, setSuppliers] = useState<Row[]>([]);
  const [patients, setPatients] = useState<Row[]>([]);
  const [doctors, setDoctors] = useState<Row[]>([]);
  const [sessions, setSessions] = useState<Row[]>([]);
  const [summary, setSummary] = useState<Row>({});
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");
  const [period, setPeriod] = useState("30");
  const [query, setQuery] = useState("");
  const [statusFilter, setStatusFilter] = useState("TODOS");
  const [sortOrder, setSortOrder] = useState("date-desc");
  const [accountsTab, setAccountsTab] = useState<"receber" | "pagar">("receber");
  const [formMode, setFormMode] = useState<FormMode | null>(null);
  const [settlement, setSettlement] = useState<PaymentTarget | null>(null);
  const [form, setForm] = useState<FinancialForm>({ description: "", category: "", person: "", supplierId: "", patientId: "", professionalId: "", value: "", discountAmount: "0", date: localDate(), dueDate: localDate(), method: "PIX", installments: "1", accountId: "", accountType: "CASH", openingAmount: "0", kind: "SUPRIMENTO", fromAccountId: "", toAccountId: "", closingAmount: "", idempotencyKey: makeIdempotencyKey(), paymentBreakdown: defaultPaymentBreakdown(localDate()) });

  const reload = useCallback(async () => {
    setLoading(true);
    setError("");
    try {
      const promises: Promise<any>[] = [request(`/financial/summary?days=${period}`), request("/financial/accounts")];
      if (module === "sales" || module === "finance") promises.push(request("/financial/sales"));
      if (module === "accounts") promises.push(request("/financial/receivables"), request("/financial/payables"), request("/admin/suppliers"), request("/financial/cash-sessions"));
      if (module === "cash") promises.push(request("/financial/movements"), request("/financial/cash-sessions"), request("/financial/receivables"));
      if (module === "sales") promises.push(request("/patients"), request("/admin/doctors"));
      const results = await Promise.all(promises);
      let index = 0;
      setSummary(results[index++] || {});
      setAccounts(results[index++] || []);
      if (module === "sales" || module === "finance") setSales(results[index++] || []);
      if (module === "accounts") {
        setReceivables(results[index++] || []);
        setPayables(results[index++] || []);
        setSuppliers(results[index++] || []);
        setSessions(results[index++] || []);
      }
      if (module === "cash") {
        setMovements(results[index++] || []);
        setSessions(results[index++] || []);
        setReceivables(results[index++] || []);
      }
      if (module === "sales") {
        setPatients(results[index++] || []);
        setDoctors(results[index++] || []);
      }
    } catch (cause) {
      setError(getError(cause));
    } finally {
      setLoading(false);
    }
  }, [module, period]);

  useEffect(() => { void reload(); }, [reload]);
  useEffect(() => {
    if (settlement && !settlement.idempotencyKey)
      setSettlement({ ...settlement, idempotencyKey: makeIdempotencyKey() });
  }, [settlement]);

  const entries = useMemo<Entry[]>(() => {
    if (module === "sales" || module === "finance") return sales.map((row) => ({ id: row.id, description: `${row.code} · ${row.serviceDescription}${splitLabel(row.receivable?.paymentBreakdown)}`, person: row.patient?.fullName || "—", date: row.saleDate, status: statusLabel[row.status] || row.status, value: Number(row.totalAmount || 0), paid: Number(row.receivable?.paidAmount || 0), balance: Math.max(0, Number(row.totalAmount || 0) - Number(row.receivable?.paidAmount || 0)), kind: "Venda", raw: row }));
    if (module === "accounts") {
      const rows = accountsTab === "receber" ? receivables : payables;
      return rows.flatMap((row) => {
        const isReceivable = accountsTab === "receber";
        const total = Number(isReceivable ? row.totalAmount : row.amount || 0);
        const paid = Number(row.paidAmount || 0);
        const status = statusLabel[row.status] || row.status;
        const lastPayment = row.payments?.[0];
        const person = isReceivable ? row.sale?.patient?.fullName || "—" : row.supplier?.name || row.supplier?.legalName || "—";
        const latestPayment = lastPayment ? ` · ${methodLabel[lastPayment.method] || lastPayment.method} ${displayDate(lastPayment.paymentDate)}` : "";
        if (!isReceivable || !row.installments?.length) return [{ id: row.id, description: `${isReceivable ? `${row.sale?.code || "Venda"} · ${row.sale?.serviceDescription || "Serviço"}` : row.description}${splitLabel(row.paymentBreakdown)}`, person: `${person}${latestPayment}`, date: row.dueDate, status, value: total, paid, balance: Math.max(0, total - paid), kind: isReceivable ? "A receber" : "A pagar", raw: row }];
        return row.installments.map((installment: Row) => {
          const installmentAmount = Number(installment.amount || 0);
          const installmentPaid = Number(installment.paidAmount || 0);
          const method = installment.paymentMethod || row.preferredPaymentMethod;
          const payment = (row.payments || []).find((candidate: Row) => candidate.installmentId === installment.id);
          const installmentStatus = method === "CREDIT_CARD" && installmentPaid >= installmentAmount && payment && !payment.movement ? "Confirmado" : statusLabel[installment.status] || installment.status;
          const label = installmentAmount === total && !row.installments?.length ? "" : ` · ${methodLabel[method] || "Pagamento"}${row.installments.length > 1 ? ` · Parcela ${installment.number}/${row.installments.length}` : ""}`;
          return { id: row.id, installmentId: installment.id, paymentMethod: method, description: `${row.sale?.code || "Venda"} · ${row.sale?.serviceDescription || "Serviço"}${label}`, person, date: installment.dueDate, status: installmentStatus, value: installmentAmount, paid: installmentPaid, balance: Math.max(0, installmentAmount - installmentPaid), kind: "A receber", raw: row };
        });
      });
    }
    const confirmed = movements.map((row) => ({ id: row.id, description: row.description, person: row.account?.name || "—", date: row.movementDate, status: "Confirmado", value: Number(row.amount || 0), kind: row.type, method: row.originType, raw: row }));
    const forecast = module === "cash" ? receivables.flatMap((row) => (row.installments || []).filter((item: Row) => { const payment = (row.payments || []).find((candidate: Row) => candidate.installmentId === item.id); return Number(item.amount || 0) > Number(item.paidAmount || 0) || (item.paymentMethod === "CREDIT_CARD" && payment && !payment.movement); }).map((item: Row) => { const payment = (row.payments || []).find((candidate: Row) => candidate.installmentId === item.id); const awaitingRepasse = item.paymentMethod === "CREDIT_CARD" && payment && !payment.movement; return { id: row.id, installmentId: item.id, description: `${row.sale?.code || "Venda"} · ${methodLabel[item.paymentMethod] || "Pagamento"}${row.installments.length > 1 ? ` · Parcela ${item.number}/${row.installments.length}` : ""}`, person: row.sale?.patient?.fullName || "—", date: item.dueDate, status: "Previsto", value: awaitingRepasse ? Number(item.amount) : Number(item.amount) - Number(item.paidAmount || 0), kind: "PREVISTO", method: item.paymentMethod, raw: { ...row, forecast: true } }; })) : [];
    return [...confirmed, ...forecast];
  }, [accountsTab, module, movements, payables, receivables, sales]);

  const periodStart = Date.now() - Number(period) * 86_400_000;
  const todayStart = new Date();
  todayStart.setHours(0, 0, 0, 0);
  const filtered = useMemo(() => entries.filter((entry) => {
    const matchesText = `${entry.description} ${entry.person} ${entry.date} ${displayDate(entry.date)}`.toLocaleLowerCase("pt-BR").includes(query.toLocaleLowerCase("pt-BR"));
    const date = new Date(`${String(entry.date).slice(0, 10)}T23:59:59`).getTime();
    const isOverdueAccount = module === "accounts" && (entry.status === "Pendente" || entry.status === "Parcial") && date < todayStart.getTime();
    const matchesPeriod = !Number.isNaN(date) && (date >= periodStart || isOverdueAccount);
    const matchesStatus = statusFilter === "TODOS" || entry.status === statusFilter;
    return matchesText && matchesPeriod && matchesStatus;
  }).sort((left, right) => {
    const order = sortOrder.endsWith("asc") ? 1 : -1;
    if (sortOrder.startsWith("person")) return left.person.localeCompare(right.person, "pt-BR", { sensitivity: "base" }) * order || String(left.date).localeCompare(String(right.date)) * -1;
    return String(left.date).slice(0, 10).localeCompare(String(right.date).slice(0, 10)) * order || left.person.localeCompare(right.person, "pt-BR", { sensitivity: "base" });
  }), [entries, module, periodStart, query, sortOrder, statusFilter, todayStart]);

  const totalSales = Number(summary.salesTotal || 0);
  const cashIn = Number(summary.cashIn || 0);
  const cashOut = Number(summary.cashOut || 0);
  const currentBalance = (summary.accounts || []).reduce((sum: number, account: Row) => sum + Number(account.balance || 0), 0);
  const mainTotal = module === "sales" || module === "finance" ? totalSales : module === "cash" ? currentBalance : module === "accounts" ? Number(accountsTab === "receber" ? summary.receivablesOutstanding : summary.payablesOutstanding || 0) : Number(summary.netCashFlow || 0);
  const outstandingCount = entries.filter((entry) => entry.status === "Pendente" || entry.status === "Parcial").length;
  const todayKey = localDate();
  const openSessions = sessions.filter((session) => session.status === "ABERTA");
  const todaySessions = sessions.filter((session) => timestampLocalDate(session.openedAt) === todayKey);
  const cashSessionsToShow = [...openSessions, ...todaySessions.filter((session) => session.status !== "ABERTA"), ...sessions.filter((session) => session.status !== "ABERTA" && timestampLocalDate(session.openedAt) !== todayKey).slice(0, 6)];
  const availableCashAccounts = accounts.filter((account) => account.type === "CASH" && !openSessions.some((session) => Number(session.accountId) === Number(account.id)));

  function openForm(mode: FormMode) {
    setError("");
    const defaultAccount = mode === "open-session" ? availableCashAccounts[0] : accounts[0];
    setForm({ description: "", category: "", person: "", supplierId: "", patientId: "", professionalId: "", value: "", discountAmount: "0", date: localDate(), dueDate: localDate(), method: "PIX", installments: "1", accountId: String(defaultAccount?.id || ""), accountType: "CASH", openingAmount: "0", kind: "SUPRIMENTO", fromAccountId: String(accounts[0]?.id || ""), toAccountId: String(accounts[1]?.id || ""), closingAmount: "", idempotencyKey: makeIdempotencyKey(), paymentBreakdown: defaultPaymentBreakdown(localDate()) });
    setFormMode(mode);
  }
  async function submitForm(event: React.FormEvent) {
    event.preventDefault();
    setSaving(true); setError("");
    try {
      if (formMode === "account") await request("/financial/accounts", { method: "POST", body: JSON.stringify({ name: form.description, type: form.accountType, openingBalance: Number(form.openingAmount || 0) }) });
      if (formMode === "open-session") await request("/financial/cash-sessions/open", { method: "POST", body: JSON.stringify({ accountId: Number(form.accountId), openingAmount: Number(form.openingAmount || 0) }) });
      if (formMode === "movement") {
        const body = form.kind === "TRANSFERENCIA"
          ? { kind: form.kind, fromAccountId: Number(form.fromAccountId), toAccountId: Number(form.toAccountId), amount: Number(form.value), movementDate: form.date, description: form.description, idempotencyKey: form.idempotencyKey }
          : { kind: form.kind, accountId: Number(form.accountId), amount: Number(form.value), movementDate: form.date, description: form.description, idempotencyKey: form.idempotencyKey };
        await request("/financial/movements", { method: "POST", body: JSON.stringify(body) });
      }
      if (formMode === "sale") await request("/financial/sales", { method: "POST", body: JSON.stringify({ serviceDescription: form.description, patientId: Number(form.patientId), professionalId: Number(form.professionalId), saleDate: form.date, dueDate: form.dueDate, amount: Number(form.value), discountAmount: Number(form.discountAmount || 0), installments: Number(form.installments), paymentMethod: form.method, payments: form.paymentBreakdown.map((payment) => ({ method: payment.method, amount: Number(payment.amount), installments: Number(payment.installments), paymentDate: payment.date })), idempotencyKey: form.idempotencyKey }) });
      if (formMode === "payable") await request("/financial/payables", { method: "POST", body: JSON.stringify({ description: form.description, category: form.category, supplierId: Number(form.supplierId), amount: Number(form.value), dueDate: form.dueDate, idempotencyKey: form.idempotencyKey }) });
      setFormMode(null); await reload();
    } catch (cause) { setError(getError(cause)); }
    finally { setSaving(false); }
  }
  async function submitSettlement(event: React.FormEvent) {
    event.preventDefault();
    if (!settlement) return;
    setSaving(true); setError("");
    try {
      const endpoint = settlement.kind === "receivable" ? "receivables" : "payables";
      await request(`/financial/${endpoint}/${settlement.id}/payments`, { method: "POST", body: JSON.stringify({ amount: Number(form.value), accountId: Number(form.accountId), paymentDate: form.date, method: form.method, installmentId: settlement.installmentId, idempotencyKey: settlement.idempotencyKey }) });
      setSettlement(null); await reload();
    } catch (cause) { setError(getError(cause)); }
    finally { setSaving(false); }
  }
  function beginSettlement(target: { kind: "receivable" | "payable"; id: number; description: string; balance: number; installmentId?: number; paymentMethod?: string }) {
    setSettlement({ ...target, idempotencyKey: makeIdempotencyKey() });
    setForm((current) => ({ ...current, value: target.balance.toFixed(2), accountId: String(accounts[0]?.id || ""), date: localDate(), method: target.paymentMethod || "PIX" }));
  }
  async function settleCredit(receivableId: number, paymentId: number) {
    setSaving(true); setError("");
    try {
      await request(`/financial/receivables/${receivableId}/payments/${paymentId}/settle`, { method: "POST", body: JSON.stringify({ accountId: Number(accounts[0]?.id), paymentDate: localDate(), idempotencyKey: makeIdempotencyKey() }) });
      await reload();
    } catch (cause) { setError(getError(cause)); }
    finally { setSaving(false); }
  }
  async function closeSession(session: Row) {
    const counted = window.prompt(`Informe o valor contado no fechamento diário do caixa ${session.account?.name || ""} (aberto em ${displayDateTime(session.openedAt)}):`);
    if (counted === null) return;
    const value = Number(counted.replace(",", "."));
    if (!Number.isFinite(value) || value < 0) { setError("Informe um valor válido para fechar o caixa."); return; }
    setError("");
    try { await request(`/financial/cash-sessions/${session.id}/close`, { method: "POST", body: JSON.stringify({ closingAmount: value }) }); await reload(); }
    catch (cause) { setError(getError(cause)); }
  }

  return <>
    <div className="page-heading financial-heading">
      <div><p className="eyebrow">{config.eyebrow}</p><h1>{config.title}</h1><p className="muted">{config.description}</p></div>
      <div className="financial-actions">
        {module === "sales" && <button className="primary" type="button" onClick={() => openForm("sale")}><Plus size={17} /> Nova venda</button>}
        {module === "accounts" && <button className="primary" type="button" onClick={() => openForm("payable")}><Plus size={17} /> Nova despesa</button>}
        {module === "cash" && <><button className="secondary" type="button" onClick={() => openForm("account")}><Landmark size={16} /> Nova conta</button><button className="secondary" type="button" onClick={() => openForm("open-session")} disabled={!availableCashAccounts.length}><Wallet size={16} /> Abertura diária</button><button className="primary" type="button" onClick={() => openForm("movement")}><Plus size={17} /> Nova movimentação</button></>}
        <button className="icon-button" type="button" onClick={() => void reload()} aria-label="Atualizar dados financeiros" title="Atualizar"><RefreshCw size={17} /></button>
      </div>
    </div>
    {error && <div className="error page-error" role="alert">{error}</div>}

    <section className="financial-summary" aria-label="Resumo financeiro">
      <article className="financial-summary-card financial-summary-main"><span className="financial-summary-icon"><Icon size={20} /></span><div><small>{module === "sales" ? "Vendas no período" : module === "cash" ? "Saldo total em contas" : module === "accounts" ? accountsTab === "receber" ? "Saldo a receber" : "Saldo a pagar" : "Fluxo de caixa líquido"}</small><strong>{loading ? "—" : money(mainTotal)}</strong></div></article>
      <article className="financial-summary-card"><span className="financial-summary-icon soft-green"><ArrowDownLeft size={19} /></span><div><small>{module === "finance" ? "Recebido" : "Entradas realizadas"}</small><strong>{loading ? "—" : money(module === "finance" ? Number(summary.receivedTotal || 0) : cashIn)}</strong></div></article>
      <article className="financial-summary-card"><span className="financial-summary-icon soft-red"><ArrowUpRight size={19} /></span><div><small>Saídas realizadas</small><strong>{loading ? "—" : money(cashOut)}</strong></div></article>
      <article className="financial-summary-card"><span className="financial-summary-icon soft-gold"><Clock3 size={19} /></span><div><small>{module === "accounts" ? "Em aberto" : "Pendências"}</small><strong>{loading ? "—" : module === "accounts" ? outstandingCount : Number(summary.receivablesOpenCount || 0) + Number(summary.payablesOpenCount || 0)}</strong></div></article>
    </section>

    {module === "finance" && <section className="financial-forecast-panel"><div><strong>Composição por forma de pagamento</strong><small>Distribuição do faturamento pelas formas cadastradas.</small></div>{Object.entries((summary.paymentMethodBreakdown || {}) as Record<string, number>).map(([method, amount]) => <span key={method}><b>{methodLabel[method] || method}</b> {money(Number(amount))} ({totalSales ? Math.round(Number(amount) / totalSales * 100) : 0}%)</span>)}<div className="financial-forecast-list"><strong>Entradas previstas</strong>{((summary.receivablesForecast || []) as Row[]).slice(0, 6).map((item, index) => <span key={`${item.dueDate}-${item.method}-${index}`}>{displayDate(item.dueDate)} · {methodLabel[item.method] || item.method} · {money(Number(item.amount))}</span>)}</div></section>}

    {module === "cash" && <section className="financial-shortcuts" aria-label="Saldos de contas">{(summary.accounts || []).length ? (summary.accounts as Row[]).map((account) => <div key={account.id}><Landmark size={18} /><div><strong>{account.name}</strong><small>{account.type === "CASH" ? "Caixa físico" : account.type === "BANK" ? "Conta bancária" : "Outra conta"} · Saldo {money(Number(account.balance || 0))}</small></div></div>) : <div><Landmark size={18} /><div><strong>Cadastre uma conta financeira</strong><small>Separe caixa físico, bancos e outras contas.</small></div></div>}</section>}
    {module === "cash" && <section className="financial-cash-routine" aria-labelledby="cash-routine-title">
      <div className="financial-cash-routine-heading"><div><p className="eyebrow">ABERTURA E FECHAMENTO</p><h2 id="cash-routine-title">Rotina diária do caixa</h2><p className="muted">Acompanhe as sessões do dia, confira o valor contado e visualize diferenças no fechamento.</p></div><span className="financial-today-badge"><CalendarDays size={15} /> Hoje · {displayDate(todayKey)}</span></div>
      <div className="financial-cash-session-summary"><strong>{todaySessions.length} {todaySessions.length === 1 ? "sessão iniciada" : "sessões iniciadas"} hoje</strong><span>{openSessions.length} {openSessions.length === 1 ? "caixa em aberto" : "caixas em aberto"}</span></div>
      {cashSessionsToShow.length ? <div className="financial-cash-session-list">{cashSessionsToShow.map((session) => {
        const isOpen = session.status === "ABERTA";
        const difference = Number(session.difference || 0);
        return <article className="financial-cash-session" key={session.id}>
          <div className="financial-cash-session-heading"><div><strong>{session.account?.name || "Caixa físico"}</strong><small>{timestampLocalDate(session.openedAt) === todayKey ? "Hoje" : "Aberto em"} · {displayDateTime(session.openedAt)}{session.closedAt ? ` · Fechado ${displayDateTime(session.closedAt)}` : ""}</small></div><span className={`financial-session-status ${isOpen ? "is-open" : "is-closed"}`}>{isOpen ? "Em aberto" : "Fechado"}</span></div>
          <div className="financial-cash-session-values"><span><small>Abertura</small><strong>{money(Number(session.openingAmount || 0))}</strong></span>{!isOpen && <><span><small>Esperado</small><strong>{money(Number(session.expectedClosingAmount || 0))}</strong></span><span><small>Contado</small><strong>{money(Number(session.closingAmount || 0))}</strong></span><span><small>Diferença</small><strong className={difference === 0 ? "" : difference > 0 ? "positive" : "negative"}>{money(difference)}</strong></span></>}</div>
          {isOpen && <button className="secondary financial-close-session" type="button" onClick={() => void closeSession(session)}>Fechar caixa do dia</button>}
        </article>;
      })}</div> : <div className="financial-cash-session-empty"><strong>Nenhuma abertura registrada hoje.</strong><span>Inicie o caixa do dia para registrar entradas e saídas da sessão.</span><button className="secondary" type="button" onClick={() => openForm("open-session")} disabled={!availableCashAccounts.length}><Wallet size={15} /> Abrir caixa diário</button></div>}
    </section>}

    <section className="financial-panel">
      {module === "accounts" && <div className="financial-toolbar"><div className="financial-tabs" role="tablist" aria-label="Tipo de conta"><button type="button" className={accountsTab === "receber" ? "active" : ""} onClick={() => setAccountsTab("receber")}>A receber ({receivables.length})</button><button type="button" className={accountsTab === "pagar" ? "active" : ""} onClick={() => setAccountsTab("pagar")}>A pagar ({payables.length})</button></div></div>}
      <div className="financial-toolbar">
        <label className="financial-search"><Search size={16} /><input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Pesquisar lançamento..." /></label>
        <label className="financial-filter"><CalendarDays size={15} /><select value={period} onChange={(event) => setPeriod(event.target.value)}><option value="7">Últimos 7 dias</option><option value="30">Últimos 30 dias</option><option value="90">Últimos 90 dias</option><option value="365">Últimos 12 meses</option></select></label>
        {(module === "finance" || module === "sales" || module === "accounts") && <label className="financial-filter"><ArrowDownUp size={15} /><select aria-label="Ordenar lançamentos" value={sortOrder} onChange={(event) => setSortOrder(event.target.value)}><option value="date-desc">Data · mais recentes</option><option value="date-asc">Data · mais antigas</option><option value="person-asc">Paciente/pessoa · A–Z</option><option value="person-desc">Paciente/pessoa · Z–A</option></select></label>}
        <label className="financial-filter"><Filter size={15} /><select value={statusFilter} onChange={(event) => setStatusFilter(event.target.value)}><option value="TODOS">Todos os status</option><option value="Pendente">Pendentes</option><option value="Parcial">Parciais</option><option value="Pago">Pagos</option><option value="Cancelado">Cancelados</option></select></label>
      </div>
      <div className="financial-table-wrap">
        {loading ? <div className="financial-empty" role="status">Carregando dados financeiros…</div> : filtered.length === 0 ? <div className="financial-empty"><span><Icon size={25} /></span><strong>{config.empty}</strong><p>Os dados desta tela são carregados do razão financeiro.</p>{module === "sales" && <button className="secondary" type="button" onClick={() => openForm("sale")}><FilePlus2 size={16} /> Nova venda</button>}</div> : <table className="financial-table"><thead><tr>{config.headers.map((header) => <th key={header}>{header}</th>)}{(module === "accounts" || module === "cash" || module === "sales") && <th>Ações</th>}</tr></thead><tbody>{filtered.map((entry) => <tr key={`${entry.kind}-${entry.id}-${entry.installmentId || "sale"}`}><td><strong>{entry.description}</strong>{module === "accounts" && entry.paid ? <small className="financial-row-subtitle">Pago {money(entry.paid)} de {money(entry.value)}</small> : null}</td><td>{entry.person}</td><td>{displayDate(entry.date)}</td><td><span className={`financial-status ${entry.status === "Pago" || entry.status === "Confirmado" ? "confirmed" : "pending"}`}>{entry.status}</span></td><td><strong>{money(module === "accounts" ? Number(entry.balance || 0) : entry.value)}</strong></td>{(module === "accounts" || module === "cash" || module === "sales") && <td>{module === "sales" ? <div className="financial-payment-actions">{(entry.raw.receivable?.installments || []).map((item: Row) => { const payment = (entry.raw.receivable?.payments || []).find((candidate: Row) => candidate.installmentId === item.id); const label = `${methodLabel[item.paymentMethod] || "Pagamento"}${entry.raw.receivable.installments.length > 1 ? ` ${item.number}/${entry.raw.receivable.installments.length}` : ""}`; return Number(item.amount || 0) > Number(item.paidAmount || 0) ? <button key={item.id} className="secondary financial-row-action" type="button" onClick={() => beginSettlement({ kind: "receivable", id: entry.raw.receivable.id, installmentId: item.id, description: `${entry.raw.code} · ${label}`, balance: Number(item.amount) - Number(item.paidAmount || 0), paymentMethod: item.paymentMethod })}>Confirmar {label}</button> : item.paymentMethod === "CREDIT_CARD" && payment && !payment.movement ? <button key={item.id} className="secondary financial-row-action" type="button" onClick={() => void settleCredit(entry.raw.receivable.id, payment.id)}>Repassar {label}</button> : null; })}</div> : module === "accounts" && entry.balance! > 0 && (entry.status === "Pendente" || entry.status === "Parcial") ? <button className="secondary financial-row-action" type="button" onClick={() => beginSettlement({ kind: accountsTab === "receber" ? "receivable" : "payable", id: entry.id, installmentId: entry.installmentId, description: entry.description, balance: Number(entry.balance), paymentMethod: entry.paymentMethod })}>Confirmar</button> : module === "cash" ? <small>{entry.raw.forecast ? "Aguarda repasse" : entry.raw.originType || "—"}</small> : "—"}</td>}</tr>)}</tbody></table>}
      </div>
    </section>

    <FinancialFormModal formMode={formMode} form={form} accounts={accounts} sessions={sessions} suppliers={suppliers} patients={patients} doctors={doctors} saving={saving}
      onClose={() => setFormMode(null)} onChange={(patch) => setForm((current) => ({ ...current, ...patch }))} onSubmit={submitForm} />
    <SettlementModal settlement={settlement} form={form} accounts={accounts} saving={saving}
      onClose={() => setSettlement(null)} onChange={(patch) => setForm((current) => ({ ...current, ...patch }))} onSubmit={submitSettlement} />
  </>;
}
