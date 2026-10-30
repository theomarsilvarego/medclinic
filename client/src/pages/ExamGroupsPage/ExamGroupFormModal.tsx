import React from "react";
import { Search, X } from "lucide-react";
import { money } from "../../lib/app";
import type { Row } from "../../lib/app";

type ExamGroup = Row & { items?: Row[] };
export function ExamGroupFormModal(props: {
  editing: ExamGroup; name: string; selectedIds: number[]; examSearch: string;
  saving: boolean; error: string; filteredExams: Row[];
  onClose: () => void; onSave: (event: React.FormEvent) => void;
  onNameChange: (value: string) => void; onSearchChange: (value: string) => void;
  onToggleExam: (id: number) => void;
}) {
  const { editing, name, selectedIds, examSearch, saving, filteredExams, onClose, onSave, onNameChange, onSearchChange, onToggleExam } = props;
  return (
      <>
        <div className="modal-backdrop">
          <form className="exam-group-modal" onSubmit={onSave}>
            <div className="modal-header">
              <div>
                <p className="eyebrow">CONFIGURAÇÃO MÉDICA</p>
                <h2>{editing.id ? "Editar grupo" : "Novo grupo de exames"}</h2>
            <span className="modal-identification-code" aria-label="Código do modal A005">A005</span>
              </div>
              <button type="button" className="icon-button" onClick={onClose}>
                <X size={19} />
              </button>
            </div>
            <div className="exam-group-form">
              <label>
                Nome do grupo
                <input
                  autoFocus
                  value={name}
                  onChange={(event) => onNameChange(event.target.value)}
                  placeholder="Ex.: Check-up anual"
                />
              </label>
              <div className="exam-picker-head">
                <div>
                  <strong>Exames do grupo</strong>
                  <small>Selecione um ou mais tipos cadastrados.</small>
                </div>
                <span>{selectedIds.length} selecionado(s)</span>
              </div>
              <label className="exam-search">
                <Search size={15} />
                <input
                  value={examSearch}
                  onChange={(event) => onSearchChange(event.target.value)}
                  placeholder="Pesquisar exame por código ou nome..."
                />
              </label>
              <div className="exam-picker">
                {filteredExams.length === 0 ? (
                  <span className="exam-picker-empty">Nenhum tipo de exame disponível.</span>
                ) : (
                  filteredExams.map((exam) => (
                    <label
                      className={selectedIds.includes(Number(exam.id)) ? "exam-option selected" : "exam-option"}
                      key={exam.id}
                    >
                      <input
                        type="checkbox"
                        checked={selectedIds.includes(Number(exam.id))}
                        onChange={() => onToggleExam(Number(exam.id))}
                      />
                      <span>
                        <strong>{exam.name}</strong>
                        <small>
                          {exam.code} · {money(Number(exam.value || 0))}
                        </small>
                      </span>
                    </label>
                  ))
                )}
              </div>
            </div>
            <div className="modal-footer">
              <button type="button" className="secondary" onClick={onClose}>
                Cancelar
              </button>
              <button type="submit" className="primary" disabled={saving}>
                {saving ? "Salvando…" : "Salvar grupo"}
              </button>
            </div>
          </form>
        </div>
      </>
  );
}
