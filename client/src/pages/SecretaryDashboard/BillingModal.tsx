import React, { useMemo, useState } from "react";
import { Plus, Trash2, X } from "lucide-react";
import { money } from "../../lib/app";

type RequestItem = { id: number; kind: "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO" | "CONSULTA"; category: string; title: string; amount: number | null };
export type PaymentMethod = "PIX" | "DEBIT_CARD" | "CREDIT_CARD" | "CASH";
export type SplitPayment = { method: PaymentMethod; amount: number; installments: number };
type PaymentDraft = { id: number; method: PaymentMethod; amount: string; installments: number };
type Props = { billingItems: RequestItem[]; billingItemKeys: string[]; setBillingItemKeys: React.Dispatch<React.SetStateAction<string[]>>; billingSelected: boolean; setError: (value: string) => void; discountEnabled: boolean; setDiscountEnabled: (value: boolean) => void; billableItems: RequestItem[]; billingSubtotal: number; billingDiscount: number; billingTotal: number; confirmBilling: (payments: SplitPayment[]) => void; close: () => void };

const methodOptions: [PaymentMethod, string][] = [
  ["PIX", "Pix"],
  ["DEBIT_CARD", "Débito"],
  ["CREDIT_CARD", "Crédito"],
  ["CASH", "Dinheiro"],
];
const methodLabel: Record<PaymentMethod, string> = Object.fromEntries(methodOptions) as Record<PaymentMethod, string>;

function parseAmount(value: string) {
  const trimmed = value.trim();
  if (!trimmed) return 0;
  const normalized = trimmed.includes(",")
    ? trimmed.replace(/\./g, "").replace(",", ".")
    : trimmed;
  return Number(normalized) || 0;
}

export function BillingModal({ billingItems, billingItemKeys, setBillingItemKeys, billingSelected, setError, discountEnabled, setDiscountEnabled, billableItems, billingSubtotal, billingDiscount, billingTotal, confirmBilling, close }: Props) {
  const requestKey = (item: RequestItem) => `${item.kind}:${item.id}`;
  const [payments, setPayments] = useState<PaymentDraft[]>([{ id: 1, method: "PIX", amount: String(billingTotal.toFixed(2)), installments: 1 }]);
  const allocated = payments.reduce((sum, payment) => sum + parseAmount(payment.amount), 0);
  const remaining = Math.max(0, billingTotal - allocated);
  const isComplete = Math.abs(allocated - billingTotal) < 0.005;
  const hasInvalidAmount = payments.some((payment) => parseAmount(payment.amount) <= 0);
  const mixedPayment = payments.length > 1 || payments.some((payment) => payment.method !== "PIX" && payment.method !== "CASH");
  const discountAvailable = !mixedPayment;
  const canConfirm = billableItems.length > 0 && isComplete && !hasInvalidAmount && !billingSelected;

  const progress = useMemo(() => billingTotal ? Math.min(100, Math.round(allocated / billingTotal * 100)) : 0, [allocated, billingTotal]);
  const updatePayment = (id: number, changes: Partial<PaymentDraft>) => {
    if (changes.method && changes.method !== "PIX" && changes.method !== "CASH") setDiscountEnabled(false);
    setPayments((current) => current.map((payment) => payment.id === id ? { ...payment, ...changes } : payment));
  };
  const addPayment = () => {
    setDiscountEnabled(false);
    setPayments((current) => [...current, { id: Date.now(), method: "PIX", amount: remaining.toFixed(2), installments: 1 }]);
  };
  const removePayment = (id: number) => setPayments((current) => current.length > 1 ? current.filter((payment) => payment.id !== id) : current);
  const submit = () => {
    if (!isComplete) {
      setError(`Distribua exatamente ${money(billingTotal)} entre as formas de pagamento.`);
      return;
    }
    if (hasInvalidAmount) {
      setError("Informe um valor maior que zero para cada pagamento.");
      return;
    }
    confirmBilling(payments.map(({ method, amount, installments }) => ({ method, amount: parseAmount(amount), installments })));
  };

  return (
    <div className="modal-backdrop secretary-modal-backdrop" onMouseDown={(event) => event.target === event.currentTarget && !billingSelected && close()}>
      <section className="modal secretary-billing-dialog secretary-split-billing-dialog" role="dialog" aria-modal="true" aria-labelledby="secretary-billing-confirm-title">
        <header className="modal-header secretary-dialog-header">
          <div>
            <p className="eyebrow">COBRANÇA · CONFIRMAÇÃO</p>
            <h2 id="secretary-billing-confirm-title">Faturar selecionadas</h2>
            <span>Divida o valor entre uma ou mais formas de pagamento. A venda e o recebível serão criados como pendentes; a entrada no caixa só ocorre ao confirmar o pagamento.</span>
          </div>
          <button className="icon-button" type="button" onClick={close} disabled={billingSelected} aria-label="Fechar faturamento"><X size={18} /></button>
        </header>
        <div className="secretary-billing-dialog-content secretary-split-billing-content">
          <div className="secretary-billing-column">
            <h3>Itens a faturar</h3>
            <div className="secretary-billing-selection-list">
              {billingItems.map((item) => {
                const hasValue = item.amount !== null && Number.isFinite(Number(item.amount)) && Number(item.amount) > 0;
                return <div className={`secretary-billing-selection-item${hasValue ? "" : " secretary-billing-unpriced"}`} key={requestKey(item)}>
                  <label className="secretary-billing-item-check"><input type="checkbox" checked={billingItemKeys.includes(requestKey(item))} disabled={!hasValue || billingSelected} onChange={() => setBillingItemKeys((current) => current.includes(requestKey(item)) ? current.filter((key) => key !== requestKey(item)) : [...current, requestKey(item)])} aria-label={`Incluir ${item.title} no faturamento`} /></label>
                  <div className="secretary-billing-item-copy"><span className={`secretary-request-tag secretary-tag-${item.kind.toLowerCase()}`}>{item.category}</span><strong>{item.title}</strong>{!hasValue && <small>Sem valor informado · não pode ser faturado</small>}</div>
                  {hasValue ? <strong className="secretary-billing-item-price">{money(Number(item.amount))}</strong> : <button type="button" className="secretary-inform-value" onClick={() => setError(`Informe o valor de ${item.title} no cadastro de injetáveis.`)}>Informar valor</button>}
                </div>;
              })}
            </div>
            <label className={`secretary-discount-toggle${!discountAvailable ? " disabled" : ""}`}>
              <span><strong>Liberar desconto de 5%</strong><small>Disponível somente quando há uma forma Pix ou dinheiro.</small></span>
              <input type="checkbox" checked={discountEnabled && discountAvailable} disabled={!discountAvailable || billingSelected} onChange={(event) => setDiscountEnabled(event.target.checked)} />
              <i aria-hidden="true" />
            </label>
          </div>
          <div className="secretary-billing-column secretary-payment-column">
            <div className="secretary-payment-heading"><h3>Formas de pagamento</h3><strong>{payments.length} {payments.length === 1 ? "pagamento" : "pagamentos"}</strong></div>
            <div className="secretary-allocation-card"><div><strong>Alocado <b>{money(allocated)}</b> de {money(billingTotal)}</strong><strong className={remaining ? "is-pending" : "is-complete"}>{remaining ? `Falta ${money(remaining)}` : "Falta R$ 0,00"}</strong></div><div className="secretary-allocation-track"><i style={{ width: `${progress}%` }} /></div></div>
            <div className="secretary-payment-list">
              {payments.map((payment, index) => <article className="secretary-payment-card" key={payment.id}>
                <div className="secretary-payment-card-heading"><h4>Pagamento {index + 1}</h4>{payments.length > 1 && <button type="button" className="secretary-remove-payment" onClick={() => removePayment(payment.id)} disabled={billingSelected}><Trash2 size={14} /> Remover</button>}</div>
                <div className="secretary-payment-methods">{methodOptions.map(([value, label]) => <button type="button" key={value} className={payment.method === value ? "selected" : ""} onClick={() => updatePayment(payment.id, { method: value, installments: value === "CREDIT_CARD" ? Math.max(2, payment.installments) : 1 })} disabled={billingSelected}>{label}</button>)}</div>
                <div className={`secretary-payment-fields${payment.method === "CREDIT_CARD" ? " with-installments" : ""}`}>
                  <label>Valor<input inputMode="decimal" value={payment.amount} onChange={(event) => updatePayment(payment.id, { amount: event.target.value })} disabled={billingSelected} aria-label={`Valor do pagamento ${index + 1}`} /></label>
                  {payment.method === "CREDIT_CARD" && <label>Parcelas<select value={payment.installments} onChange={(event) => updatePayment(payment.id, { installments: Number(event.target.value) })} disabled={billingSelected}>{Array.from({ length: 12 }, (_, value) => value + 1).map((value) => <option key={value} value={value}>{value}x de {money(parseAmount(payment.amount) / value)} sem juros</option>)}</select></label>}
                </div>
              </article>)}
            </div>
            <button type="button" className="secretary-add-payment" onClick={addPayment} disabled={billingSelected || remaining <= 0}><Plus size={16} /> Adicionar forma de pagamento</button>
            <div className="secretary-billing-summary"><div><span>Subtotal ({billableItems.length} {billableItems.length === 1 ? "item" : "itens"})</span><strong>{money(billingSubtotal)}</strong></div><div className="discount"><span>Desconto {billingDiscount ? "5%" : "0%"}</span><strong>− {money(billingDiscount)}</strong></div><div className="total"><span>Total a pagar</span><strong>{money(billingTotal)}</strong></div><small>{payments.map((payment) => `${methodLabel[payment.method]}${payment.method === "CREDIT_CARD" ? ` ${payment.installments}x` : ""} ${money(parseAmount(payment.amount))}`).join(" + ")}</small></div>
          </div>
        </div>
        <footer className="modal-footer secretary-billing-dialog-footer"><button className="secondary" type="button" onClick={close} disabled={billingSelected}>Cancelar</button><button className="primary" type="button" onClick={submit} disabled={!canConfirm}>{billingSelected ? "Faturando…" : `Gerar venda e recebível · ${money(billingTotal)}`}</button></footer>
      </section>
    </div>
  );
}
