import React from 'react';
import { CalendarCheck, ClipboardList, ClipboardPlus, Building2, ShieldCheck, Stethoscope, Users } from 'lucide-react';
import type { ModuleKey } from './app';
export const modules: { key: ModuleKey; label: string; icon: React.ReactNode; singular: string }[] = [
  { key: 'patients', label: 'Pacientes', singular: 'paciente', icon: <ClipboardPlus size={18}/> },
  { key: 'attendances', label: 'Atendimentos', singular: 'atendimento', icon: <CalendarCheck size={18}/> },
  { key: 'appointments', label: 'Agenda', singular: 'agendamento', icon: <CalendarCheck size={18}/> },
  { key: 'users', label: 'Usuários', singular: 'usuário', icon: <Users size={18}/> },
  { key: 'clinic', label: 'Clínica', singular: 'clínica', icon: <Building2 size={18}/> },
  { key: 'doctors', label: 'Médicos', singular: 'médico', icon: <Stethoscope size={18}/> },
  { key: 'insurances', label: 'Convênios', singular: 'convênio', icon: <ShieldCheck size={18}/> },
  { key: 'procedures', label: 'Procedimentos', singular: 'procedimento', icon: <ClipboardList size={18}/> }
];

export function canAccessModule(profile: string, key: ModuleKey) { return profile === 'ADMINISTRADOR' || key === 'patients' || key === 'appointments'; }
