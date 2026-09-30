import React, { useEffect, useMemo, useState } from 'react';
import { FlaskConical, Pencil, Plus, Search, Trash2, X } from 'lucide-react';
import { request } from '../lib/app';
import type { Row } from '../lib/app';

type ExamGroup = Row & { items?: Row[] };

export function ExamGroupsPage() {
  const [groups, setGroups] = useState<ExamGroup[]>([]);
  const [exams, setExams] = useState<Row[]>([]);
  const [editing, setEditing] = useState<ExamGroup | null>(null);
  const [name, setName] = useState('');
  const [selectedIds, setSelectedIds] = useState<number[]>([]);
  const [search, setSearch] = useState('');
  const [examSearch, setExamSearch] = useState('');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');

  async function reload() { setLoading(true); try { const [groupResult, examResult] = await Promise.all([request('/exam-groups'), request('/exam-types/catalog')]); setGroups(groupResult || []); setExams(examResult || []); } catch (e: any) { setError(e.message); } finally { setLoading(false); } }
  useEffect(() => { void reload(); }, []);
  function openNew() { setEditing({}); setName(''); setSelectedIds([]); setExamSearch(''); setError(''); }
  function openEdit(group: ExamGroup) { setEditing(group); setName(group.name || ''); setSelectedIds((group.items || []).map(item => Number(item.examTypeId || item.examType?.id))); setExamSearch(''); setError(''); }
  function toggleExam(id: number) { setSelectedIds(current => current.includes(id) ? current.filter(item => item !== id) : [...current, id]); }
  async function save(event: React.FormEvent) { event.preventDefault(); if (!name.trim() || selectedIds.length === 0) { setError('Informe o nome e selecione pelo menos um exame.'); return; } setSaving(true); setError(''); try { await request(`/exam-groups${editing?.id ? `/${editing.id}` : ''}`, { method: editing?.id ? 'PUT' : 'POST', body: JSON.stringify({ name: name.trim(), examTypeIds: selectedIds }) }); setEditing(null); await reload(); } catch (e: any) { setError(e.message); } finally { setSaving(false); } }
  async function remove(group: ExamGroup) { if (!confirm(`Excluir o grupo "${group.name}"?`)) return; try { await request(`/exam-groups/${group.id}`, { method: 'DELETE' }); await reload(); } catch (e: any) { setError(e.message); } }
  const filteredGroups = useMemo(() => groups.filter(group => String(group.name || '').toLocaleLowerCase().includes(search.toLocaleLowerCase())), [groups, search]);
  const filteredExams = useMemo(() => exams.filter(exam => `${exam.code} ${exam.name}`.toLocaleLowerCase().includes(examSearch.toLocaleLowerCase())), [exams, examSearch]);

  return <>
    <div className="page-heading exam-groups-heading"><div><p className="eyebrow">ÁREA MÉDICA</p><h1>Grupos de exames</h1><p className="muted">Monte combinações personalizadas para reutilizar na elaboração de receitas.</p></div><button className="primary" onClick={openNew}><Plus size={17}/> Novo grupo</button></div>
    {error && <div className="error page-error">{error}</div>}
    <section className="exam-groups-panel"><div className="exam-groups-toolbar"><label><Search size={16}/><input value={search} onChange={event => setSearch(event.target.value)} placeholder="Pesquisar grupo..."/></label><span>{groups.length} {groups.length === 1 ? 'grupo cadastrado' : 'grupos cadastrados'}</span></div>{loading ? <div className="medical-record-empty">Carregando grupos…</div> : filteredGroups.length === 0 ? <div className="exam-groups-empty"><FlaskConical size={34}/><strong>Nenhum grupo de exames</strong><span>Crie seu primeiro grupo para agilizar a montagem de receitas.</span><button className="secondary" onClick={openNew}><Plus size={15}/> Criar grupo</button></div> : <div className="exam-group-list">{filteredGroups.map(group => <article className="exam-group-card" key={group.id}><div className="exam-group-card-head"><div className="exam-group-title"><span className="exam-group-icon"><FlaskConical size={18}/></span><div><h2>{group.name}</h2><small>{group.items?.length || 0} {(group.items?.length || 0) === 1 ? 'exame' : 'exames'}</small></div></div><div className="record-actions"><button title="Editar grupo" onClick={() => openEdit(group)}><Pencil size={15}/></button><button title="Excluir grupo" onClick={() => remove(group)}><Trash2 size={15}/></button></div></div><div className="exam-group-items">{(group.items || []).map(item => <span className="exam-tag" key={item.id}>{item.examType?.code ? `${item.examType.code} · ` : ''}{item.examType?.name || 'Exame'}</span>)}</div></article>)}</div>}</section>
    {editing && <div className="modal-backdrop"><form className="exam-group-modal" onSubmit={save}><div className="modal-header"><div><p className="eyebrow">CONFIGURAÇÃO MÉDICA</p><h2>{editing.id ? 'Editar grupo' : 'Novo grupo de exames'}</h2></div><button type="button" className="icon-button" onClick={() => setEditing(null)}><X size={19}/></button></div><div className="exam-group-form"><label>Nome do grupo<input autoFocus value={name} onChange={event => setName(event.target.value)} placeholder="Ex.: Check-up anual" /></label><div className="exam-picker-head"><div><strong>Exames do grupo</strong><small>Selecione um ou mais tipos cadastrados.</small></div><span>{selectedIds.length} selecionado(s)</span></div><label className="exam-search"><Search size={15}/><input value={examSearch} onChange={event => setExamSearch(event.target.value)} placeholder="Pesquisar exame por código ou nome..."/></label><div className="exam-picker">{filteredExams.length === 0 ? <span className="exam-picker-empty">Nenhum tipo de exame disponível.</span> : filteredExams.map(exam => <label className={selectedIds.includes(Number(exam.id)) ? 'exam-option selected' : 'exam-option'} key={exam.id}><input type="checkbox" checked={selectedIds.includes(Number(exam.id))} onChange={() => toggleExam(Number(exam.id))}/><span><strong>{exam.name}</strong><small>{exam.code} · R$ {Number(exam.value || 0).toFixed(2).replace('.', ',')}</small></span></label>)}</div></div><div className="modal-footer"><button type="button" className="secondary" onClick={() => setEditing(null)}>Cancelar</button><button type="submit" className="primary" disabled={saving}>{saving ? 'Salvando…' : 'Salvar grupo'}</button></div></form></div>}
  </>;
}
