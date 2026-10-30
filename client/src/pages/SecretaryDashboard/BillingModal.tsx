import React from "react";
import { X } from "lucide-react";
import { money } from "../../lib/app";

type RequestItem = { id: number; kind: "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO"; category: string; title: string; amount: number | null };
type PaymentMethod = "PIX" | "DEBIT_CARD" | "CREDIT_CARD" | "CASH";
type Props = { billingItems: RequestItem[]; billingItemKeys: string[]; setBillingItemKeys: React.Dispatch<React.SetStateAction<string[]>>; billingSelected: boolean; setError: (value: string) => void; paymentMethod: PaymentMethod; setPaymentMethod: (value: PaymentMethod) => void; discountAllowed: boolean; discountEnabled: boolean; setDiscountEnabled: (value: boolean) => void; installments: number; setInstallments: (value: number) => void; billableItems: RequestItem[]; billingSubtotal: number; billingDiscount: number; billingTotal: number; confirmBilling: () => void; close: () => void };
export function BillingModal({ billingItems, billingItemKeys, setBillingItemKeys, billingSelected, setError, paymentMethod, setPaymentMethod, discountAllowed, discountEnabled, setDiscountEnabled, installments, setInstallments, billableItems, billingSubtotal, billingDiscount, billingTotal, confirmBilling, close }: Props) {
  const requestKey = (item: RequestItem) => `${item.kind}:${item.id}`;
  return (      
        <div
          className="modal-backdrop secretary-modal-backdrop"
          onMouseDown={(event) =>
            event.target === event.currentTarget &&
            !billingSelected &&
            close()
          }
        >
          <section
            className="modal secretary-billing-dialog"
            role="dialog"
            aria-modal="true"
            aria-labelledby="secretary-billing-confirm-title"
          >
            <header className="modal-header secretary-dialog-header">
              <div>
                <p className="eyebrow">COBRANÇA · CONFIRMAÇÃO</p>
                <h2 id="secretary-billing-confirm-title">
                  Faturar selecionadas
                </h2>
                <span>Revise os itens e defina a forma prevista. A venda e o recebível serão criados como pendentes; a entrada no caixa só ocorre ao confirmar o pagamento.</span>
              </div>
              <button
                className="icon-button"
                type="button"
                onClick={close}
                disabled={billingSelected}
                aria-label="Fechar faturamento"
              >
                <X size={18} />
              </button>
            </header>
            <div className="secretary-billing-dialog-content">
              <div className="secretary-billing-column">
                <h3>Itens a faturar</h3>
                <div className="secretary-billing-selection-list">
                  {billingItems.map((item) => {
                    const hasValue =
                      item.amount !== null &&
                      Number.isFinite(Number(item.amount)) &&
                      Number(item.amount) > 0;
                    return (
                      <div
                        className={`secretary-billing-selection-item${hasValue ? "" : " secretary-billing-unpriced"}`}
                        key={requestKey(item)}
                      >
                        <label className="secretary-billing-item-check">
                          <input
                            type="checkbox"
                            checked={billingItemKeys.includes(requestKey(item))}
                            disabled={!hasValue || billingSelected}
                            onChange={() =>
                              setBillingItemKeys((current) =>
                                current.includes(requestKey(item))
                                  ? current.filter(
                                      (key) => key !== requestKey(item),
                                    )
                                  : [...current, requestKey(item)],
                              )
                            }
                            aria-label={`Incluir ${item.title} no faturamento`}
                          />
                        </label>
                        <div className="secretary-billing-item-copy">
                          <span
                            className={`secretary-request-tag secretary-tag-${item.kind.toLowerCase()}`}
                          >
                            {item.category}
                          </span>
                          <strong>{item.title}</strong>
                          {!hasValue && (
                            <small>
                              Sem valor informado · não pode ser faturado
                            </small>
                          )}
                        </div>
                        {hasValue ? (
                          <strong className="secretary-billing-item-price">
                            {money(Number(item.amount))}
                          </strong>
                        ) : (
                          <button
                            type="button"
                            className="secretary-inform-value"
                            onClick={() =>
                              setError(
                                `Informe o valor de ${item.title} no cadastro de injetáveis.`,
                              )
                            }
                          >
                            Informar valor
                          </button>
                        )}
                      </div>
                    );
                  })}
                </div>
              </div>
              <div className="secretary-billing-column">
                <h3>Forma de pagamento</h3>
                <div className="secretary-payment-options">
                  {(
                    [
                      ["PIX", "Pix"],
                      ["DEBIT_CARD", "Cartão de débito"],
                      ["CREDIT_CARD", "Cartão de crédito"],
                      ["CASH", "Dinheiro"],
                    ] as [PaymentMethod, string][]
                  ).map(([value, label]) => (
                    <label
                      className={`secretary-payment-option${paymentMethod === value ? " selected" : ""}`}
                      key={value}
                    >
                      <input
                        type="radio"
                        name="secretary-payment-method"
                        value={value}
                        checked={paymentMethod === value}
                        onChange={() => {
                          setPaymentMethod(value);
                          if (value !== "PIX" && value !== "CASH")
                            setDiscountEnabled(false);
                        }}
                      />
                      <span>{label}</span>
                    </label>
                  ))}
                </div>
                <label
                  className={`secretary-discount-toggle${!discountAllowed ? " disabled" : ""}`}
                >
                  <span>
                    <strong>Liberar desconto de 5%</strong>
                    <small>
                      Aplicado sobre o subtotal dos itens selecionados.
                    </small>
                  </span>
                  <input
                    type="checkbox"
                    checked={discountEnabled && discountAllowed}
                    disabled={!discountAllowed || billingSelected}
                    onChange={(event) =>
                      setDiscountEnabled(event.target.checked)
                    }
                  />
                  <i aria-hidden="true" />
                </label>
                {paymentMethod === "CREDIT_CARD" && (
                  <label className="secretary-installments">
                    <span>Parcelas</span>
                    <select
                      value={installments}
                      onChange={(event) =>
                        setInstallments(Number(event.target.value))
                      }
                      disabled={billingSelected}
                    >
                      {Array.from({ length: 12 }, (_, index) => index + 1).map(
                        (value) => (
                          <option key={value} value={value}>
                            {value}x {money(billingTotal / value)}
                          </option>
                        ),
                      )}
                    </select>
                  </label>
                )}
                <div className="secretary-billing-summary">
                  <div>
                    <span>
                      Subtotal ({billableItems.length}{" "}
                      {billableItems.length === 1 ? "item" : "itens"})
                    </span>
                    <strong>{money(billingSubtotal)}</strong>
                  </div>
                  <div className="discount">
                    <span>Desconto {billingDiscount ? "5%" : "0%"}</span>
                    <strong>− {money(billingDiscount)}</strong>
                  </div>
                  <div className="total">
                    <span>Total a pagar</span>
                    <strong>{money(billingTotal)}</strong>
                  </div>
                  <small>
                    Pagamento:{" "}
                    {
                      (
                        {
                          PIX: "Pix",
                          DEBIT_CARD: "Cartão de débito",
                          CREDIT_CARD: "Cartão de crédito",
                          CASH: "Dinheiro",
                        } as Record<PaymentMethod, string>
                      )[paymentMethod]
                    }
                    {paymentMethod === "CREDIT_CARD"
                      ? ` · ${installments}x`
                      : ""}
                  </small>
                  <small className="secretary-summary-only-note">O faturamento não confirma pagamento nem movimenta caixa.</small>
                </div>
              </div>
            </div>
            <footer className="modal-footer secretary-billing-dialog-footer">
              <button
                className="secondary"
                type="button"
                onClick={close}
                disabled={billingSelected}
              >
                Cancelar
              </button>
              <button
                className="primary"
                type="button"
                onClick={() => void confirmBilling()}
                disabled={!billableItems.length || billingSelected}
              >
                {billingSelected
                  ? "Faturando…"
                  : `Gerar venda e recebível · ${money(billingTotal)}`}
              </button>
            </footer>
          </section>
        </div>
        );
}
