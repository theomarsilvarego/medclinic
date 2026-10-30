import React, { useEffect, useMemo, useState } from "react";
import {
  CalendarDays,
  Check,
  GripVertical,
  Pencil,
  Plus,
  Search,
  Trash2,
  X,
} from "lucide-react";
import { request } from "../../lib/app";

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
type Treatment = {
  id: number;
  patientId: number;
  patient: { id: number; fullName: string; phone?: string | null };
  productType: ProductType;
  productId: number;
  productName: string;
  category: Category;
  status: Status;
  observation?: string | null;
  doseDates: string[];
  doseCount: number;
};
type Catalog = {
  patients: { id: number; fullName: string; phone?: string | null }[];
  injectables: { id: number; name: string; type: string }[];
  procedures: { id: number; name: string; type?: string | null }[];
};
type FormState = {
  patientId: string;
  productType: ProductType;
  productId: string;
  category: Category;
  status: Status;
  doseDates: string[];
  observation: string;
};

const categories: { value: Category; label: string }[] = [
  ["VACINAS", "Vacinas"],
  ["VITAMINAS", "Vitaminas"],
  ["PROTOCOLOS", "Protocolos"],
  ["MEDICACOES", "Medicações"],
  ["LASER_INTIMO", "Laser íntimo"],
  ["CLAREAMENTO_INTIMO", "Clareamento íntimo"],
  ["MANUTENCAO_LASER", "Manutenção Laser"],
].map(([value, label]) => ({ value: value as Category, label }));
const statuses: { value: Status; label: string }[] = [
  { value: "INICIADO", label: "Iniciado" },
  { value: "EM_ANDAMENTO", label: "Em andamento" },
  { value: "CONCLUIDO", label: "Concluído" },
];
const statusOrder: Status[] = ["INICIADO", "EM_ANDAMENTO", "CONCLUIDO"];
const statusLabels = Object.fromEntries(
  statuses.map((item) => [item.value, item.label]),
) as Record<Status, string>;
const categoryLabels = Object.fromEntries(
  categories.map((item) => [item.value, item.label]),
) as Record<Category, string>;

function today() {
  const value = new Date();
  return `${value.getFullYear()}-${String(value.getMonth() + 1).padStart(2, "0")}-${String(value.getDate()).padStart(2, "0")}`;
}
function dateLabel(value: any) {
  if (!value) return "—";

  // Cria um objeto Date real independente do que venha (String, Objeto, etc)
  const date = new Date(value);

  // Se a data for inválida, retorna o traço
  if (isNaN(date.getTime())) return "—";

  // Usa o fuso horário UTC para garantir que o dia "29" ou "30" não mude de acordo com a máquina
  const day = String(date.getUTCDate()).padStart(2, "0");
  const month = String(date.getUTCMonth() + 1).padStart(2, "0");
  const year = date.getUTCFullYear();

  return `${day}/${month}/${year}`;
}

function emptyForm(): FormState {
  return {
    patientId: "",
    productType: "INJETAVEL",
    productId: "",
    category: "VITAMINAS",
    status: "INICIADO",
    doseDates: [today()],
    observation: "",
  };
}
export function CrmPage() {
  const [view, setView] = useState<"attendances" | "kanban">("attendances");
  const [treatments, setTreatments] = useState<Treatment[]>([]);
  const [catalog, setCatalog] = useState<Catalog>({
    patients: [],
    injectables: [],
    procedures: [],
  });
  const [editing, setEditing] = useState<Treatment | null>(null);
  const [form, setForm] = useState<FormState>(emptyForm());
  const [modalOpen, setModalOpen] = useState(false);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");
  const [search, setSearch] = useState("");
  const [categoryFilter, setCategoryFilter] = useState("");
  const [draggedId, setDraggedId] = useState<number | null>(null);

  async function load() {
    setLoading(true);
    setError("");
    try {
      const [treatmentRows, catalogData] = await Promise.all([
        request("/admin/crm/treatments"),
        request("/admin/crm/catalog"),
      ]);
      setTreatments(treatmentRows || []);
      setCatalog(
        catalogData || { patients: [], injectables: [], procedures: [] },
      );
    } catch (cause: any) {
      setError(cause.message || "Não foi possível carregar o CRM.");
    } finally {
      setLoading(false);
    }
  }
  useEffect(() => {
    void load();
  }, []);

  const products = useMemo(
    () =>
      form.productType === "INJETAVEL"
        ? catalog.injectables.map((item) => ({
            id: item.id,
            name: item.name,
            detail: item.type,
          }))
        : catalog.procedures.map((item) => ({
            id: item.id,
            name: item.name,
            detail: item.type || "Processo",
          })),
    [catalog, form.productType],
  );
  const filtered = useMemo(() => {
    const term = search.trim().toLocaleLowerCase("pt-BR");
    return treatments.filter((item) => {
      const matchesSearch =
        !term ||
        `${item.patient.fullName} ${item.productName}`
          .toLocaleLowerCase("pt-BR")
          .includes(term);
      return (
        matchesSearch && (!categoryFilter || item.category === categoryFilter)
      );
    });
  }, [treatments, search, categoryFilter]);

  function openNew() {
    setEditing(null);
    setForm(emptyForm());
    setError("");
    setModalOpen(true);
  }
  function openEdit(item: Treatment) {
    setEditing(item);
    setForm({
      patientId: String(item.patientId),
      productType: item.productType,
      productId: String(item.productId),
      category: item.category,
      status: item.status,
      doseDates: item.doseDates.length ? item.doseDates : [today()],
      observation: item.observation || "",
    });
    setError("");
    setModalOpen(true);
  }
  function updateForm<K extends keyof FormState>(key: K, value: FormState[K]) {
    setForm((current) => ({ ...current, [key]: value }));
  }
  function changeProductType(value: ProductType) {
    setForm((current) => ({ ...current, productType: value, productId: "" }));
  }
  function addDose() {
    updateForm("doseDates", [...form.doseDates, ""]);
  }
  function updateDose(index: number, value: string) {
    updateForm(
      "doseDates",
      form.doseDates.map((date, current) => (current === index ? value : date)),
    );
  }
  function removeDose(index: number) {
    const next = form.doseDates.filter((_, current) => current !== index);
    updateForm("doseDates", next.length ? next : [""]);
  }
  async function save(event: React.FormEvent) {
    event.preventDefault();
    const doseDates = form.doseDates.filter(Boolean);
    if (!form.patientId || !form.productId || !doseDates.length) {
      setError(
        "Informe paciente, produto/processo e pelo menos uma data de dose.",
      );
      return;
    }
    setSaving(true);
    setError("");
    try {
      await request(`/admin/crm/treatments${editing ? `/${editing.id}` : ""}`, {
        method: editing ? "PUT" : "POST",
        body: JSON.stringify({
          ...form,
          patientId: Number(form.patientId),
          productId: Number(form.productId),
          doseDates,
        }),
      });
      setModalOpen(false);
      setEditing(null);
      await load();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível salvar o atendimento CRM.");
    } finally {
      setSaving(false);
    }
  }
  async function remove(item: Treatment) {
    if (!window.confirm(`Excluir o atendimento de ${item.patient.fullName}?`))
      return;
    try {
      await request(`/admin/crm/treatments/${item.id}`, { method: "DELETE" });
      await load();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível excluir o atendimento.");
    }
  }
  async function move(item: Treatment, status: Status) {
    if (item.status === status) return;
    setTreatments((current) =>
      current.map((entry) =>
        entry.id === item.id ? { ...entry, status } : entry,
      ),
    );
    try {
      await request(`/admin/crm/treatments/${item.id}/status`, {
        method: "PATCH",
        body: JSON.stringify({ status }),
      });
    } catch (cause: any) {
      setError(cause.message || "Não foi possível mover o cartão.");
      await load();
    }
  }

  return (
    <>
      <div className="page-heading crm-page-heading">
        <div>
          <p className="eyebrow">GESTÃO DE PACIENTES</p>
          <h1>CRM</h1>
          <p className="muted">
            Acompanhe vacinas, protocolos, medicações e procedimentos por doses.
          </p>
        </div>
        <button className="primary" type="button" onClick={openNew}>
          <Plus size={17} /> Novo atendimento
        </button>
      </div>
      {error && !modalOpen && <div className="error page-error">{error}</div>}
      <div
        className="crm-view-switcher"
        role="tablist"
        aria-label="Visualização do CRM"
      >
        <button
          className={view === "attendances" ? "active" : ""}
          onClick={() => setView("attendances")}
          role="tab"
          aria-selected={view === "attendances"}
        >
          Atendimentos
        </button>
        <button
          className={view === "kanban" ? "active" : ""}
          onClick={() => setView("kanban")}
          role="tab"
          aria-selected={view === "kanban"}
        >
          Kanban
        </button>
      </div>
      {view === "attendances" ? (
        <>
          <div className="crm-toolbar">
            <label className="crm-search">
              <Search size={17} />
              <input
                value={search}
                onChange={(event) => setSearch(event.target.value)}
                placeholder="Buscar por paciente ou produto"
              />
            </label>
            <label className="crm-filter">
              <select
                value={categoryFilter}
                onChange={(event) => setCategoryFilter(event.target.value)}
              >
                <option value="">Todas</option>
                {categories.map((item) => (
                  <option value={item.value} key={item.value}>
                    {item.label}
                  </option>
                ))}
              </select>
            </label>
            <span className="crm-result-count">
              {filtered.length} atendimento(s)
            </span>
          </div>
          <div className="table-card crm-table-card">
            {loading ? (
              <div className="empty">Carregando atendimentos…</div>
            ) : filtered.length === 0 ? (
              <div className="empty">Nenhum atendimento CRM encontrado.</div>
            ) : (
              <div className="table-scroll">
                <table className="crm-table">
                  <thead>
                    <tr>
                      <th>Paciente</th>
                      <th>Produto / processo</th>
                      <th>Categoria</th>
                      <th>Doses / sessões</th>
                      <th>Datas das doses</th>
                      <th>Status</th>
                      <th>Ações</th>
                    </tr>
                  </thead>
                  <tbody>
                    {filtered.map((item) => (
                      <tr key={item.id}>
                        <td>
                          <strong>{item.patient.fullName}</strong>
                        </td>
                        <td>
                          {item.productName}
                          <small>
                            {item.productType === "INJETAVEL"
                              ? "Injetável"
                              : "Processo"}
                          </small>
                        </td>
                        <td>{categoryLabels[item.category]}</td>
                        <td>{item.doseCount}</td>
                        <td>
                          <div className="crm-date-list">
                            {item.doseDates.map((date) => (
                              <span key={date}>{dateLabel(date)}</span>
                            ))}
                          </div>
                        </td>
                        <td>
                          <span
                            className={`crm-status crm-status-${item.status.toLowerCase()}`}
                          >
                            {statusLabels[item.status]}
                          </span>
                        </td>
                        <td>
                          <div className="crm-row-actions">
                            <button
                              type="button"
                              className="icon-button"
                              title="Editar"
                              onClick={() => openEdit(item)}
                            >
                              <Pencil size={16} />
                            </button>
                            <button
                              type="button"
                              className="icon-button danger-icon"
                              title="Excluir"
                              onClick={() => void remove(item)}
                            >
                              <Trash2 size={16} />
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        </>
      ) : (
        <div className="crm-kanban">
          {statusOrder.map((status) => {
            const items = filtered.filter((item) => item.status === status);
            return (
              <section
                className="crm-kanban-column"
                key={status}
                onDragOver={(event) => event.preventDefault()}
                onDrop={() => {
                  const item = treatments.find(
                    (entry) => entry.id === draggedId,
                  );
                  if (item) void move(item, status);
                  setDraggedId(null);
                }}
              >
                <header>
                  <div>
                    <span
                      className={`crm-column-dot crm-dot-${status.toLowerCase()}`}
                    />
                    <h2>{statusLabels[status]}</h2>
                  </div>
                  <strong>{items.length}</strong>
                </header>
                <div className="crm-kanban-list">
                  {items.map((item) => (
                    <article
                      key={item.id}
                      className="crm-card"
                      draggable
                      onDragStart={() => setDraggedId(item.id)}
                      onDragEnd={() => setDraggedId(null)}
                      onClick={() => openEdit(item)}
                    >
                      <div className="crm-card-grip">
                        <GripVertical size={17} />
                        <span
                          className={`crm-status crm-status-${item.status.toLowerCase()}`}
                        >
                          {item.doseCount}{" "}
                          {item.doseCount === 1 ? "dose" : "doses"}
                        </span>
                      </div>
                      <h3>{item.patient.fullName}</h3>
                      <p>
                        {item.productName} -{" "}
                        <i className="crm-card-category">
                          {categoryLabels[item.category]}
                        </i>
                      </p>
                      <div className="crm-card-dates">
                        <CalendarDays size={14} />{" "}
                        {item.doseDates.map(dateLabel).join(" · ")}
                      </div>
                    </article>
                  ))}
                </div>
              </section>
            );
          })}
        </div>
      )}
      {modalOpen && (
        <div
          className="modal-backdrop"
          onMouseDown={(event) =>
            event.target === event.currentTarget &&
            !saving &&
            setModalOpen(false)
          }
        >
          <section
            className="modal crm-modal"
            role="dialog"
            aria-modal="true"
            aria-labelledby="crm-modal-title"
          >
            <header className="modal-header">
              <div>
                <p className="eyebrow">CRM · ATENDIMENTO</p>
                <h2 id="crm-modal-title">
                  {editing ? "Editar atendimento" : "Novo atendimento"}
                </h2>
                <span>Registre cada dose ou sessão do paciente.</span>
              </div>
              <button
                type="button"
                className="icon-button"
                onClick={() => setModalOpen(false)}
                disabled={saving}
                aria-label="Fechar"
              >
                <X size={19} />
              </button>
            </header>
            <form id="crm-treatment-form" onSubmit={save} className="crm-form">
              <div className="crm-modal-body">
              <label className="crm-field-full">
                Paciente
                <select
                  required
                  value={form.patientId}
                  onChange={(event) =>
                    updateForm("patientId", event.target.value)
                  }
                >
                  <option value="">Selecione o paciente</option>
                  {catalog.patients.map((patient) => (
                    <option value={patient.id} key={patient.id}>
                      {patient.fullName}
                    </option>
                  ))}
                </select>
              </label>
              <div className="crm-form-grid">
                <label>
                  Tipo
                  <select
                    value={form.productType}
                    onChange={(event) =>
                      changeProductType(event.target.value as ProductType)
                    }
                  >
                    <option value="INJETAVEL">Injetável</option>
                    <option value="PROCEDIMENTO">
                      Processo / procedimento
                    </option>
                  </select>
                </label>
                <label>
                  Produto / processo
                  <select
                    required
                    value={form.productId}
                    onChange={(event) =>
                      updateForm("productId", event.target.value)
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
                  Categoria
                  <select
                    value={form.category}
                    onChange={(event) =>
                      updateForm("category", event.target.value as Category)
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
                  Status
                  <select
                    value={form.status}
                    onChange={(event) =>
                      updateForm("status", event.target.value as Status)
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
              <div className="crm-dose-section">
                <div className="crm-section-heading">
                  <label>Doses / sessões</label>
                  <span>
                    {form.doseDates.filter(Boolean).length} registrada(s)
                  </span>
                </div>
                {form.doseDates.map((date, index) => (
                  <div className="crm-dose-row" key={`dose-${index}`}>
                    <CalendarDays size={18} />
                    <input
                      type="date"
                      required
                      // Converte a data para o formato YYYY-MM-DD que o input exige
                      value={
                        date ? new Date(date).toISOString().slice(0, 10) : ""
                      }
                      onChange={(event) =>
                        updateDose(index, event.target.value)
                      }
                      aria-label={`Data da dose ${index + 1}`}
                    />
                    <button
                      type="button"
                      className="icon-button"
                      onClick={() => removeDose(index)}
                      aria-label={`Remover dose ${index + 1}`}
                    >
                      <X size={17} />
                    </button>
                  </div>
                ))}
                <button
                  type="button"
                  className="secondary crm-add-dose"
                  onClick={addDose}
                >
                  <Plus size={16} /> Adicionar dose
                </button>
                <p className="crm-dose-rule">
                  <Check size={14} /> 1 dose: Iniciado · 2 doses: Em andamento ·
                  3 ou mais: Concluído
                </p>
              </div>
              <label className="crm-field-full">
                Observação
                <textarea
                  rows={4}
                  value={form.observation}
                  onChange={(event) =>
                    updateForm("observation", event.target.value)
                  }
                  placeholder="Inclua orientações ou observações do atendimento"
                />
              </label>
              {error && <div className="error">{error}</div>}
              </div>
            </form>
            <footer className="modal-footer">
              <button
                type="button"
                className="secondary"
                onClick={() => setModalOpen(false)}
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
                <Check size={16} />{" "}
                {saving ? "Salvando…" : "Salvar atendimento"}
              </button>
            </footer>
          </section>
        </div>
      )}
    </>
  );
}
