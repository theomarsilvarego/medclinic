import React from "react";
import { X } from "lucide-react";
import { money } from "../../lib/app";

type RequestItem = { id: number; kind: "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO"; category: string; title: string; code: string | null; requestedAt: string; amount: number | null; items: { label: string; value: number | null }[] };
function dateLabel(value: string) { if (!value) return "—"; const date = new Date(`${String(value).slice(0, 10)}T12:00:00`); return Number.isNaN(date.getTime()) ? "—" : date.toLocaleDateString("pt-BR"); }
function requestKindLabel(kind: RequestItem["kind"]) { return { EXAME: "Exame", ULTRASSOM: "Ultrassom", INJETAVEL: "Injetável", PROCEDIMENTO: "Procedimento" }[kind]; }
type Patient = { fullName: string; total: number; unpriced: number };
type Props = { billing: { patient: Patient; item: RequestItem }; close: () => void };
export function BillingDetailsModal({ billing, close }: Props) { return (      
        <div
          className="modal-backdrop secretary-modal-backdrop"
          onMouseDown={(event) =>
            event.target === event.currentTarget && close
          }
        >
          <section
            className="modal secretary-dialog"
            role="dialog"
            aria-modal="true"
            aria-labelledby="secretary-billing-title"
          >
            <header className="modal-header secretary-dialog-header">
              <div>
                <p className="eyebrow">COBRANÇA · RESUMO</p>
                <h2 id="secretary-billing-title">{billing.item.title}</h2>
            <span className="modal-identification-code" aria-label="Código do modal A009">A009</span>
                <span>{billing.patient.fullName}</span>
              </div>
              <button
                className="icon-button"
                type="button"
                onClick={close}
                aria-label="Fechar resumo de cobrança"
              >
                <X size={18} />
              </button>
            </header>
            <div className="secretary-dialog-content">
              <div className="secretary-billing-items">
                {billing.item.items.map((line, index) => (
                  <div key={`${line.label}-${index}`}>
                    <span>{line.label}</span>
                    <strong>
                      {line.value === null
                        ? "Preço não vinculado"
                        : money(line.value)}
                    </strong>
                  </div>
                ))}
              </div>
              <div className="secretary-billing-total">
                <span>Valor desta solicitação</span>
                <strong>
                  {billing.item.amount === null
                    ? "Preço não vinculado"
                    : money(billing.item.amount)}
                </strong>
              </div>
              <div className="secretary-billing-patient-total">
                <span>
                  Total conhecido de todas as solicitações da paciente
                </span>
                <strong>{money(billing.patient.total)}</strong>
              </div>
              {billing.patient.unpriced > 0 && (
                <p className="secretary-unpriced-note">
                  Há {billing.patient.unpriced} solicitação(ões) sem preço
                  cadastrado/vinculado; por isso o total geral pode estar
                  incompleto.
                </p>
              )}
              <p className="secretary-summary-only-note">
                Este resumo não registra nem confirma pagamento.
              </p>
            </div>
            <footer className="modal-footer">
              <button
                className="secondary"
                type="button"
                onClick={close}
              >
                Fechar
              </button>
            </footer>
          </section>
        </div>
        ); }
