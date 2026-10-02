import React, { useEffect, useMemo, useRef, useState } from 'react';
import { CalendarDays, CheckCircle2, ClipboardCheck, Eye, Syringe, FileImage, FilePlus2, FileText, Paperclip, Pencil, Plus, Search, Trash2, Upload, UserRound, X } from 'lucide-react';
import type { Row } from '../lib/app';
import { API, request } from '../lib/app';

type MedicalRecordsPageProps = { patientId: number | null };
const today = () => { const d = new Date(); return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`; };
const emptyRecord = (patientId: number | null): Row => ({ patientId: patientId || '', recordDate: today(), title: 'Atendimento', chiefComplaint: '', medicalHistory: '', physicalExam: '', diagnosis: '', conduct: '', prescription: '' });
const sections = [
  ['chiefComplaint', 'Queixa principal'],
  ['medicalHistory', 'História da moléstia atual'],
  ['physicalExam', 'Exame físico'],
  ['diagnosis', 'Hipótese diagnóstica'],
  ['conduct', 'Condutas'],
  ['prescription', 'Prescrição']
] as const;

function dateLabel(value: string) { return new Date(`${value.slice(0, 10)}T12:00:00`).toLocaleDateString('pt-BR', { day: '2-digit', month: 'short', year: 'numeric' }).replace('.', '').toUpperCase(); }
function formatDateInput(value: string) { return value ? value.slice(0, 10) : today(); }
function ageToday(value?: string | null) { if (!value) return 'Não informado'; const birth = new Date(`${value.slice(0, 10)}T12:00:00`); const now = new Date(); let age = now.getFullYear() - birth.getFullYear(); const beforeBirthday = now.getMonth() < birth.getMonth() || (now.getMonth() === birth.getMonth() && now.getDate() < birth.getDate()); if (beforeBirthday) age -= 1; return `${age} anos`; }
function display(value: unknown) { return value === null || value === undefined || value === '' ? 'Não informado' : String(value); }
function fileSize(value: number) { if (value < 1024) return `${value} B`; if (value < 1024 * 1024) return `${Math.round(value / 1024)} KB`; return `${(value / (1024 * 1024)).toFixed(1)} MB`; }
function fileIcon(mimeType: string) { return mimeType === 'application/pdf' ? <FileText size={16}/> : <FileImage size={16}/>; }

function AttachmentsArea({ recordId, attachments = [], onChanged }: { recordId: number; attachments?: Row[]; onChanged: () => Promise<void> }) {
  const inputRef = useRef<HTMLInputElement>(null);
  const [dragging, setDragging] = useState(false);
  const [uploading, setUploading] = useState(false);
  const [message, setMessage] = useState('');
  async function upload(files: FileList | File[]) {
    const file = Array.from(files)[0];
    if (!file) return;
    if (!['application/pdf', 'image/jpeg', 'image/png'].includes(file.type)) { setMessage('Aceitos somente PDF, JPG ou PNG.'); return; }
    if (file.size > 10 * 1024 * 1024) { setMessage('O arquivo excede o limite de 10 MB.'); return; }
    setUploading(true); setMessage('');
    try {
      const data = new FormData(); data.append('file', file);
      const token = localStorage.getItem('medclinic_token');
      const response = await fetch(`${API}/medical-records/${recordId}/attachments`, { method: 'POST', headers: token ? { Authorization: `Bearer ${token}` } : {}, body: data });
      const result = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(result.message || 'Não foi possível anexar o arquivo.');
      await onChanged();
    } catch (error: any) { setMessage(error.message); } finally { setUploading(false); if (inputRef.current) inputRef.current.value = ''; }
  }
  async function view(attachment: Row) {
    try {
      const token = localStorage.getItem('medclinic_token');
      const attachmentPath = String(attachment.url || '').replace(/^\/api(?=\/)/, '');
      const response = await fetch(`${API}${attachmentPath}`, { headers: token ? { Authorization: `Bearer ${token}` } : {} });
      if (!response.ok) throw new Error('Não foi possível abrir o anexo.');
      const blobUrl = URL.createObjectURL(await response.blob()); window.open(blobUrl, '_blank', 'noopener,noreferrer');
    } catch (error: any) { setMessage(error.message); }
  }
  async function remove(attachment: Row) {
    if (!confirm(`Remover o anexo "${attachment.fileName}"?`)) return;
    try { await request(`/medical-record-attachments/${attachment.id}`, { method: 'DELETE' }); await onChanged(); } catch (error: any) { setMessage(error.message); }
  }
  return <section className="record-attachments"><div className="attachments-heading"><strong>Anexos <span>{attachments.length}</span></strong></div>{attachments.length > 0 && <div className="attachment-chips">{attachments.map(attachment => <div className="attachment-chip" key={attachment.id}><button className="attachment-main" onClick={() => view(attachment)} title="Visualizar anexo"><span className="attachment-type">{fileIcon(attachment.mimeType)}</span><span className="attachment-info"><strong>{attachment.fileName}</strong><small>{fileSize(attachment.sizeBytes)} · {attachment.uploadedBy?.fullName || 'Médico'} · {new Date(attachment.uploadedAt).toLocaleDateString('pt-BR')}</small></span><Eye size={14}/></button><button className="attachment-remove" onClick={() => remove(attachment)} title="Remover anexo"><X size={13}/></button></div>)}</div>}<div className={dragging ? 'attachment-dropzone dragging' : 'attachment-dropzone'} onDragOver={event => { event.preventDefault(); setDragging(true); }} onDragLeave={() => setDragging(false)} onDrop={event => { event.preventDefault(); setDragging(false); void upload(event.dataTransfer.files); }}><span>Arraste arquivos aqui ou</span><button className="attachment-upload-button" onClick={() => inputRef.current?.click()} disabled={uploading}><Upload size={14}/>{uploading ? 'Enviando…' : 'Anexar arquivo'}</button><input ref={inputRef} type="file" accept="application/pdf,image/jpeg,image/png" hidden onChange={event => void upload(event.target.files || [])}/></div><small className="attachment-help">PDF, JPG ou PNG, até 10 MB por arquivo. Cada anexo registra quem enviou e quando.</small>{message && <span className="attachment-error">{message}</span>}</section>;
}


function ExamRequestsArea({ recordId, requests = [], onChanged, canCompose }: { recordId: number; requests?: Row[]; onChanged: () => Promise<void>; canCompose: boolean }) {
  const [groups, setGroups] = useState<Row[]>([]);
  const [selectedIds, setSelectedIds] = useState<number[]>([]);
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState('');
  useEffect(() => { if (canCompose) request('/exam-groups').then(setGroups).catch((error: any) => setMessage(error.message)).finally(() => setLoading(false)); else setLoading(false); }, [canCompose]);
  const requestedIds = new Set(requests.map(item => Number(item.examGroupId || item.examGroup?.id)));
  const selectedGroups = selectedIds.map(id => groups.find(group => Number(group.id) === id)).filter(Boolean) as Row[];
  const suggestions = groups.filter(group => !requestedIds.has(Number(group.id)) && !selectedIds.includes(Number(group.id)) && String(group.name || '').toLocaleLowerCase().includes(search.toLocaleLowerCase())).slice(0, 8);
  function addGroup(id: number) { setSelectedIds(current => current.includes(id) ? current : [...current, id]); setSearch(''); setMessage(''); }
  function removeSelected(id: number) { setSelectedIds(current => current.filter(item => item !== id)); }
  async function generate() {
    if (selectedIds.length === 0) return;
    setSaving(true); setMessage('');
    try { await request(`/medical-records/${recordId}/exam-requests`, { method: 'POST', body: JSON.stringify({ examGroupIds: selectedIds }) }); setSelectedIds([]); setSearch(''); await onChanged(); }
    catch (error: any) { setMessage(error.message); } finally { setSaving(false); }
  }
  async function viewRequest(item: Row) {
    try { const token = localStorage.getItem('medclinic_token'); const response = await fetch(`${API}/medical-record-exam-requests/${item.id}/pdf`, { headers: token ? { Authorization: `Bearer ${token}` } : {} }); if (!response.ok) throw new Error('Não foi possível abrir o pedido de exames.'); const blobUrl = URL.createObjectURL(await response.blob()); window.open(blobUrl, '_blank', 'noopener,noreferrer'); } catch (error: any) { setMessage(error.message); }
  }
  if (!canCompose && requests.length === 0) return null;
  return <section className="exam-requests-area"><div className="exam-requests-heading"><strong>Solicitação de exames <span>{requests.length}</span></strong></div>{canCompose && <><div className="exam-request-search"><Search size={16}/><input value={search} onChange={event => setSearch(event.target.value)} placeholder="Buscar grupo de exames cadastrado..." />{search && <button type="button" title="Limpar busca" onClick={() => setSearch('')}><X size={14}/></button>}</div>{search && <div className="exam-request-suggestions">{loading ? <span>Carregando grupos…</span> : suggestions.length === 0 ? <span>Nenhum grupo disponível para adicionar.</span> : suggestions.map(group => <button type="button" key={group.id} onClick={() => addGroup(Number(group.id))}><strong>{group.name}</strong><small>{group.items?.length || 0} {(group.items?.length || 0) === 1 ? 'exame' : 'exames'}</small></button>)}</div>}{selectedGroups.length > 0 && <div className="exam-request-selection">{selectedGroups.map(group => <span className="exam-request-chip selected" key={group.id}><span>{group.name}</span><button type="button" onClick={() => removeSelected(Number(group.id))} title="Remover grupo"><X size={13}/></button></span>)}</div>}{requests.length === 0 && selectedGroups.length === 0 && <p className="exam-request-empty">Nenhum exame solicitado neste atendimento.</p>}</>}{requests.length > 0 && <div className="exam-request-generated">{requests.map(item => <div className="exam-request-chip generated" key={item.id}><CheckCircle2 size={15}/><span className="exam-request-chip-content"><strong>{item.code || `RX-${String(item.id).padStart(6, '0')}`} · {item.groupName || item.examGroup?.name}</strong><small>Por: {item.requestedBy?.fullName || 'Médico'} · {new Date(item.requestedAt).toLocaleDateString('pt-BR')}</small></span><span className="exam-request-status">Aguardando resultado</span><button type="button" className="exam-request-view" onClick={() => void viewRequest(item)} title="Visualizar pedido em PDF"><Eye size={16}/></button></div>)}</div>}{canCompose && <div className="exam-request-actions"><button type="button" className="primary exam-request-generate" disabled={selectedIds.length === 0 || saving} onClick={() => void generate()}><CheckCircle2 size={16}/>{saving ? 'Gerando…' : 'Gerar pedido'}</button>{selectedIds.length > 0 && <button type="button" className="secondary" onClick={() => setSelectedIds([])}>Limpar</button>}</div>}{message && <span className="attachment-error">{message}</span>}</section>;
}
function InjectableRequestsArea({ recordId, requests = [], onChanged, canCompose }: { recordId: number; requests?: Row[]; onChanged: () => Promise<void>; canCompose: boolean }) {
  const [catalog, setCatalog] = useState<Row[]>([]); const [selected, setSelected] = useState<Row[]>([]); const [category, setCategory] = useState('TODOS'); const [search, setSearch] = useState(''); const [saving, setSaving] = useState(false); const [message, setMessage] = useState('');
  useEffect(() => { if (canCompose) request('/injectables/catalog').then(setCatalog).catch((error: any) => setMessage(error.message)); }, [canCompose]);
  const requestedIds = new Set(requests.map(item => Number(item.injectableId || item.injectable?.id)));
  const filtered = catalog.filter(item => !requestedIds.has(Number(item.id)) && !selected.some(row => Number(row.id) === Number(item.id)) && (category === 'TODOS' || item.type === category) && String(item.name).toLocaleLowerCase().includes(search.toLocaleLowerCase())).slice(0, 8);
  const categoryLabel = (value: string) => ({ VITAMINAS: 'Vitaminas', PROTOCOLOS: 'Protocolos', IMUNIDADES: 'Imunidade' } as Record<string, string>)[value] || value;
  function add(item: Row) { setSelected(rows => [...rows, { ...item, route: 'IM', sessions: 1 }]); setSearch(''); }
  function update(id: number, key: string, value: string | number) { setSelected(rows => rows.map(row => Number(row.id) === id ? { ...row, [key]: value } : row)); }
  async function submit() { if (!selected.length) return; setSaving(true); setMessage(''); try { await request(`/medical-records/${recordId}/injectable-requests`, { method: 'POST', body: JSON.stringify({ items: selected.map(row => ({ injectableId: Number(row.id), route: row.route, sessions: Number(row.sessions) })) }) }); setSelected([]); await onChanged(); } catch (error: any) { setMessage(error.message); } finally { setSaving(false); } }
  if (!canCompose && requests.length === 0) return null;
  return <section className="injectable-requests-area"><div className="injectable-heading"><strong>Injetáveis <span>{requests.length}</span></strong></div>{canCompose && <><div className="injectable-tabs">{['TODOS', 'VITAMINAS', 'PROTOCOLOS', 'IMUNIDADES'].map(item => <button type="button" className={category === item ? 'active' : ''} key={item} onClick={() => setCategory(item)}>{item === 'TODOS' ? 'Todos' : categoryLabel(item)}</button>)}</div><div className="injectable-search"><Search size={16}/><input value={search} onChange={event => setSearch(event.target.value)} placeholder="Buscar injetável cadastrado..." />{search && <button type="button" onClick={() => setSearch('')}><X size={14}/></button>}</div>{search && <div className="injectable-suggestions">{filtered.length ? filtered.map(item => <button type="button" key={item.id} onClick={() => add(item)}><strong>{item.name}</strong><small>{categoryLabel(item.type)}</small></button>) : <span>Nenhum injetável disponível.</span>}</div>}{selected.length > 0 && <div className="injectable-selected-list">{selected.map(item => <div className="injectable-row" key={item.id}><div className="injectable-row-name"><Syringe size={17}/><div><strong>{item.name}</strong><small>{categoryLabel(item.type)} · A solicitar</small></div></div><label>Via<select value={item.route} onChange={event => update(Number(item.id), 'route', event.target.value)}><option value="IM">IM</option><option value="EV">EV</option><option value="SC">SC</option></select></label><label>Sessões<input type="number" min={1} max={99} value={item.sessions} onChange={event => update(Number(item.id), 'sessions', Math.max(1, Number(event.target.value) || 1))}/></label><button type="button" className="injectable-remove" onClick={() => setSelected(rows => rows.filter(row => Number(row.id) !== Number(item.id)))} title="Remover"><X size={16}/></button></div>)}</div>}{selected.length === 0 && <p className="exam-request-empty">Nenhum injetável selecionado neste atendimento.</p>}<div className="exam-request-actions"><button type="button" className="primary" disabled={!selected.length || saving} onClick={() => void submit()}><Syringe size={16}/>{saving ? 'Solicitando…' : 'Solicitar aplicação'}</button>{selected.length > 0 && <button type="button" className="secondary" onClick={() => setSelected([])}>Limpar</button>}</div></>}{requests.length > 0 && <div className="injectable-requested-list">{requests.map(item => <div className="injectable-row requested" key={item.id}><div className="injectable-row-name"><Syringe size={17}/><div><strong>{item.name || item.injectable?.name}</strong><small>{categoryLabel(item.category || item.injectable?.type)} · {item.route} · {item.sessions} {item.sessions === 1 ? 'sessão' : 'sessões'}</small></div></div><span className="injectable-status">Aguardando aplicação</span><small className="injectable-audit">Por: {item.requestedBy?.fullName || 'Médico'} · {new Date(item.requestedAt).toLocaleDateString('pt-BR')}</small></div>)}</div>}{message && <span className="attachment-error">{message}</span>}</section>;
}

function ProcedureRequestsArea({ recordId, requests = [], onChanged, canCompose }: { recordId: number; requests?: Row[]; onChanged: () => Promise<void>; canCompose: boolean }) {
  const [catalog, setCatalog] = useState<Row[]>([]); const [selected, setSelected] = useState<Row[]>([]); const [search, setSearch] = useState(''); const [saving, setSaving] = useState(false); const [message, setMessage] = useState('');
  useEffect(() => { if (canCompose) request('/procedures/catalog').then(setCatalog).catch((error: any) => setMessage(error.message)); }, [canCompose]);
  const requestedIds = new Set(requests.map(item => Number(item.procedureId || item.procedure?.id)));
  const filtered = catalog.filter(item => !requestedIds.has(Number(item.id)) && !selected.some(row => Number(row.id) === Number(item.id)) && String(item.name).toLocaleLowerCase().includes(search.toLocaleLowerCase())).slice(0, 8);
  function add(item: Row) { setSelected(rows => [...rows, item]); setSearch(''); setMessage(''); }
  async function submit() { if (!selected.length) return; setSaving(true); setMessage(''); try { await request(`/medical-records/${recordId}/procedure-requests`, { method: 'POST', body: JSON.stringify({ procedureIds: selected.map(row => Number(row.id)) }) }); setSelected([]); await onChanged(); } catch (error: any) { setMessage(error.message); } finally { setSaving(false); } }
  if (!canCompose && requests.length === 0) return null;
  return <section className="procedure-requests-area"><div className="procedure-heading"><strong>Procedimentos <span>{requests.length}</span></strong></div>{canCompose && <><div className="procedure-search"><Search size={16}/><input value={search} onChange={event => setSearch(event.target.value)} placeholder="Buscar procedimento cadastrado..." />{search && <button type="button" onClick={() => setSearch('')}><X size={14}/></button>}</div>{search && <div className="procedure-suggestions">{filtered.length ? filtered.map(item => <button type="button" key={item.id} onClick={() => add(item)}><strong>{item.name}</strong><small>{Number(item.value || 0).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</small></button>) : <span>Nenhum procedimento disponível.</span>}</div>}{selected.length > 0 && <div className="procedure-selected-list">{selected.map(item => <div className="procedure-row" key={item.id}><div className="procedure-row-name"><ClipboardCheck size={17}/><div><strong>{item.name}</strong><small>Procedimento selecionado</small></div></div><button type="button" className="procedure-remove" onClick={() => setSelected(rows => rows.filter(row => Number(row.id) !== Number(item.id)))} title="Remover"><X size={16}/></button></div>)}</div>}{selected.length === 0 && <p className="exam-request-empty">Nenhum procedimento selecionado neste atendimento.</p>}<div className="exam-request-actions"><button type="button" className="primary" disabled={!selected.length || saving} onClick={() => void submit()}><ClipboardCheck size={16}/>{saving ? 'Solicitando…' : 'Solicitar procedimento'}</button>{selected.length > 0 && <button type="button" className="secondary" onClick={() => setSelected([])}>Limpar</button>}</div></>}{requests.length > 0 && <div className="procedure-requested-list">{requests.map(item => <div className="procedure-row requested" key={item.id}><div className="procedure-row-name"><ClipboardCheck size={17}/><div><strong>{item.name || item.procedure?.name}</strong><small>{Number(item.value || item.procedure?.value || 0).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</small></div></div><span className="procedure-status">Aguardando agendamento</span><small className="procedure-audit">Por: {item.requestedBy?.fullName || 'Médico'} · {new Date(item.requestedAt).toLocaleDateString('pt-BR')}</small></div>)}</div>}{message && <span className="attachment-error">{message}</span>}</section>;
}

export function MedicalRecordsPage({ patientId, allowNewRecord = false, enableExamRequests = false }: MedicalRecordsPageProps & { allowNewRecord?: boolean; enableExamRequests?: boolean }) {
  const [patients, setPatients] = useState<Row[]>([]);
  const [selectedPatientId, setSelectedPatientId] = useState<number | null>(patientId);
  const [records, setRecords] = useState<Row[]>([]);
  const [editing, setEditing] = useState<Row | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => { setSelectedPatientId(patientId); }, [patientId]);
  useEffect(() => { request('/patients').then(setPatients).catch((e: any) => setError(e.message)); }, []);
  useEffect(() => {
    setLoading(true); setError('');
    request(`/medical-records${selectedPatientId ? `?patientId=${selectedPatientId}` : ''}`).then(setRecords).catch((e: any) => setError(e.message)).finally(() => setLoading(false));
  }, [selectedPatientId]);

  const selectedPatient = useMemo(() => patients.find(patient => Number(patient.id) === selectedPatientId), [patients, selectedPatientId]);
  async function save(values: Row) {
    try {
      const payload = {
        ...values,
        patientId: Number(selectedPatientId),
        appointmentId: values.appointmentId ? Number(values.appointmentId) : null,
        recordDate: formatDateInput(values.recordDate || today()),
        title: values.title || 'Atendimento'
      };
      if (!payload.patientId) throw new Error('Selecione um paciente.');
      await request(`/medical-records${editing?.id ? `/${editing.id}` : ''}`, { method: editing?.id ? 'PUT' : 'POST', body: JSON.stringify(payload) });
      setEditing(null); await reload(payload.patientId);
    } catch (e: any) { setError(e.message); }
  }
  async function reload(forPatient = selectedPatientId) { const result = await request(`/medical-records${forPatient ? `?patientId=${forPatient}` : ''}`); setRecords(result || []); }
  async function remove(id: number) { if (!confirm('Excluir este registro do prontuário?')) return; try { await request(`/medical-records/${id}`, { method: 'DELETE' }); await reload(); } catch (e: any) { setError(e.message); } }

  return <>
    <div className="page-heading medical-records-heading"><div><p className="eyebrow">ÁREA MÉDICA</p><h1>Prontuários</h1><p className="muted">Histórico clínico organizado por paciente.</p></div>{allowNewRecord && <button className="primary" disabled={!selectedPatientId} onClick={() => setEditing(emptyRecord(selectedPatientId))}><Plus size={17}/> Novo registro</button>}</div>
    {error && <div className="error page-error">{error}</div>}
    {selectedPatient && <section className="clinical-patient-card"><div className="clinical-patient-heading"><div><span>FICHA CLÍNICA</span><h2>{selectedPatient.fullName}</h2></div><UserRound size={25}/></div><div className="clinical-patient-grid"><div><span>NOME DA PACIENTE</span><strong>{selectedPatient.fullName}</strong></div><div><span>CPF</span><strong>{display(selectedPatient.cpf)}</strong></div><div><span>TELEFONE</span><strong>{display(selectedPatient.phone)}</strong></div><div><span>CONVÊNIO</span><strong>{display(selectedPatient.insuranceName)}</strong></div><div><span>DATA DE NASCIMENTO</span><strong>{selectedPatient.birthDate ? new Date(`${String(selectedPatient.birthDate).slice(0, 10)}T12:00:00`).toLocaleDateString('pt-BR') : 'Não informado'}</strong></div><div><span>IDADE HOJE</span><strong>{ageToday(selectedPatient.birthDate)}</strong></div></div></section>}
    {!selectedPatientId ? <div className="medical-record-empty"><FilePlus2 size={36}/><strong>Selecione um paciente</strong><span>Escolha um paciente para consultar ou criar registros clínicos.</span></div> : loading ? <div className="medical-record-empty">Carregando prontuário…</div> : records.length === 0 ? <div className="medical-record-empty"><FilePlus2 size={36}/><strong>Nenhum registro clínico</strong><span>Crie o primeiro registro deste paciente usando o botão acima.</span></div> : <div className="medical-timeline">{records.map(record => <article className="medical-timeline-item" key={record.id}><div className="medical-date-rail"><strong>{dateLabel(record.recordDate)}</strong><span/></div><div className="medical-record-card"><header><div><span>Por: <strong>{record.author?.fullName || 'Médico'}</strong></span><small><CalendarDays size={13}/> {record.appointment?.scheduledTime ? `${record.appointment.scheduledTime} · ` : ''}{record.title}</small></div><div className="record-actions"><button title="Editar registro" onClick={() => setEditing({ ...record, recordDate: formatDateInput(record.recordDate) })}><Pencil size={15}/></button><button title="Excluir registro" onClick={() => remove(record.id)}><Trash2 size={15}/></button></div></header><div className="medical-record-body"><h3>{record.title}</h3>{sections.map(([key, label]) => String(record[key] || '').trim() ? <div className="clinical-section" key={key}><strong>{label}:</strong><p>{record[key]}</p></div> : null)}</div><ExamRequestsArea recordId={record.id} requests={record.examRequests} canCompose={enableExamRequests} onChanged={() => reload(selectedPatientId)}/><InjectableRequestsArea recordId={record.id} requests={record.injectableRequests} canCompose={enableExamRequests} onChanged={() => reload(selectedPatientId)}/><ProcedureRequestsArea recordId={record.id} requests={record.procedureRequests} canCompose={enableExamRequests} onChanged={() => reload(selectedPatientId)}/><AttachmentsArea recordId={record.id} attachments={record.attachments} onChanged={() => reload(selectedPatientId)}/></div></article>)}</div>}
    {editing && <RecordModal value={editing} onClose={() => setEditing(null)} onSave={save}/>}
  </>;
}

function RecordModal({ value, onClose, onSave }: { value: Row; onClose: () => void; onSave: (value: Row) => void }) {
  const [form, setForm] = useState<Row>(value);
  function set(key: string, next: string) { setForm(current => ({ ...current, [key]: next })); }
  return <div className="modal-backdrop"><div className="record-modal"><div className="modal-header"><div><p className="eyebrow">PRONTUÁRIO CLÍNICO</p><h2>{value.id ? 'Editar registro' : 'Novo registro'}</h2></div><button className="icon-button" onClick={onClose}><X size={19}/></button></div><div className="record-modal-fields">{sections.map(([key, label]) => <label className="record-wide" key={key}>{label}<textarea rows={3} value={form[key] || ''} onChange={event => set(key, event.target.value)} /></label>)}</div><div className="modal-footer"><button className="secondary" onClick={onClose}>Cancelar</button><button className="primary" onClick={() => onSave(form)}>Salvar prontuário</button></div></div></div>;
}
