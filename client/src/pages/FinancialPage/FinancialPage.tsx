import React, { useCallback, useEffect, useMemo, useState } from "react";
import {
  ArrowDownLeft,
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
type Entry = { id: number; description: string; person: string; date: string; status: string; value: number; paid?: number; balance?: number; kind?: string; method?: string; raw: Row };

const pageConfig: Record<FinancialModule, { eyebrow: string; title: string; description: string; icon: React.ComponentType<{ size?: number }>; action: string; empty: string; headers: string[] }> = {
  finance: { eyebrow: "GESTÃO FINANCEIRA", title: "Financeiro", description: "Acompanhe vendas, recebimentos, despesas e saldos por conta.", icon: CircleDollarSign, action: "", empty: "Ainda não há vendas ou movimentações financeiras.", headers: ["Origem", "Paciente / origem", "Data", "Status", "Valor"] },
  cash: { eyebrow: "GESTÃO FINANCEIRA", title: "Caixa", description: "Controle entradas e saídas efetivas, contas físicas e bancárias e sessões de caixa.", icon: Wallet, action: "Nova movimentação", empty: "Nenhuma movimentação registrada.", headers: ["Descrição", "Conta", "Data", "Tipo", "Valor"] },
  accounts: { eyebrow: "GESTÃO FINANCEIRA", title: "Contas a pagar e receber", description: "Acompanhe vencimentos, parcelas, baixas e saldos pendentes.", icon: Receipt, action: "Nova despesa", empty: "Nenhuma conta encontrada.", headers: ["Descrição", "Pessoa / fornecedor", "Vencimento", "Status", "Saldo"] },
  sales: { eyebrow: "GESTÃO FINANCEIRA", title: "Vendas", description: "Registre serviços comercializados e acompanhe as contas a receber vinculadas.", icon: ShoppingCart, action: "Nova venda", empty: "Nenhuma venda registrada.", headers: ["Venda", "Paciente", "Data", "Status", "Total"] },
};
const statusLabel: Record<string, string> = { PENDING: "Pendente", PARTIAL: "Parcial", PAID: "Pago", CANCELED: "Cancelado" };
const methodLabel: Record<string, string> = { PIX: "Pix", DEBIT_CARD: "Débito", CREDIT_CARD: "Crédito", CASH: "Dinheiro", BANK_TRANSFER: "Transferência", OTHER: "Outro" };
const movementLabel: Record<string, string> = { ENTRADA: "Entrada", SAIDA: "Saída", TRANSFERENCIA_ENTRADA: "Transferência recebida", TRANSFERENCIA_SAIDA: "Transferência enviada", SUPRIMENTO: "Suprimento", SANGRIA: "Sangria", ABERTURA: "Abertura", AJUSTE_ENTRADA: "Ajuste de entrada", AJUSTE_SAIDA: "Ajuste de saída", ESTORNO_ENTRADA: "Estorno recebido", ESTORNO_SAIDA: "Estorno pago" };
const localDate = () => { const now = new Date(); return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`; };
const makeIdempotencyKey = () => globalThis.crypto?.randomUUID?.() || `mc-${Date.now()}-${Math.random().toString(36).slice(2)}`;
const displayDate = (value?: string) => value ? new Date(`${String(value).slice(0, 10)}T12:00:00`).toLocaleDateString("pt-BR") : "—";
const getError = (error: unknown) => error instanceof Error ? error.message : "Não foi possível concluir a operação.";

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
  const [accountsTab, setAccountsTab] = useState<"receber" | "pagar">("receber");
  const [formMode, setFormMode] = useState<FormMode | null>(null);
  const [settlement, setSettlement] = useState<PaymentTarget | null>(null);
  const [form, setForm] = useState<FinancialForm>({ description: "", category: "", person: "", supplierId: "", patientId: "", professionalId: "", value: "", discountAmount: "0", date: localDate(), dueDate: localDate(), method: "PIX", installments: "1", accountId: "", accountType: "CASH", openingAmount: "0", kind: "SUPRIMENTO", fromAccountId: "", toAccountId: "", closingAmount: "", idempotencyKey: makeIdempotencyKey() });

  const reload = useCallback(async () => {
    setLoading(true);
    setError("");
    try {
      const promises: Promise<any>[] = [request(`/financial/summary?days=${period}`), request("/financial/accounts")];
      if (module === "sales" || module === "finance") promises.push(request("/financial/sales"));
      if (module === "accounts") promises.push(request("/financial/receivables"), request("/financial/payables"), request("/admin/suppliers"), request("/financial/cash-sessions"));
      if (module === "cash") promises.push(request("/financial/movements"), request("/financial/cash-sessions"));
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
    if (module === "sales" || module === "finance") return sales.map((row) => ({ id: row.id, description: `${row.code} · ${row.serviceDescription}`, person: row.patient?.fullName || "—", date: row.saleDate, status: statusLabel[row.status] || row.status, value: Number(row.totalAmount || 0), paid: Number(row.receivable?.paidAmount || 0), balance: Math.max(0, Number(row.totalAmount || 0) - Number(row.receivable?.paidAmount || 0)), kind: "Venda", raw: row }));
    if (module === "accounts") {
      const rows = accountsTab === "receber" ? receivables : payables;
      return rows.map((row) => {
        const isReceivable = accountsTab === "receber";
        const total = Number(isReceivable ? row.totalAmount : row.amount || 0);
        const paid = Number(row.paidAmount || 0);
        const status = statusLabel[row.status] || row.status;
        const lastPayment = row.payments?.[0];
        const person = isReceivable ? row.sale?.patient?.fullName || "—" : row.supplier?.name || row.supplier?.legalName || "—";
        const latestPayment = lastPayment ? ` · ${methodLabel[lastPayment.method] || lastPayment.method} ${displayDate(lastPayment.paymentDate)}` : "";
        return { id: row.id, description: isReceivable ? `${row.sale?.code || "Venda"} · ${row.sale?.serviceDescription || "Serviço"}` : row.description, person: `${person}${latestPayment}`, date: row.dueDate, status, value: total, paid, balance: Math.max(0, total - paid), kind: isReceivable ? "A receber" : "A pagar", raw: row };
      });
    }
    return movements.map((row) => ({ id: row.id, description: row.description, person: row.account?.name || "—", date: row.movementDate, status: movementLabel[row.type] || row.type, value: Number(row.amount || 0), kind: row.type, method: row.originType, raw: row }));
  }, [accountsTab, module, movements, payables, receivables, sales]);

  const periodStart = Date.now() - Number(period) * 86_400_000;
  const filtered = useMemo(() => entries.filter((entry) => {
    const matchesText = `${entry.description} ${entry.person}`.toLocaleLowerCase("pt-BR").includes(query.toLocaleLowerCase("pt-BR"));
    const date = new Date(`${String(entry.date).slice(0, 10)}T23:59:59`).getTime();
    const matchesPeriod = !Number.isNaN(date) && date >= periodStart;
    const matchesStatus = statusFilter === "TODOS" || entry.status === statusFilter;
    return matchesText && matchesPeriod && matchesStatus;
  }), [entries, periodStart, query, statusFilter]);

  const totalSales = Number(summary.salesTotal || 0);
  const cashIn = Number(summary.cashIn || 0);
  const cashOut = Number(summary.cashOut || 0);
  const currentBalance = (summary.accounts || []).reduce((sum: number, account: Row) => sum + Number(account.balance || 0), 0);
  const mainTotal = module === "sales" ? totalSales : module === "cash" ? currentBalance : module === "accounts" ? Number(accountsTab === "receber" ? summary.receivablesOutstanding : summary.payablesOutstanding || 0) : Number(summary.netCashFlow || 0);
  const outstandingCount = entries.filter((entry) => entry.status === "Pendente" || entry.status === "Parcial").length;

  function openForm(mode: FormMode) {
    setError("");
    setForm({ description: "", category: "", person: "", supplierId: "", patientId: "", professionalId: "", value: "", discountAmount: "0", date: localDate(), dueDate: localDate(), method: "PIX", installments: "1", accountId: String(accounts[0]?.id || ""), accountType: "CASH", openingAmount: "0", kind: "SUPRIMENTO", fromAccountId: String(accounts[0]?.id || ""), toAccountId: String(accounts[1]?.id || ""), closingAmount: "", idempotencyKey: makeIdempotencyKey() });
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
      if (formMode === "sale") await request("/financial/sales", { method: "POST", body: JSON.stringify({ serviceDescription: form.description, patientId: Number(form.patientId), professionalId: Number(form.professionalId), saleDate: form.date, dueDate: form.dueDate, amount: Number(form.value), discountAmount: Number(form.discountAmount || 0), installments: Number(form.installments), paymentMethod: form.method, idempotencyKey: form.idempotencyKey }) });
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
      await request(`/financial/${endpoint}/${settlement.id}/payments`, { method: "POST", body: JSON.stringify({ amount: Number(form.value), accountId: Number(form.accountId), paymentDate: form.date, method: form.method, idempotencyKey: settlement.idempotencyKey }) });
      setSettlement(null); await reload();
    } catch (cause) { setError(getError(cause)); }
    finally { setSaving(false); }
  }
  async function closeSession(session: Row) {
    const counted = window.prompt("Informe o valor contado no fechamento do caixa:");
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
        {module === "cash" && <><button className="secondary" type="button" onClick={() => openForm("account")}><Landmark size={16} /> Nova conta</button><button className="secondary" type="button" onClick={() => openForm("open-session")}><Wallet size={16} /> Abrir caixa</button><button className="primary" type="button" onClick={() => openForm("movement")}><Plus size={17} /> Nova movimentação</button></>}
        <button className="icon-button" type="button" onClick={() => void reload()} aria-label="Atualizar dados financeiros" title="Atualizar"><RefreshCw size={17} /></button>
      </div>
    </div>
    {error && <div className="error page-error" role="alert">{error}</div>}

    <section className="financial-summary" aria-label="Resumo financeiro">
      <article className="financial-summary-card financial-summary-main"><span className="financial-summary-icon"><Icon size={20} /></span><div><small>{module === "sales" ? "Vendas no período" : module === "cash" ? "Saldo total em contas" : module === "accounts" ? accountsTab === "receber" ? "Saldo a receber" : "Saldo a pagar" : "Fluxo de caixa líquido"}</small><strong>{loading ? "—" : money(mainTotal)}</strong></div></article>
      <article className="financial-summary-card"><span className="financial-summary-icon soft-green"><ArrowDownLeft size={19} /></span><div><small>Entradas realizadas</small><strong>{loading ? "—" : money(cashIn)}</strong></div></article>
      <article className="financial-summary-card"><span className="financial-summary-icon soft-red"><ArrowUpRight size={19} /></span><div><small>Saídas realizadas</small><strong>{loading ? "—" : money(cashOut)}</strong></div></article>
      <article className="financial-summary-card"><span className="financial-summary-icon soft-gold"><Clock3 size={19} /></span><div><small>{module === "accounts" ? "Em aberto" : "Pendências"}</small><strong>{loading ? "—" : module === "accounts" ? outstandingCount : Number(summary.receivablesOpenCount || 0) + Number(summary.payablesOpenCount || 0)}</strong></div></article>
    </section>

    {module === "cash" && <section className="financial-shortcuts" aria-label="Saldos de contas">{(summary.accounts || []).length ? (summary.accounts as Row[]).map((account) => <div key={account.id}><Landmark size={18} /><div><strong>{account.name}</strong><small>{account.type === "CASH" ? "Caixa físico" : account.type === "BANK" ? "Conta bancária" : "Outra conta"} · Saldo {money(Number(account.balance || 0))}</small></div></div>) : <div><Landmark size={18} /><div><strong>Cadastre uma conta financeira</strong><small>Separe caixa físico, bancos e outras contas.</small></div></div>}</section>}
    {module === "cash" && sessions.filter((session) => session.status === "ABERTA").map((session) => <div className="success page-success" role="status" key={session.id}>Caixa aberto · {session.account?.name} · Abertura {money(Number(session.openingAmount || 0))}<button className="secondary" type="button" onClick={() => void closeSession(session)}>Fechar caixa</button></div>)}

    <section className="financial-panel">
      {module === "accounts" && <div className="financial-toolbar"><div className="financial-tabs" role="tablist" aria-label="Tipo de conta"><button type="button" className={accountsTab === "receber" ? "active" : ""} onClick={() => setAccountsTab("receber")}>A receber ({receivables.length})</button><button type="button" className={accountsTab === "pagar" ? "active" : ""} onClick={() => setAccountsTab("pagar")}>A pagar ({payables.length})</button></div></div>}
      <div className="financial-toolbar">
        <label className="financial-search"><Search size={16} /><input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Pesquisar lançamento..." /></label>
        <label className="financial-filter"><CalendarDays size={15} /><select value={period} onChange={(event) => setPeriod(event.target.value)}><option value="7">Últimos 7 dias</option><option value="30">Últimos 30 dias</option><option value="90">Últimos 90 dias</option><option value="365">Últimos 12 meses</option></select></label>
        <label className="financial-filter"><Filter size={15} /><select value={statusFilter} onChange={(event) => setStatusFilter(event.target.value)}><option value="TODOS">Todos os status</option><option value="Pendente">Pendentes</option><option value="Parcial">Parciais</option><option value="Pago">Pagos</option><option value="Cancelado">Cancelados</option></select></label>
      </div>
      <div className="financial-table-wrap">
        {loading ? <div className="financial-empty" role="status">Carregando dados financeiros…</div> : filtered.length === 0 ? <div className="financial-empty"><span><Icon size={25} /></span><strong>{config.empty}</strong><p>Os dados desta tela são carregados do razão financeiro.</p>{module === "sales" && <button className="secondary" type="button" onClick={() => openForm("sale")}><FilePlus2 size={16} /> Nova venda</button>}</div> : <table className="financial-table"><thead><tr>{config.headers.map((header) => <th key={header}>{header}</th>)}{(module === "accounts" || module === "cash") && <th>Ações</th>}</tr></thead><tbody>{filtered.map((entry) => <tr key={`${entry.kind}-${entry.id}`}><td><strong>{entry.description}</strong>{module === "accounts" && entry.paid ? <small className="financial-row-subtitle">Pago {money(entry.paid)} de {money(entry.value)}</small> : null}</td><td>{entry.person}</td><td>{displayDate(entry.date)}</td><td><span className={`financial-status ${entry.status === "Pago" || entry.status === "Entrada" || entry.status === "Suprimento" ? "confirmed" : entry.status === "Cancelado" || entry.status === "Saída" || entry.status === "Sangria" ? "pending" : "pending"}`}>{entry.status}</span></td><td><strong>{money(module === "accounts" ? Number(entry.balance || 0) : entry.value)}</strong></td>{(module === "accounts" || module === "cash") && <td>{module === "accounts" && entry.balance! > 0 && (entry.status === "Pendente" || entry.status === "Parcial") ? <button className="secondary financial-row-action" type="button" onClick={() => { setSettlement({ kind: accountsTab === "receber" ? "receivable" : "payable", id: entry.id, description: entry.description, balance: Number(entry.balance) }); setForm({ ...form, value: String(Number(entry.balance).toFixed(2)), accountId: String(accounts[0]?.id || ""), date: localDate(), method: "PIX" }); }}>Baixar</button> : module === "cash" ? <small>{entry.raw.originType || "—"}</small> : "—"}</td>}</tr>)}</tbody></table>}
      </div>
    </section>

    <FinancialFormModal formMode={formMode} form={form} accounts={accounts} suppliers={suppliers} patients={patients} doctors={doctors} saving={saving}
      onClose={() => setFormMode(null)} onChange={(patch) => setForm((current) => ({ ...current, ...patch }))} onSubmit={submitForm} />
    <SettlementModal settlement={settlement} form={form} accounts={accounts} saving={saving}
      onClose={() => setSettlement(null)} onChange={(patch) => setForm((current) => ({ ...current, ...patch }))} onSubmit={submitSettlement} />
  </>;
}
