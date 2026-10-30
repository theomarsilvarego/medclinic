import { useState } from "react";
import { X } from "lucide-react";
import type { Row } from "../../lib/app";
import type { ResourceField } from "./types";
import "./ResourceCatalog.css";

type Props = {
  title: string;
  fields: ResourceField[];
  initial: Row;
  onClose: () => void;
  onSave: (data: Row) => void;
};

export function ResourceFormModal({
  title,
  fields,
  initial,
  onClose,
  onSave,
}: Props) {
  const [data, setData] = useState<Row>(initial);
  const update = (key: string, value: unknown) =>
    setData((current) => ({ ...current, [key]: value }));

  return (
    <div
      className="modal-backdrop"
      onMouseDown={(event) => {
        if (event.target === event.currentTarget) onClose();
      }}
    >
      <section
        className="modal appointment-modal crud-entry-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="resource-modal-title"
      >
        <header className="modal-header appointment-modal-header">
          <div>
            <h2 id="resource-modal-title">{title}</h2>
            <span
              className="modal-identification-code"
              aria-label="Código do modal A003"
            >
              A003
            </span>
          </div>
          <button
            className="icon-button"
            type="button"
            onClick={onClose}
            aria-label="Fechar cadastro"
          >
            <X size={19} />
          </button>
        </header>

        <div className="modal-fields appointment-modal-fields crud-entry-fields">
          <section className="appointment-section crud-entry-section">
            {fields.map((field) => {
              const fieldId = `resource-${field.key}`;
              if (field.type === "checkbox") {
                return (
                  <label
                    key={field.key}
                    htmlFor={fieldId}
                    data-field-key={field.key}
                    className="check-label"
                  >
                    <input
                      id={fieldId}
                      type="checkbox"
                      checked={data[field.key] ?? true}
                      onChange={(event) =>
                        update(field.key, event.target.checked)
                      }
                    />
                    {field.label}
                  </label>
                );
              }
              const value =
                field.type === "date" && data[field.key]
                  ? String(data[field.key]).slice(0, 10)
                  : String(data[field.key] ?? "");
              return (
                <label
                  key={field.key}
                  htmlFor={fieldId}
                  data-field-key={field.key}
                  className={`modal-form-field${field.fullWidth ? " modal-field-full-width" : ""}`}
                >
                  <span>{field.label}</span>
                  {field.type === "select" ? (
                    <select
                      id={fieldId}
                      value={value}
                      onChange={(event) =>
                        update(field.key, event.target.value)
                      }
                    >
                      <option value="">Selecione…</option>
                      {field.options?.map((option) => {
                        const optionValue =
                          typeof option === "string" ? option : option.value;
                        const optionLabel =
                          typeof option === "string" ? option : option.label;
                        return (
                          <option key={optionValue} value={optionValue}>
                            {optionLabel}
                          </option>
                        );
                      })}
                    </select>
                  ) : field.type === "textarea" ? (
                    <textarea
                      id={fieldId}
                      rows={4}
                      value={value}
                      placeholder={field.placeholder}
                      onChange={(event) =>
                        update(field.key, event.target.value)
                      }
                    />
                  ) : (
                    <input
                      id={fieldId}
                      type={field.type || "text"}
                      value={value}
                      placeholder={field.placeholder}
                      onChange={(event) =>
                        update(field.key, event.target.value)
                      }
                    />
                  )}
                </label>
              );
            })}
          </section>
        </div>

        <footer className="modal-footer appointment-modal-footer">
          <button className="secondary" type="button" onClick={onClose}>
            Cancelar
          </button>
          <button
            className="primary"
            type="button"
            onClick={() => onSave(data)}
          >
            Salvar cadastro
          </button>
        </footer>
      </section>
    </div>
  );
}
