import React, { useEffect, useMemo, useState } from "react";
import { Check, Pencil, Pill, Plus, RotateCcw, Search, Trash2, X } from "lucide-react";
import { request } from "../../lib/app";
import "./MedicationCatalogPage.css";

type MedicationRoute = "ORAL" | "VAGINAL" | "TOPICO";
type Medication = {
  id: number;
  name: string;
  route: MedicationRoute | null;
  dose: string | null;
  posology: string | null;
  active: boolean;
  controlled: boolean;
};
type MedicationForm = {
  name: string;
  route: MedicationRoute;
  dose: string;
  posology: string;
  active: boolean;
};

const emptyForm: MedicationForm = {
  name: "",
  route: "ORAL",
  dose: "",
  posology: "",
  active: true,
};
const routeLabels: Record<MedicationRoute, string> = {
  ORAL: "Oral",
  VAGINAL: "Vaginal",
  TOPICO: "Tópico",
};

export function MedicationCatalogPage() {
  const [items, setItems] = useState<Medication[]>([]);
  const [form, setForm] = useState<MedicationForm>(emptyForm);
  const [editingId, setEditingId] = useState<number | null>(null);
  const [search, setSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");
  const [message, setMessage] = useState("");

  async function load() {
    setLoading(true);
    try {
      setItems(await request("/admin/medication-catalog"));
      setError("");
    } catch (cause: any) {
      setError(cause.message || "Não foi possível carregar o catálogo.");
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => { void load(); }, []);

  const filteredItems = useMemo(() => {
    const term = search.trim().toLocaleLowerCase("pt-BR");
    if (!term) return items;
    return items.filter((item) => [item.name, item.dose, item.posology, item.route && routeLabels[item.route]]
      .some((value) => String(value || "").toLocaleLowerCase("pt-BR").includes(term)));
  }, [items, search]);

  function startEdit(item: Medication) {
    setEditingId(item.id);
    setForm({
      name: item.name,
      route: item.route || "ORAL",
      dose: item.dose || "",
      posology: item.posology || "",
      active: item.active,
    });
    setError("");
    setMessage("");
  }

  function resetForm() {
    setEditingId(null);
    setForm(emptyForm);
  }

  async function submit(event: React.FormEvent) {
    event.preventDefault();
    setSaving(true);
    setError("");
    setMessage("");
    try {
      await request(editingId ? `/admin/medication-catalog/${editingId}` : "/admin/medication-catalog", {
        method: editingId ? "PUT" : "POST",
        body: JSON.stringify({ ...form, name: form.name.trim(), dose: form.dose.trim(), posology: form.posology.trim() }),
      });
      setMessage(editingId ? "Medicamento atualizado." : "Medicamento cadastrado no catálogo.");
      resetForm();
      await load();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível salvar o medicamento.");
    } finally {
      setSaving(false);
    }
  }

  async function toggleActive(item: Medication) {
    if (item.active) {
      if (!window.confirm(`Desativar ${item.name}? O item permanecerá no histórico das receitas emitidas.`)) return;
      try {
        await request(`/admin/medication-catalog/${item.id}`, { method: "DELETE" });
        setMessage("Medicamento desativado. As receitas emitidas permanecem inalteradas.");
        await load();
      } catch (cause: any) {
        setError(cause.message || "Não foi possível desativar o medicamento.");
      }
      return;
    }
    startEdit(item);
    setForm((current) => ({ ...current, active: true }));
  }

  return (
    <div className="medication-catalog-page">
      <header className="page-heading">
        <div>
          <p className="eyebrow">CADASTROS E CONFIGURAÇÕES</p>
          <h1>Catálogo de medicamentos</h1>
          <p className="muted">Cadastre os padrões de via, dose e posologia usados como base nas receitas. A médica pode ajustar dose e posologia em cada prescrição.</p>
        </div>
        <Pill size={30} aria-hidden="true" />
      </header>
      {error && <div className="error page-error" role="alert">{error}</div>}
      {message && <div className="success page-error" role="status">{message}</div>}

      <section className="medication-catalog-card">
        <div className="medication-catalog-card-heading">
          <div>
            <h2>{editingId ? "Editar medicamento" : "Cadastrar medicamento"}</h2>
            <p>Os campos cadastrados serão sugeridos no prontuário médico.</p>
          </div>
        </div>
        <form className="medication-catalog-form" onSubmit={submit}>
          <label>Nome do medicamento
            <input value={form.name} onChange={(event) => setForm({ ...form, name: event.target.value })} minLength={2} maxLength={180} required />
          </label>
          <label>Via
            <select value={form.route} onChange={(event) => setForm({ ...form, route: event.target.value as MedicationRoute })} required>
              <option value="ORAL">Oral</option>
              <option value="VAGINAL">Vaginal</option>
              <option value="TOPICO">Tópico</option>
            </select>
          </label>
          <label>Dose
            <input value={form.dose} onChange={(event) => setForm({ ...form, dose: event.target.value })} maxLength={100} required />
          </label>
          <label className="medication-catalog-form-wide">Posologia
            <input value={form.posology} onChange={(event) => setForm({ ...form, posology: event.target.value })} maxLength={300} required />
          </label>
          {editingId && (
            <label className="medication-catalog-active">
              <input type="checkbox" checked={form.active} onChange={(event) => setForm({ ...form, active: event.target.checked })} />
              Ativo no catálogo
            </label>
          )}
          <div className="medication-catalog-form-actions">
            {editingId && <button type="button" className="secondary" onClick={resetForm}><X size={15} /> Cancelar edição</button>}
            <button type="submit" className="primary" disabled={saving}>
              {editingId ? <Check size={16} /> : <Plus size={16} />}{saving ? "Salvando…" : editingId ? "Salvar alterações" : "Cadastrar medicamento"}
            </button>
          </div>
        </form>
      </section>

      <section className="medication-catalog-card">
        <div className="medication-catalog-list-heading">
          <div><h2>Medicamentos cadastrados</h2><p>{items.length} item(ns) no catálogo</p></div>
          <label className="medication-catalog-search"><Search size={16} /><input value={search} onChange={(event) => setSearch(event.target.value)} placeholder="Buscar medicamento…" /></label>
        </div>
        {loading ? <p className="muted">Carregando catálogo…</p> : filteredItems.length ? (
          <div className="medication-catalog-list">
            {filteredItems.map((item) => (
              <article className={`medication-catalog-row${item.active ? "" : " inactive"}`} key={item.id}>
                <div className="medication-catalog-row-main">
                  <strong>{item.name}</strong>
                  <span>{item.route ? routeLabels[item.route] : "Via pendente"} · {item.dose || "Dose pendente"}</span>
                  <small>{item.posology || "Posologia pendente"}</small>
                </div>
                <span className={`medication-catalog-status${item.active ? "" : " inactive"}`}>{item.active ? "Ativo" : "Inativo"}</span>
                <div className="medication-catalog-row-actions">
                  <button type="button" className="secondary" onClick={() => startEdit(item)} title="Editar medicamento" aria-label={`Editar ${item.name}`}><Pencil size={15} /></button>
                  <button type="button" className="secondary" onClick={() => void toggleActive(item)} title={item.active ? "Desativar medicamento" : "Reativar medicamento"} aria-label={`${item.active ? "Desativar" : "Reativar"} ${item.name}`}>
                    {item.active ? <Trash2 size={15} /> : <RotateCcw size={15} />}
                  </button>
                </div>
              </article>
            ))}
          </div>
        ) : <p className="muted">Nenhum medicamento encontrado.</p>}
      </section>
    </div>
  );
}
