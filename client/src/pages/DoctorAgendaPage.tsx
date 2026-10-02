import React, { useEffect, useMemo, useState } from 'react';
import { CalendarDays, ClipboardList, Play, X } from 'lucide-react';
import type { Row } from '../lib/app';
import { request } from '../lib/app';

const localDate = (date: Date) => `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`;
const statusLabel: Record<string, string> = { AGENDADO: 'Agendado', CONFIRMADO: 'Confirmado', EM_ATENDIMENTO: 'Em Atendimento', ATENDIDO: 'Atendido', FALTOU: 'Faltou' };

export function DoctorAgendaPage({ onOpenPatient }: { onOpenPatient: (patientId: number) => void }) {
  const date = localDate(new Date());
  const [rows, setRows] = useState<Row[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [selected, setSelected] = useState<Row | null>(null);
  const [startingId, setStartingId] = useState<number | null>(null);
  const weekday = useMemo(() => {
    const text = new Date(`${date}T12:00:00`).toLocaleDateString('pt-BR', { weekday: 'long', day: '2-digit', month: 'long', year: 'numeric' });
    return text.charAt(0).toUpperCase() + text.slice(1);
  }, [date]);

  useEffect(() => {
    request(`/appointments?date=${date}`).then(result => setRows(result || [])).catch((e: any) => setError(e.message)).finally(() => setLoading(false));
  }, [date]);

  const startAppointment = async (row: Row) => {
    setStartingId(Number(row.id)); setError('');
    try { await request(`/appointments/${row.id}/start`, { method: 'PATCH' }); onOpenPatient(Number(row.patient?.id)); }
    catch (e: any) { setError(e.message); }
    finally { setStartingId(null); }
  };

  const confirmed = rows.filter(row => row.status === 'CONFIRMADO').length;
  const attended = rows.filter(row => row.status === 'ATENDIDO').length;

  return <>
    <div className="doctor-page-heading">
      <p className="eyebrow">ÁREA MÉDICA</p>
      <h1>Agenda do dia</h1>
      <p className="doctor-date">{weekday}</p>
    </div>
    {error && <div className="error page-error">{error}</div>}
    <div className="doctor-stat-grid">
      <div className="doctor-stat-card"><span>Pacientes agendados</span><strong className="patients">{loading ? '—' : rows.length}</strong></div>
      <div className="doctor-stat-card"><span>Confirmados</span><strong className="confirmed">{loading ? '—' : confirmed}</strong></div>
      <div className="doctor-stat-card"><span>Atendidos</span><strong className="attended">{loading ? '—' : attended}</strong></div>
    </div>
    <section className="doctor-agenda-card">
      <div className="doctor-agenda-header"><div><h2>Pacientes de hoje</h2><p>Acesse os dados clínicos sem alterar o agendamento.</p></div><CalendarDays size={22}/></div>
      {loading ? <div className="doctor-empty">Carregando agenda…</div> : rows.length === 0 ? <div className="doctor-empty"><ClipboardList size={30}/><strong>Nenhum paciente agendado para hoje</strong><span>A agenda do dia está livre.</span></div> : <div className="doctor-patient-list">{rows.map(row => <div className="doctor-patient-row" key={row.id}>
        <div className="doctor-time">{row.scheduledTime}</div>
        <div className="doctor-patient-info"><div className="doctor-patient-name"><strong>{row.patient?.fullName || 'Paciente não informado'}</strong><span className={`doctor-status ${String(row.status || '').toLowerCase()}`}>{statusLabel[row.status] || row.status}</span></div><p>{row.itemType === 'PROCEDIMENTO' ? row.procedure?.name : row.attendance?.name || 'Atendimento'}{row.insurance?.name ? ` · ${row.insurance.name}` : ''}</p></div>
        <button className="doctor-record-icon" title="Iniciar" aria-label="Iniciar" disabled={startingId === Number(row.id)} onClick={() => startAppointment(row)}><Play size={18}/></button>
      </div>)}</div>}
    </section>
    {selected && <div className="modal-backdrop"><div className="doctor-detail-modal"><div className="modal-header"><div><p className="eyebrow">DADOS DO PACIENTE</p><h2>{selected.patient?.fullName || 'Paciente'}</h2></div><button className="icon-button" onClick={() => setSelected(null)}><X size={19}/></button></div><div className="doctor-detail-grid"><div><span>Horário</span><strong>{selected.scheduledTime}</strong></div><div><span>Status</span><strong>{statusLabel[selected.status] || selected.status}</strong></div><div><span>Telefone</span><strong>{selected.patient?.phone || 'Não informado'}</strong></div><div><span>Médico</span><strong>{selected.doctor?.fullName || 'Não informado'}</strong></div><div><span>Convênio</span><strong>{selected.insurance?.name || 'Não informado'}</strong></div><div><span>Atendimento</span><strong>{selected.itemType === 'PROCEDIMENTO' ? selected.procedure?.name : selected.attendance?.name || 'Não informado'}</strong></div><div className="doctor-detail-wide"><span>Observação</span><strong>{selected.notes || 'Nenhuma observação registrada.'}</strong></div></div><div className="modal-footer"><button className="secondary" onClick={() => setSelected(null)}>Fechar</button></div></div></div>}
  </>;
}
