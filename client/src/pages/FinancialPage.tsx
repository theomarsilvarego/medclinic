import React, { useMemo, useState } from "react";
import {
  ArrowDownLeft,
  ArrowUpRight,
  CalendarDays,
  Check,
  CircleDollarSign,
  Clock3,
  CreditCard,
  FilePlus2,
  Filter,
  Landmark,
  Plus,
  Receipt,
  Search,
  ShoppingCart,
  Wallet,
  X,
} from "lucide-react";
import type { ModuleKey } from "../lib/app";
import { money } from "../lib/app";

type FinancialPageProps = { module: Extract<ModuleKey, "finance" | "cash" | "accounts" | "sales"> };
type Entry = { id: number; description: string; person: string; dueDate: string; status: string; value: number; kind?: string; method?: string };

const pageConfig = {
  finance: {
    eyebrow: "GESTÃO FINANCEIRA",
    title: "Financeiro",
    description: "Acompanhe o resultado da clínica e organize as movimentações financeiras.",
    icon: CircleDollarSign,
    action: "Novo lançamento",
    empty: "Nenhum lançamento financeiro neste período.",
    headers: ["Descrição", "Categoria", "Competência", "Status", "Valor"],
  },
  cash: {
    eyebrow: "GESTÃO FINANCEIRA",
    title: "Caixa",
    description: "Controle entradas, saídas e o saldo das contas da clínica.",
    icon: Wallet,
    action: "Abrir caixa",
    empty: "Nenhuma movimentação registrada no caixa.",
    headers: ["Descrição", "Forma de pagamento", "Data", "Tipo", "Valor"],
  },
  accounts: {
    eyebrow: "GESTÃO FINANCEIRA",
    title: "Contas a pagar e receber",
    description: "Gerencie compromissos, recebimentos e prazos em um só lugar.",
    icon: Receipt,
    action: "Nova conta",
    empty: "Nenhuma conta encontrada para os filtros selecionados.",
    headers: ["Descrição", "Pessoa ou empresa", "Vencimento", "Status", "Valor"],
  },
  sales: {
    eyebrow: "GESTÃO FINANCEIRA",
    title: "Vendas",
    description: "Registre vendas de serviços e acompanhe os recebimentos da clínica.",
    icon: ShoppingCart,
    action: "Nova venda",
    empty: "Nenhuma venda registrada neste período.",
    headers: ["Venda", "Cliente", "Data", "Pagamento", "Total"],
  },
} as const;

const initialEntries: Record<FinancialPageProps["module"], Entry[]> = {
  finance: [],
  cash: [],
  accounts: [],
  sales: [],
};

export function FinancialPage({ module }: FinancialPageProps) {
  const config = pageConfig[module];
  const Icon = config.icon;
  const [entries, setEntries] = useState<Entry[]>(initialEntries[module]);
  const [period, setPeriod] = useState("30");
  const [query, setQuery] = useState("");
  const [status, setStatus] = useState("TODOS");
  const [showForm, setShowForm] = useState(false);
  const [form, setForm] = useState({ description: "", person: "", value: "", dueDate: "", kind: "Entrada", method: "Pix" });

  const periodStart = Date.now() - Number(period) * 24 * 60 * 60 * 1000;
  const periodEntries = entries.filter((entry) => new Date(`${entry.dueDate}T23:59:59`).getTime() >= periodStart);
  const filteredEntries = useMemo(
    () => periodEntries.filter((entry) => {
      const matchesQuery = `${entry.description} ${entry.person}`.toLocaleLowerCase().includes(query.toLocaleLowerCase());
      const matchesStatus = status === "TODOS" || entry.status === status;
      return matchesQuery && matchesStatus;
    }),
    [periodEntries, query, status],
  );
  const isCash = module === "cash";
  const isAccounts = module === "accounts";
  const isSales = module === "sales";
  const isOutgoing = (entry: Entry) => entry.kind === "Saída" || entry.kind === "A pagar";
  const inflow = periodEntries.reduce((sum, entry) => sum + (isOutgoing(entry) ? 0 : entry.value), 0);
  const outflow = periodEntries.reduce((sum, entry) => sum + (isOutgoing(entry) ? entry.value : 0), 0);
  const total = isSales ? inflow : inflow - outflow;

  function openForm() {
    setForm({ description: "", person: "", value: "", dueDate: "", kind: isCash ? "Entrada" : "A receber", method: "Pix" });
    setShowForm(true);
  }

  function saveEntry(event: React.FormEvent) {
    event.preventDefault();
    const value = Number(form.value.replace(",", "."));
    if (!form.description.trim() || !value || value < 0) return;
    setEntries((current) => [{
      id: Date.now(),
      description: form.description.trim(),
      person: form.person.trim() || "Não informado",
      dueDate: form.dueDate || new Date().toISOString().slice(0, 10),
      status: isCash ? "Confirmado" : "Pendente",
      value,
      kind: form.kind,
      method: form.method,
    }, ...current]);
    setShowForm(false);
  }

  return (
    <>
      <div className="page-heading financial-heading">
        <div>
          <p className="eyebrow">{config.eyebrow}</p>
          <h1>{config.title}</h1>
          <p className="muted">{config.description}</p>
        </div>
        <button className="primary" type="button" onClick={openForm}>
          <Plus size={17} /> {config.action}
        </button>
      </div>

      <section className="financial-summary" aria-label="Resumo financeiro">
        <article className="financial-summary-card financial-summary-main">
          <span className="financial-summary-icon"><Icon size={20} /></span>
          <div><small>{isCash ? "Saldo atual" : isSales ? "Vendas no período" : "Total no período"}</small><strong>{money(total)}</strong></div>
          <span className="financial-summary-trend"><ArrowUpRight size={14} /> 0,0%</span>
        </article>
        <article className="financial-summary-card"><span className="financial-summary-icon soft-green"><ArrowDownLeft size={19} /></span><div><small>Entradas</small><strong>{money(inflow)}</strong></div></article>
        <article className="financial-summary-card"><span className="financial-summary-icon soft-red"><ArrowUpRight size={19} /></span><div><small>Saídas</small><strong>{money(outflow)}</strong></div></article>
        <article className="financial-summary-card"><span className="financial-summary-icon soft-gold"><Clock3 size={19} /></span><div><small>{isAccounts ? "Em aberto" : "Pendências"}</small><strong>{periodEntries.filter((entry) => entry.status === "Pendente").length}</strong></div></article>
      </section>

      <section className="financial-panel">
        <div className="financial-toolbar">
          <label className="financial-search"><Search size={16} /><input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Pesquisar lançamento..." /></label>
          <label className="financial-filter"><CalendarDays size={15} /><select value={period} onChange={(event) => setPeriod(event.target.value)}><option value="7">Últimos 7 dias</option><option value="30">Últimos 30 dias</option><option value="90">Últimos 90 dias</option></select></label>
          <label className="financial-filter"><Filter size={15} /><select value={status} onChange={(event) => setStatus(event.target.value)}><option value="TODOS">Todos os status</option><option value="Pendente">Pendentes</option><option value="Confirmado">Confirmados</option></select></label>
        </div>
        <div className="financial-table-wrap">
          {filteredEntries.length === 0 ? (
            <div className="financial-empty"><span><Icon size={25} /></span><strong>{config.empty}</strong><p>Use o botão “{config.action}” para começar a registrar informações.</p><button className="secondary" type="button" onClick={openForm}><FilePlus2 size={16} /> {config.action}</button></div>
          ) : (
            <table className="financial-table"><thead><tr>{config.headers.map((header) => <th key={header}>{header}</th>)}</tr></thead><tbody>{filteredEntries.map((entry) => <tr key={entry.id}><td><strong>{entry.description}</strong></td><td>{isCash ? entry.method : isSales ? entry.person : isAccounts ? entry.person : entry.kind || "Geral"}</td><td>{new Date(`${entry.dueDate}T12:00:00`).toLocaleDateString("pt-BR")}</td><td>{isCash ? <span className={`financial-status ${entry.kind === "Saída" ? "pending" : "confirmed"}`}>{entry.kind}</span> : isSales ? entry.method : <span className={`financial-status ${entry.status === "Pendente" ? "pending" : "confirmed"}`}>{entry.status}</span>}</td><td><strong>{money(entry.value)}</strong></td></tr>)}</tbody></table>
          )}
        </div>
      </section>

      <div className="financial-shortcuts">
        <div><Landmark size={18} /><div><strong>Contas e formas de recebimento</strong><small>Configure bancos, cartões e meios de pagamento utilizados pela clínica.</small></div></div>
        <div><CreditCard size={18} /><div><strong>Conciliação e fechamento</strong><small>Confira os lançamentos antes de fechar o período financeiro.</small></div></div>
      </div>

      {showForm && <div className="modal-backdrop" onMouseDown={(event) => event.target === event.currentTarget && setShowForm(false)}><section className="modal financial-form-modal" role="dialog" aria-modal="true" aria-labelledby="financial-form-title"><div className="modal-header"><div><p className="eyebrow">NOVO REGISTRO</p><h2 id="financial-form-title">{config.action}</h2></div><button className="icon-button" type="button" onClick={() => setShowForm(false)} aria-label="Fechar"><X size={19} /></button></div><form onSubmit={saveEntry}><label>Descrição<input required value={form.description} onChange={(event) => setForm({ ...form, description: event.target.value })} placeholder={isSales ? "Ex.: Consulta particular" : "Ex.: Fornecedor ou lançamento"} /></label><label>{isSales ? "Cliente" : "Pessoa ou empresa"}<input value={form.person} onChange={(event) => setForm({ ...form, person: event.target.value })} placeholder="Nome" /></label><div className="financial-form-grid"><label>Valor<input required type="number" min="0.01" step="0.01" value={form.value} onChange={(event) => setForm({ ...form, value: event.target.value })} placeholder="0,00" /></label><label>{isCash ? "Data" : "Vencimento"}<input type="date" value={form.dueDate} onChange={(event) => setForm({ ...form, dueDate: event.target.value })} /></label></div>{(isCash || isAccounts) && <label>{isCash ? "Tipo de movimentação" : "Natureza da conta"}<select value={form.kind} onChange={(event) => setForm({ ...form, kind: event.target.value })}>{isCash ? <><option>Entrada</option><option>Saída</option></> : <><option>A receber</option><option>A pagar</option></>}</select></label>}{(isCash || isSales) && <label>Forma de pagamento<select value={form.method} onChange={(event) => setForm({ ...form, method: event.target.value })}><option>Pix</option><option>Cartão de débito</option><option>Cartão de crédito</option><option>Dinheiro</option></select></label>}<div className="modal-footer"><button type="button" className="secondary" onClick={() => setShowForm(false)}>Cancelar</button><button type="submit" className="primary"><Check size={16} /> Salvar registro</button></div></form></section></div>}
    </>
  );
}
