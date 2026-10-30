import React, { useEffect, useMemo, useState } from "react";
import {
  ClipboardList,
  FlaskConical,
  Pencil,
  Plus,
  Search,
  Trash2,
} from "lucide-react";
import { money, request } from "../../lib/app";
import { ExamGroupValuesModal } from "./ExamGroupValuesModal";
import { ExamGroupFormModal } from "./ExamGroupFormModal";
import type { Row } from "../../lib/app";
import "./ExamGroupsPage.css";

type ExamGroup = Row & { items?: Row[] };

export function ExamGroupsPage() {
  const [groups, setGroups] = useState<ExamGroup[]>([]);
  const [exams, setExams] = useState<Row[]>([]);
  const [editing, setEditing] = useState<ExamGroup | null>(null);
  const [viewingGroup, setViewingGroup] = useState<ExamGroup | null>(null);
  const [name, setName] = useState("");
  const [selectedIds, setSelectedIds] = useState<number[]>([]);
  const [search, setSearch] = useState("");
  const [examSearch, setExamSearch] = useState("");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  async function reload() {
    setLoading(true);
    try {
      const [groupResult, examResult] = await Promise.all([
        request("/exam-groups"),
        request("/exam-types/catalog"),
      ]);
      setGroups(groupResult || []);
      setExams((examResult || []).filter((exam: Row) => exam.active === true));
    } catch (cause: any) {
      setError(cause.message);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    void reload();
  }, []);

  function openNew() {
    setEditing({});
    setName("");
    setSelectedIds([]);
    setExamSearch("");
    setError("");
  }

  function openEdit(group: ExamGroup) {
    setEditing(group);
    setName(group.name || "");
    setSelectedIds(
      (group.items || [])
        .map((item) => Number(item.examTypeId || item.examType?.id))
        .filter((id) => exams.some((exam) => Number(exam.id) === id)),
    );
    setExamSearch("");
    setError("");
  }

  function toggleExam(id: number) {
    setSelectedIds((current) =>
      current.includes(id)
        ? current.filter((item) => item !== id)
        : [...current, id],
    );
  }

  async function save(event: React.FormEvent) {
    event.preventDefault();
    if (!name.trim() || selectedIds.length === 0) {
      setError("Informe o nome e selecione pelo menos um exame.");
      return;
    }
    setSaving(true);
    setError("");
    try {
      await request(`/exam-groups${editing?.id ? `/${editing.id}` : ""}`, {
        method: editing?.id ? "PUT" : "POST",
        body: JSON.stringify({ name: name.trim(), examTypeIds: selectedIds }),
      });
      setEditing(null);
      await reload();
    } catch (cause: any) {
      setError(cause.message);
    } finally {
      setSaving(false);
    }
  }

  async function remove(group: ExamGroup) {
    if (!confirm(`Excluir o grupo "${group.name}"?`)) return;
    try {
      await request(`/exam-groups/${group.id}`, { method: "DELETE" });
      await reload();
    } catch (cause: any) {
      setError(cause.message);
    }
  }

  const filteredGroups = useMemo(
    () =>
      groups.filter((group) =>
        String(group.name || "")
          .toLocaleLowerCase()
          .includes(search.toLocaleLowerCase()),
      ),
    [groups, search],
  );
  const filteredExams = useMemo(
    () =>
      exams.filter((exam) =>
        `${exam.code} ${exam.name}`
          .toLocaleLowerCase()
          .includes(examSearch.toLocaleLowerCase()),
      ),
    [exams, examSearch],
  );
  const viewingItems = viewingGroup?.items || [];
  const invoiceTotal = viewingItems.reduce(
    (total, item) => total + Number(item.examType?.invoiceValue || 0),
    0,
  );
  const valueTotal = viewingItems.reduce(
    (total, item) => total + Number(item.examType?.value || 0),
    0,
  );

  return (
    <>
      <div className="page-heading exam-groups-heading">
        <div>
          <p className="eyebrow">ÁREA MÉDICA</p>
          <h1>Grupos de exames</h1>
          <p className="muted">
            Monte combinações personalizadas para reutilizar na elaboração de receitas.
          </p>
        </div>
        <button className="primary" onClick={openNew}>
          <Plus size={17} /> Novo grupo
        </button>
      </div>
      {error && <div className="error page-error">{error}</div>}
      <section className="exam-groups-panel">
        <div className="exam-groups-toolbar">
          <label>
            <Search size={16} />
            <input
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Pesquisar grupo..."
            />
          </label>
          <span>
            {groups.length} {groups.length === 1 ? "grupo cadastrado" : "grupos cadastrados"}
          </span>
        </div>
        {loading ? (
          <div className="medical-record-empty">Carregando grupos…</div>
        ) : filteredGroups.length === 0 ? (
          <div className="exam-groups-empty">
            <FlaskConical size={34} />
            <strong>Nenhum grupo de exames</strong>
            <span>Crie seu primeiro grupo para agilizar a montagem de receitas.</span>
            <button className="secondary" onClick={openNew}>
              <Plus size={15} /> Criar grupo
            </button>
          </div>
        ) : (
          <div className="exam-group-list">
            {filteredGroups.map((group) => (
              <article className="exam-group-card" key={group.id}>
                <div className="exam-group-card-head">
                  <div className="exam-group-title">
                    <span className="exam-group-icon">
                      <FlaskConical size={18} />
                    </span>
                    <div>
                      <h2>{group.name}</h2>
                      <small>
                        {group.items?.length || 0} {(group.items?.length || 0) === 1 ? "exame" : "exames"}
                      </small>
                    </div>
                  </div>
                  <div className="record-actions">
                    <button
                      title="Ver tipos e valores"
                      aria-label={`Ver tipos e valores do grupo ${group.name}`}
                      onClick={() => setViewingGroup(group)}
                    >
                      <ClipboardList size={15} />
                    </button>
                    <button title="Editar grupo" onClick={() => openEdit(group)}>
                      <Pencil size={15} />
                    </button>
                    <button title="Excluir grupo" onClick={() => remove(group)}>
                      <Trash2 size={15} />
                    </button>
                  </div>
                </div>
                <div className="exam-group-items">
                  {(group.items || []).map((item) => (
                    <span className="exam-tag" key={item.id}>
                      {item.examType?.code ? `${item.examType.code} · ` : ""}
                      {item.examType?.name || "Exame"}
                    </span>
                  ))}
                </div>
              </article>
            ))}
          </div>
        )}
      </section>

      {viewingGroup && <ExamGroupValuesModal group={viewingGroup} onClose={() => setViewingGroup(null)} />}

      {editing && <ExamGroupFormModal
        editing={editing} name={name} selectedIds={selectedIds} examSearch={examSearch}
        saving={saving} error={error} filteredExams={filteredExams}
        onClose={() => setEditing(null)} onSave={save} onNameChange={setName}
        onSearchChange={setExamSearch} onToggleExam={toggleExam}
      />}
    </>
  );
}
