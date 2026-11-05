import React, { useRef, useState } from "react";
import { CalendarDays, Check, Info, Plus, UserRound, X } from "lucide-react";

type Status = "INICIADO" | "EM_ANDAMENTO" | "CONCLUIDO";
type ProductType = "INJETAVEL" | "PROCEDIMENTO";
type Category =
  | "VACINAS"
  | "VITAMINAS"
  | "PROTOCOLOS"
  | "MEDICACOES"
  | "LASER_INTIMO"
  | "CLAREAMENTO_INTIMO"
  | "MANUTENCAO_LASER";
type FormState = {
  patientId: string;
  productType: ProductType;
  productId: string;
  category: Category;
  status: Status;
  doseDates: string[];
  observation: string;
};
type Catalog = {
  patients: { id: number; fullName: string; phone?: string | null }[];
  injectables: { id: number; name: string; type: string }[];
  procedures: { id: number; name: string; type?: string | null }[];
};
type Product = { id: number; name: string; detail: string };

const categories: { value: Category; label: string }[] = [
  { value: "VACINAS", label: "Vacinas" },
  { value: "VITAMINAS", label: "Vitaminas" },
  { value: "PROTOCOLOS", label: "Protocolos" },
  { value: "MEDICACOES", label: "Medicações" },
  { value: "LASER_INTIMO", label: "Laser íntimo" },
  { value: "CLAREAMENTO_INTIMO", label: "Clareamento íntimo" },
  { value: "MANUTENCAO_LASER", label: "Manutenção Laser" },
];
const statuses: { value: Status; label: string }[] = [
  { value: "INICIADO", label: "Iniciado" },
  { value: "EM_ANDAMENTO", label: "Em andamento" },
  { value: "CONCLUIDO", label: "Concluído" },
];

type Props = {
  editing: boolean;
  form: FormState;
  catalog: Catalog;
  products: Product[];
  saving: boolean;
  error: string;
  onClose: () => void;
  onSave: (event: React.FormEvent) => void;
  onUpdateForm: <K extends keyof FormState>(
    key: K,
    value: FormState[K],
  ) => void;
  onChangeProductType: (value: ProductType) => void;
  onAddDose: () => void;
  onUpdateDose: (index: number, value: string) => void;
  onRemoveDose: (index: number) => void;
};

export function CrmTreatmentModal({
  editing,
  form,
  catalog,
  products,
  saving,
  error,
  onClose,
  onSave,
  onUpdateForm,
  onChangeProductType,
  onAddDose,
  onUpdateDose,
  onRemoveDose,
}: Props) {
  const [patientSearch, setPatientSearch] = useState("");
  const [patientPickerOpen, setPatientPickerOpen] = useState(false);
  const patientInputRef = useRef<HTMLInputElement>(null);
  const normalizedPatientSearch = patientSearch
    .trim()
    .toLocaleLowerCase("pt-BR");
  const filteredPatients = catalog.patients.filter(
    (patient) =>
      !normalizedPatientSearch ||
      patient.fullName
        .toLocaleLowerCase("pt-BR")
        .includes(normalizedPatientSearch),
  );
  const selectedPatient = catalog.patients.find(
    (patient) => Number(patient.id) === Number(form.patientId),
  );
  const patientOptions =
    selectedPatient &&
    !filteredPatients.some(
      (patient) => Number(patient.id) === Number(selectedPatient.id),
    )
      ? [selectedPatient, ...filteredPatients]
      : filteredPatients;

  return (
    <div className="modal-backdrop appointment-backdrop">
      <div
        className="modal appointment-modal crm-treatment-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="crm-treatment-title"
        aria-describedby="crm-treatment-description"
      >
        <header className="modal-header appointment-modal-header">
          <div className="crm-modal-heading">
            <p className="crm-modal-kicker">CRM · ATENDIMENTO</p>
            <h2 id="crm-treatment-title">
              {editing ? "Editar atendimento" : "Novo atendimento"}
            </h2>
            <span
              className="modal-identification-code"
              aria-label="Código do modal A002"
            >
              A002
            </span>
          </div>
          <button
            type="button"
            className="icon-button"
            onClick={onClose}
            disabled={saving}
            aria-label="Fechar"
          >
            <X size={21} />
          </button>
        </header>

        <form id="crm-treatment-form" onSubmit={onSave} className="crm-form">
          <div className="modal-fields appointment-modal-fields crm-treatment-fields">
            {error && (
              <div className="error" role="alert">
                {error}
              </div>
            )}

            <section
              className="appointment-section crm-treatment-section crm-patient-section"
              aria-labelledby="crm-patient-title"
            >
              <label className="appointment-patient-field crm-field-full">
                <span className="crm-field-label">Buscar paciente</span>
                <div className="appointment-patient-picker">
                  <input
                    ref={patientInputRef}
                    className="appointment-patient-search"
                    type="search"
                    required={!form.patientId}
                    value={patientSearch || selectedPatient?.fullName || ""}
                    onFocus={() => setPatientPickerOpen(true)}
                    onBlur={() =>
                      setTimeout(() => setPatientPickerOpen(false), 120)
                    }
                    onChange={(event) => {
                      const value = event.target.value;
                      setPatientSearch(value);
                      setPatientPickerOpen(true);
                      if (
                        !selectedPatient ||
                        value !== selectedPatient.fullName
                      )
                        onUpdateForm("patientId", "");
                      event.currentTarget.setCustomValidity("");
                    }}
                    onInvalid={(event) =>
                      event.currentTarget.setCustomValidity(
                        "Selecione um paciente na lista de resultados.",
                      )
                    }
                    placeholder="Buscar paciente por nome"
                    aria-label="Buscar paciente por nome"
                    aria-expanded={patientPickerOpen}
                    aria-autocomplete="list"
                  />
                  {patientPickerOpen && (
                    <div className="appointment-patient-options" role="listbox">
                      {patientOptions.length ? (
                        patientOptions.map((patient) => (
                          <button
                            type="button"
                            key={patient.id}
                            className={
                              Number(form.patientId) === Number(patient.id)
                                ? "selected"
                                : ""
                            }
                            onMouseDown={(event) => event.preventDefault()}
                            onClick={() => {
                              onUpdateForm("patientId", String(patient.id));
                              setPatientSearch(patient.fullName);
                              setPatientPickerOpen(false);
                              patientInputRef.current?.setCustomValidity("");
                            }}
                          >
                            {patient.fullName}
                          </button>
                        ))
                      ) : (
                        <span className="appointment-patient-empty">
                          Nenhum paciente encontrado.
                        </span>
                      )}
                    </div>
                  )}
                </div>
              </label>
            </section>

            <section
              className="appointment-section crm-treatment-section crm-details-section"
              aria-labelledby="crm-details-title"
            >
              <div className="crm-form-grid">
                <label>
                  <select
                    value={form.productType}
                    onChange={(event) =>
                      onChangeProductType(event.target.value as ProductType)
                    }
                  >
                    <option value="INJETAVEL">Injetável</option>
                    <option value="PROCEDIMENTO">
                      Processo / procedimento
                    </option>
                  </select>
                </label>
                <label>
                  <select
                    required
                    value={form.productId}
                    onChange={(event) => {
                      onUpdateForm("productId", event.target.value);
                      event.currentTarget.setCustomValidity("");
                    }}
                    onInvalid={(event) =>
                      event.currentTarget.setCustomValidity(
                        "Selecione o produto ou processo do atendimento.",
                      )
                    }
                  >
                    <option value="">Selecione</option>
                    {products.map((product) => (
                      <option
                        value={product.id}
                        key={`${form.productType}-${product.id}`}
                      >
                        {product.name}
                      </option>
                    ))}
                  </select>
                </label>
              </div>

              <div className="crm-form-grid">
                <label>
                  <select
                    value={form.category}
                    onChange={(event) =>
                      onUpdateForm("category", event.target.value as Category)
                    }
                  >
                    {categories.map((item) => (
                      <option value={item.value} key={item.value}>
                        {item.label}
                      </option>
                    ))}
                  </select>
                </label>
                <label>
                  <select
                    value={form.status}
                    onChange={(event) =>
                      onUpdateForm("status", event.target.value as Status)
                    }
                  >
                    {statuses.map((item) => (
                      <option value={item.value} key={item.value}>
                        {item.label}
                      </option>
                    ))}
                  </select>
                </label>
              </div>
            </section>

            <section className="appointment-section crm-treatment-section crm-dose-section">
              <div className="appointment-attachments-title crm-section-heading">
                <div>
                  <span>
                    <CalendarDays size={17} /> Doses / sessões{" "}
                    <b>{form.doseDates.filter(Boolean).length} registrada(s)</b>
                  </span>
                  <p className="crm-section-description">
                    Adicione as datas para acompanhar a evolução do protocolo.
                  </p>
                </div>
                <button
                  type="button"
                  className="secondary crm-add-dose"
                  onClick={onAddDose}
                >
                  <Plus size={16} /> Adicionar dose
                </button>
              </div>
              <div className="crm-dose-list">
                {form.doseDates.map((date, index) => (
                  <div className="crm-dose-row" key={`dose-${index}`}>
                    <span className="crm-dose-index">
                      {String(index + 1).padStart(2, "0")}
                    </span>
                    <CalendarDays size={18} aria-hidden="true" />
                    <label>
                      <span className="crm-dose-label">
                        Data da dose {index + 1}
                      </span>
                      <input
                        type="date"
                        required
                        // Converte a data para o formato YYYY-MM-DD que o input exige.
                        value={
                          date ? new Date(date).toISOString().slice(0, 10) : ""
                        }
                        onChange={(event) => {
                          onUpdateDose(index, event.target.value);
                          event.currentTarget.setCustomValidity("");
                        }}
                        onInvalid={(event) =>
                          event.currentTarget.setCustomValidity(
                            "Informe a data desta dose ou sessão.",
                          )
                        }
                        aria-label={`Data da dose ${index + 1}`}
                      />
                    </label>
                    <button
                      type="button"
                      className="icon-button"
                      onClick={() => onRemoveDose(index)}
                      aria-label={`Remover dose ${index + 1}`}
                    >
                      <X size={17} />
                    </button>
                  </div>
                ))}
              </div>
              <p className="crm-dose-rule">
                <Check size={14} /> 1 dose: Iniciado · 2 doses: Em andamento · 3
                ou mais: Concluído
              </p>
            </section>

            <section
              className="appointment-section crm-treatment-section crm-observation-section"
              aria-labelledby="crm-observation-title"
            >
              <label className="crm-field-full">
                <textarea
                  rows={4}
                  value={form.observation}
                  onChange={(event) =>
                    onUpdateForm("observation", event.target.value)
                  }
                  placeholder="Inclua orientações ou observações do atendimento"
                />
              </label>
            </section>
          </div>
        </form>

        <div className="modal-footer appointment-modal-footer">
          <button
            type="button"
            className="secondary"
            onClick={onClose}
            disabled={saving}
          >
            Cancelar
          </button>
          <button
            type="submit"
            form="crm-treatment-form"
            className="primary"
            disabled={saving}
          >
            <Check size={16} /> {saving ? "Salvando…" : "Salvar atendimento"}
          </button>
        </div>
      </div>
    </div>
  );
}
