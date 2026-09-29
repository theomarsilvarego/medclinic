import React, { useEffect, useMemo, useState } from 'react';
import { CalendarDays, FilePlus2, Pencil, Plus, Trash2, UserRound, X } from 'lucide-react';
import type { Row } from '../lib/app';
import { request } from '../lib/app';

type MedicalRecordsPageProps = { patientId: number | null };
const today = () => { const d = new Date(); return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`; };
const emptyRecord = (patientId: number | null): Row => ({ patientId: patientId || '', recordDate: today(), title: 'Atendimento', chiefComplaint: '', medicalHistory: '', physicalExam: '', diagnosis: '', conduct: '', prescription: '', notes: '' });
const sections = [
  ['chiefComplaint', 'Queixa principal'],
  ['medicalHistory', 'História da moléstia atual'],
  ['physicalExam', 'Exame físico'],
  ['diagnosis', 'Hipótese diagnóstica'],
  ['conduct', 'Condutas'],
  ['prescription', 'Prescrição'],
  ['notes', 'Observações']
] as const;

function dateLabel(value: string) { return new Date(`${value.slice(0, 10)}T12:00:00`).toLocaleDateString('pt-BR', { day: '2-digit', month: 'short', year: 'numeric' }).replace('.', '').toUpperCase(); }
function formatDateInput(value: string) { return value ? value.slice(0, 10) : today(); }

export function MedicalRecordsPage({ patientId }: MedicalRecordsPageProps) {
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
      const payload = { ...values, patientId: Number(values.patientId || selectedPatientId), appointmentId: values.appointmentId ? Number(values.appointmentId) : null, recordDate: formatDateInput(values.recordDate) };
      if (!payload.patientId) throw new Error('Selecione um paciente.');
      await request(`/medical-records${editing?.id ? `/${editing.id}` : ''}`, { method: editing?.id ? 'PUT' : 'POST', body: JSON.stringify(payload) });
      setEditing(null); setSelectedPatientId(payload.patientId); await reload(payload.patientId);
    } catch (e: any) { setError(e.message); }
  }
  async function reload(forPatient = selectedPatientId) { const result = await request(`/medical-records${forPatient ? `?patientId=${forPatient}` : ''}`); setRecords(result || []); }
  async function remove(id: number) { if (!confirm('Excluir este registro do prontuário?')) return; try { await request(`/medical-records/${id}`, { method: 'DELETE' }); await reload(); } catch (e: any) { setError(e.message); } }

  return <>
    <div className="page-heading medical-records-heading"><div><p className="eyebrow">ÁREA MÉDICA</p><h1>Prontuários</h1><p className="muted">Histórico clínico organizado por paciente.</p></div><button className="primary" disabled={!selectedPatientId} onClick={() => setEditing(emptyRecord(selectedPatientId))}><Plus size={17}/> Novo registro</button></div>
    {error && <div className="error page-error">{error}</div>}
    <div className="records-patient-bar"><UserRound size={18}/><label>Paciente<select value={selectedPatientId || ''} onChange={event => setSelectedPatientId(event.target.value ? Number(event.target.value) : null)}><option value="">Selecione um paciente</option>{patients.map(patient => <option key={patient.id} value={patient.id}>{patient.fullName}</option>)}</select></label>{selectedPatient && <span>{selectedPatient.cpf || selectedPatient.phone || 'Dados cadastrais disponíveis'}</span>}</div>
    {!selectedPatientId ? <div className="medical-record-empty"><FilePlus2 size={36}/><strong>Selecione um paciente</strong><span>Escolha um paciente para consultar ou criar registros clínicos.</span></div> : loading ? <div className="medical-record-empty">Carregando prontuário…</div> : records.length === 0 ? <div className="medical-record-empty"><FilePlus2 size={36}/><strong>Nenhum registro clínico</strong><span>Crie o primeiro registro deste paciente usando o botão acima.</span></div> : <div className="medical-timeline">{records.map(record => <article className="medical-timeline-item" key={record.id}><div className="medical-date-rail"><strong>{dateLabel(record.recordDate)}</strong><span/></div><div className="medical-record-card"><header><div><span>Por: <strong>{record.author?.fullName || 'Médico'}</strong></span><small><CalendarDays size={13}/> {record.appointment?.scheduledTime ? `${record.appointment.scheduledTime} · ` : ''}{record.title}</small></div><div className="record-actions"><button title="Editar registro" onClick={() => setEditing({ ...record, recordDate: formatDateInput(record.recordDate) })}><Pencil size={15}/></button><button title="Excluir registro" onClick={() => remove(record.id)}><Trash2 size={15}/></button></div></header><div className="medical-record-body"><h3>{record.title}</h3>{sections.map(([key, label]) => record[key] ? <div className="clinical-section" key={key}><strong>{label}:</strong><p>{record[key]}</p></div> : null)}</div></div></article>)}</div>}
    {editing && <RecordModal value={editing} patients={patients} onClose={() => setEditing(null)} onSave={save}/>} 
  </>;
}

function RecordModal({ value, patients, onClose, onSave }: { value: Row; patients: Row[]; onClose: () => void; onSave: (value: Row) => void }) {
  const [form, setForm] = useState<Row>(value);
  function set(key: string, next: string) { setForm(current => ({ ...current, [key]: next })); }
  return <div className="modal-backdrop"><div className="record-modal"><div className="modal-header"><div><p className="eyebrow">PRONTUÁRIO CLÍNICO</p><h2>{value.id ? 'Editar registro' : 'Novo registro'}</h2></div><button className="icon-button" onClick={onClose}><X size={19}/></button></div><div className="record-modal-fields"><label>Paciente<select value={form.patientId || ''} onChange={event => set('patientId', event.target.value)}><option value="">Selecione</option>{patients.map(patient => <option key={patient.id} value={patient.id}>{patient.fullName}</option>)}</select></label><label>Data do atendimento<input type="date" value={formatDateInput(form.recordDate)} onChange={event => set('recordDate', event.target.value)}/></label><label className="record-wide">Título do registro<input value={form.title || ''} onChange={event => set('title', event.target.value)} placeholder="Ex.: Atendimento"/></label>{sections.map(([key, label]) => <label className="record-wide" key={key}>{label}<textarea rows={key === 'notes' ? 2 : 3} value={form[key] || ''} onChange={event => set(key, event.target.value)} /></label>)}</div><div className="modal-footer"><button className="secondary" onClick={onClose}>Cancelar</button><button className="primary" onClick={() => onSave(form)}>Salvar prontuário</button></div></div></div>;
}
