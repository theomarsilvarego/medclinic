import React from "react";
import { X } from "lucide-react";
import { money } from "../../lib/app";

type RequestItem = { id: number; kind: "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO"; category: string; title: string; code: string | null; requestedAt: string; amount: number | null; items: { label: string; value: number | null }[] };
function dateLabel(value: string) { if (!value) return "—"; const date = new Date(`${String(value).slice(0, 10)}T12:00:00`); return Number.isNaN(date.getTime()) ? "—" : date.toLocaleDateString("pt-BR"); }
function requestKindLabel(kind: RequestItem["kind"]) { return { EXAME: "Exame", ULTRASSOM: "Ultrassom", INJETAVEL: "Injetável", PROCEDIMENTO: "Procedimento" }[kind]; }
type Props = { viewing: { patient: string; item: RequestItem }; close: () => void };
export function RequestDetailsModal({ viewing, close }: Props) { return (      
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
            aria-labelledby="secretary-view-title"
          >
            <header className="modal-header secretary-dialog-header">
              <div>
                <p className="eyebrow">
                  {requestKindLabel(viewing.item.kind)} ·{" "}
                  {viewing.item.category}
                </p>
                <h2 id="secretary-view-title">{viewing.item.title}</h2>
                <span>
                  {viewing.patient}
                  {viewing.item.code ? ` · ${viewing.item.code}` : ""}
                </span>
              </div>
              <button
                className="icon-button"
                type="button"
                onClick={close}
                aria-label="Fechar detalhes da solicitação"
              >
                <X size={18} />
              </button>
            </header>
            <div className="secretary-dialog-content">
              <div className="secretary-billing-items">
                {viewing.item.items.map((line, index) => (
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
                  {viewing.item.amount === null
                    ? "Preço não vinculado"
                    : money(viewing.item.amount)}
                </strong>
              </div>
              <p className="secretary-view-date">
                Solicitado em {dateLabel(viewing.item.requestedAt)}
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
