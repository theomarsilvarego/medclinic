import React from "react";
import { X } from "lucide-react";
import { money } from "../../lib/app";

type RequestItem = { id: number; kind: "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO" | "CONSULTA"; category: string; title: string; amount: number | null };
type PaymentMethod = "PIX" | "DEBIT_CARD" | "CREDIT_CARD" | "CASH";
type Props = { billingItems: RequestItem[]; billingItemKeys: string[]; setBillingItemKeys: React.Dispatch<React.SetStateAction<string[]>>; billingSelected: boolean; setError: (value: string) => void; paymentAllocations: Record<PaymentMethod, number>; setPaymentAllocations: (value: Record<PaymentMethod, number>) => void; discountAllowed: boolean; discountEnabled: boolean; setDiscountEnabled: (value: boolean) => void; installments: number; setInstallments: (value: number) => void; billableItems: RequestItem[]; billingSubtotal: number; billingDiscount: number; billingTotal: number; confirmBilling: () => void; close: () => void };
const paymentOptions: [PaymentMethod, string][] = [["PIX", "Pix"], ["DEBIT_CARD", "Cartão de débito"], ["CREDIT_CARD", "Cartão de crédito"], ["CASH", "Dinheiro"]];
const paymentLabel: Record<PaymentMethod, string> = { PIX: "Pix", DEBIT_CARD: "Cartão de débito", CREDIT_CARD: "Cartão de crédito", CASH: "Dinheiro" };
export function BillingModal({ billingItems, billingItemKeys, setBillingItemKeys, billingSelected, setError, paymentAllocations, setPaymentAllocations, discountAllowed, discountEnabled, setDiscountEnabled, installments, setInstallments, billableItems, billingSubtotal, billingDiscount, billingTotal, confirmBilling, close }: Props) {
  const requestKey = (item: RequestItem) => `${item.kind}:${item.id}`;
  const assignedCents = paymentOptions.reduce((sum, [method]) => sum + paymentAllocations[method], 0);
  const totalCents = Math.round(billingTotal * 100);
  const remainingCents = totalCents - assignedCents;
  const creditCents = paymentAllocations.CREDIT_CARD;
  const canSubmit = billableItems.length > 0 && assignedCents === totalCents && assignedCents > 0 && !billingSelected;
  return (
    <div className="modal-backdrop secretary-modal-backdrop" onMouseDown={(event) => event.target === event.currentTarget && !billingSelected && close()}>
      <section className="modal secretary-billing-dialog" role="dialog" aria-modal="true" aria-labelledby="secretary-billing-confirm-title">
        <header className="modal-header secretary-dialog-header">
          <div className="secretary-billing-heading">
            <p className="eyebrow">COBRANÇA · CONFIRMAÇÃO</p>
            <h2 id="secretary-billing-confirm-title">Faturar selecionadas</h2>
            <span className="modal-identification-code" aria-label="Código do modal A010">A010</span>
            <p className="secretary-billing-intro">Revise os itens e distribua o valor entre as formas de pagamento. A venda e o recebível permanecerão pendentes.</p>
          </div>
          <button className="icon-button" type="button" onClick={close} disabled={billingSelected} aria-label="Fechar faturamento"><X size={18} /></button>
        </header>
        <div className="secretary-billing-dialog-content">
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
          </div>
          <div className="secretary-billing-column">
            <h3>Divisão do pagamento</h3>
            <p className="secretary-payment-help">Informe quanto será destinado a cada forma. Os valores precisam somar o total.</p>
            <div className="secretary-payment-allocations">
              {paymentOptions.map(([method, label]) => <label className={`secretary-payment-allocation${paymentAllocations[method] > 0 ? " selected" : ""}`} key={method}>
                <span>{label}</span>
                <span className="secretary-payment-amount-input"><span>R$</span><input type="number" min="0" step="0.01" inputMode="decimal" value={paymentAllocations[method] ? (paymentAllocations[method] / 100).toFixed(2) : ""} placeholder="0,00" disabled={billingSelected} onChange={(event) => {
                  const parsed = Number(event.target.value);
                  const amountCents = Number.isFinite(parsed) && parsed > 0 ? Math.round(parsed * 100) : 0;
                  setPaymentAllocations({ ...paymentAllocations, [method]: amountCents });
                  if (method !== "PIX" && method !== "CASH") setDiscountEnabled(false);
                  if (method === "CREDIT_CARD" && amountCents === 0) setInstallments(1);
                }} aria-label={`Valor em ${label}`} /></span>
              </label>)}
            </div>
            <div className={`secretary-payment-balance${remainingCents === 0 ? " balanced" : ""}`} aria-live="polite"><span>{remainingCents > 0 ? "Falta distribuir" : remainingCents < 0 ? "Valor excedente" : "Divisão completa"}</span><strong>{money(Math.abs(remainingCents) / 100)}</strong></div>
            <label className={`secretary-discount-toggle${!discountAllowed ? " disabled" : ""}`}>
              <span><strong>Liberar desconto de 5%</strong><small>Disponível somente quando todas as formas forem Pix ou dinheiro.</small></span>
              <input type="checkbox" checked={discountEnabled && discountAllowed} disabled={!discountAllowed || billingSelected} onChange={(event) => {
                const discountCents = Math.round(billingSubtotal * 5);
                const next = { ...paymentAllocations };
                if (event.target.checked) {
                  const method: PaymentMethod = next.PIX >= discountCents ? "PIX" : "CASH";
                  next[method] = Math.max(0, next[method] - discountCents);
                } else {
                  const method: PaymentMethod = next.PIX > 0 ? "PIX" : "CASH";
                  next[method] += discountCents;
                }
                setPaymentAllocations(next);
                setDiscountEnabled(event.target.checked);
              }} /><i aria-hidden="true" />
            </label>
            {creditCents > 0 && <label className="secretary-installments"><span>Parcelas no crédito ({money(creditCents / 100)})</span><select value={installments} onChange={(event) => setInstallments(Number(event.target.value))} disabled={billingSelected}>{Array.from({ length: 12 }, (_, index) => index + 1).map((value) => <option key={value} value={value}>{value}x · {money(creditCents / 100 / value)}</option>)}</select></label>}
            <div className="secretary-billing-summary">
              <div><span>Subtotal ({billableItems.length} {billableItems.length === 1 ? "item" : "itens"})</span><strong>{money(billingSubtotal)}</strong></div>
              <div className="discount"><span>Desconto {billingDiscount ? "5%" : "0%"}</span><strong>− {money(billingDiscount)}</strong></div>
              <div className="total"><span>Total a pagar</span><strong>{money(billingTotal)}</strong></div>
              {paymentOptions.filter(([method]) => paymentAllocations[method] > 0).map(([method]) => <small key={method}>{paymentLabel[method]}: {money(paymentAllocations[method] / 100)}{method === "CREDIT_CARD" ? ` · ${installments}x` : ""}</small>)}
              <small className="secretary-summary-only-note">O faturamento não confirma pagamento nem movimenta caixa.</small>
            </div>
          </div>
        </div>
        <footer className="modal-footer secretary-billing-dialog-footer"><button className="secondary" type="button" onClick={close} disabled={billingSelected}>Cancelar</button><button className="primary" type="button" onClick={() => void confirmBilling()} disabled={!canSubmit}>{billingSelected ? "Faturando…" : `Gerar venda e recebível · ${money(billingTotal)}`}</button></footer>
      </section>
    </div>
  );
}
