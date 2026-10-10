import React, { useEffect, useMemo, useState } from 'react';
import { ClipboardList, FileText, Pencil, Plus, Search, Trash2 } from 'lucide-react';
import type { ModuleKey, Profile, Row } from '../lib/app';
import { getRowId, request } from '../lib/app';
import { configs } from '../lib/configs';
import { Modal } from './Modal';

type CrudPageProps = { module: ModuleKey; profile?: Profile; onOpenPatientRecords?: (patientId: number) => void };
const pageSizes = [25, 50, 75, 100];

export function CrudPage({ module, profile, onOpenPatientRecords }: CrudPageProps) {
  const config = configs[module as keyof typeof configs];
  const isPatients = module === 'patients';
  const [rows, setRows] = useState<Row[]>([]);
  const [editing, setEditing] = useState<Row | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [insuranceOptions, setInsuranceOptions] = useState<any[]>([]);
  const [supplierOptions, setSupplierOptions] = useState<any[]>([]);
  const [search, setSearch] = useState('');
  const [pageSize, setPageSize] = useState(25);
  const [page, setPage] = useState(1);
  const fields = module === 'attendances' ? config.fields.map(f => f.key === 'insuranceId' ? { ...f, options: insuranceOptions } : f) : module === 'patients' ? config.fields.map(f => f.key === 'insuranceCode' ? { ...f, options: insuranceOptions } : f) : module === 'injectables' ? config.fields.map(f => f.key === 'supplier' ? { ...f, options: supplierOptions } : f) : config.fields;

  async function load() {
    setLoading(true);
    try {
      const result = await Promise.all([request(`${config.basePath === '' ? '' : '/admin'}/${config.path}`), module === 'attendances' || module === 'patients' ? request('/admin/insurances') : module === 'injectables' ? request('/admin/suppliers') : Promise.resolve([])]);
      setRows(result[0] || []);
      if (module === 'attendances') setInsuranceOptions((result[1] || []).filter((x: Row) => x.active).map((x: Row) => ({ value: x.id, label: x.name })));
      if (module === 'patients') setInsuranceOptions((result[1] || []).filter((x: Row) => x.active).map((x: Row) => ({ value: x.id, label: `${x.id} - ${x.name}` })));
      if (module === 'injectables') setSupplierOptions((result[1] || []).map((x: Row) => ({ value: x.name, label: x.name })));
    } catch (e: any) { setError(e.message); } finally { setLoading(false); }
  }
  useEffect(() => { load(); }, [module]);
  useEffect(() => { setPage(1); }, [search, pageSize]);

  const filteredRows = useMemo(() => {
    if (!isPatients || !search.trim()) return rows;
    const term = search.trim().toLocaleLowerCase('pt-BR');
    return rows.filter(row => String(row.fullName || '').toLocaleLowerCase('pt-BR').includes(term) || String(row.cpf || '').toLocaleLowerCase('pt-BR').includes(term));
  }, [isPatients, rows, search]);
  const totalPages = Math.max(1, Math.ceil(filteredRows.length / pageSize));
  const visibleRows = isPatients ? filteredRows.slice((page - 1) * pageSize, page * pageSize) : rows;
  const doctorCanOpenRecords = isPatients && profile === 'MEDICO' && onOpenPatientRecords;

  async function save(data: Row) {
    try {
      const editingId = getRowId(editing);
      if (editing && !editingId) { setError('O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.'); return; }
      const payload = editingId ? { ...data, id: editingId } : data;
      await request(`${config.basePath === '' ? '' : '/admin'}/${config.path}${editingId ? `/${editingId}` : ''}`, { method: editingId ? 'PUT' : 'POST', body: JSON.stringify(payload) });
      setEditing(null); setModalOpen(false); load();
    } catch (e: any) { setError(e.message); }
  }
  async function remove(id: number) {
    const normalizedId = getRowId({ id });
    if (!normalizedId) { setError('O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.'); return; }
    if (!confirm('Excluir este cadastro?')) return;
    try { await request(`${config.basePath === '' ? '' : '/admin'}/${config.path}/${normalizedId}`, { method: 'DELETE' }); load(); } catch (e: any) { setError(e.message); }
  }

  return <>
    <div className="page-heading"><div><p className="eyebrow">ADMINISTRAÇÃO</p><h1>{config.title}</h1><p className="muted">Cadastre e mantenha os dados atualizados.</p></div><button className="primary" onClick={() => { setEditing(null); setModalOpen(true); }}><Plus size={17}/> Novo {config.title === 'Clínica' ? 'cadastro' : config.title.slice(0, -1)}</button></div>
    {error && <div className="error page-error">{error}</div>}
    <div className="table-card">
      {isPatients && <div className="patient-list-toolbar"><label><Search size={16}/><input value={search} onChange={event => setSearch(event.target.value)} placeholder="Pesquisar por nome ou CPF…"/></label><span>{filteredRows.length} paciente{filteredRows.length === 1 ? '' : 's'}</span></div>}
      <div className="table-head"><strong>{isPatients ? `${visibleRows.length} de ${filteredRows.length} paciente${filteredRows.length === 1 ? '' : 's'}` : `${rows.length} cadastro${rows.length === 1 ? '' : 's'}`}</strong><span className="muted">Última atualização agora</span></div>
      {loading ? <div className="empty">Carregando…</div> : visibleRows.length === 0 ? <div className="empty"><ClipboardList size={28}/><strong>{search ? 'Nenhum paciente encontrado' : 'Nenhum cadastro ainda'}</strong><span>{search ? 'Tente pesquisar por outro nome ou CPF.' : 'Adicione o primeiro registro usando o botão acima.'}</span></div> : <div className="table-scroll"><table><thead><tr>{config.columns.map(c => <th key={c.key}>{c.key === 'fullName' && doctorCanOpenRecords ? 'Nome / prontuário' : c.label}</th>)}<th>Ações</th></tr></thead><tbody>{visibleRows.map(row => <tr key={row.id}>{config.columns.map(c => <td key={c.key}>{c.key === 'fullName' && doctorCanOpenRecords ? <button className="patient-name-link" onClick={() => onOpenPatientRecords?.(Number(row.id))}>{row.fullName}</button> : c.key === 'active' ? <span className={row[c.key] ? 'status active' : 'status'}>{c.format?.(row[c.key])}</span> : c.format ? c.format(row[c.key]) : row[c.key]}</td>)}<td className="row-actions">{doctorCanOpenRecords && <button className="record-link-button" onClick={() => onOpenPatientRecords?.(Number(row.id))} title="Abrir prontuário"><FileText size={16}/></button>}<button onClick={() => { setEditing(row); setModalOpen(true); }} title="Editar"><Pencil size={16}/></button><button onClick={() => remove(row.id)} title="Excluir"><Trash2 size={16}/></button></td></tr>)}</tbody></table></div>}
      {isPatients && !loading && filteredRows.length > 0 && <div className="pagination-bar"><span>Linhas por página</span><select value={pageSize} onChange={event => setPageSize(Number(event.target.value))}>{pageSizes.map(size => <option value={size} key={size}>{size}</option>)}</select><span>{(page - 1) * pageSize + 1}–{Math.min(page * pageSize, filteredRows.length)} de {filteredRows.length}</span><button disabled={page <= 1} onClick={() => setPage(current => current - 1)}>Anterior</button><button disabled={page >= totalPages} onClick={() => setPage(current => current + 1)}>Próxima</button></div>}
    </div>
    {modalOpen && <Modal title={`${editing?.id ? 'Editar' : 'Novo'} ${config.title === 'Clínica' ? 'cadastro' : config.title.slice(0, -1)}`} fields={fields} initial={editing || { active: true }} onClose={() => { setModalOpen(false); setEditing(null); }} onSave={save}/>}
  </>;
}
