import React from "react";
import { X } from "lucide-react";
import { money } from "../../lib/app";
import type { Row } from "../../lib/app";

type ExamGroup = Row & { items?: Row[] };

export function ExamGroupValuesModal({ group, onClose }: { group: ExamGroup; onClose: () => void }) {
  const items = group.items || [];
  const invoiceTotal = items.reduce((total, item) => total + Number(item.examType?.invoiceValue || 0), 0);
  const valueTotal = items.reduce((total, item) => total + Number(item.examType?.value || 0), 0);
  return (
      <>
        <div
          className="modal-backdrop"
          onMouseDown={(event) =>
            event.target === event.currentTarget && onClose()
          }
        >
          <section
            className="exam-group-values-modal"
            role="dialog"
            aria-modal="true"
            aria-labelledby="exam-group-values-title"
          >
            <div className="modal-header">
              <div>
                <p className="eyebrow">CONFIGURAÇÃO MÉDICA</p>
                <h2 id="exam-group-values-title">Tipos de exames</h2>
            <span className="modal-identification-code" aria-label="Código do modal A006">A006</span>
                <span className="exam-group-values-subtitle">{group.name}</span>
              </div>
              <button
                type="button"
                className="icon-button"
                onClick={() => onClose()}
                aria-label="Fechar relação de exames"
              >
                <X size={19} />
              </button>
            </div>
            <div className="exam-group-values-content">
              <div className="exam-group-values-table" role="table" aria-label={`Tipos de exames do grupo ${group.name}`}>
                <div className="exam-group-values-row exam-group-values-head" role="row">
                  <span role="columnheader">Tipo de exame</span>
                  <span role="columnheader">Valor nota</span>
                  <span role="columnheader">Valor</span>
                </div>
                {items.map((item) => (
                  <div className="exam-group-values-row" role="row" key={item.id}>
                    <span role="cell">
                      {item.examType?.code ? `${item.examType.code} · ` : ""}
                      {item.examType?.name || "Exame"}
                    </span>
                    <strong role="cell">{money(Number(item.examType?.invoiceValue || 0))}</strong>
                    <strong role="cell">{money(Number(item.examType?.value || 0))}</strong>
                  </div>
                ))}
              </div>
            </div>
            <div className="exam-group-values-footer">
              <strong>Total</strong>
              <strong>{money(invoiceTotal)}</strong>
              <strong>{money(valueTotal)}</strong>
            </div>
            <div className="modal-footer">
              <button type="button" className="secondary" onClick={() => onClose()}>
                Fechar
              </button>
            </div>
          </section>
        </div>
      </>
  );
}
