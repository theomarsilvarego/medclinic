import React from 'react';
import { CalendarCheck, ChartNoAxesCombined, CircleDollarSign, ClipboardCheck, ClipboardList, ClipboardPlus, Building2, Factory, FileBarChart, FileText, FlaskConical, KeyRound, Receipt, ShieldCheck, ShoppingCart, Syringe, Stethoscope, Users, Wallet } from 'lucide-react';
import type { ModuleKey } from './app';
export const modules: { key: ModuleKey; label: string; icon: React.ReactNode; singular: string }[] = [
  { key: 'patients', label: 'Pacientes', singular: 'paciente', icon: <ClipboardPlus size={18}/> },
  { key: 'medical-records', label: 'Prontuários', singular: 'prontuário', icon: <FileText size={18}/> },
  { key: 'exam-groups', label: 'Grupos de Exames', singular: 'grupo de exames', icon: <FlaskConical size={18}/> },
  { key: 'attendances', label: 'Atendimentos', singular: 'atendimento', icon: <CalendarCheck size={18}/> },
  { key: 'appointments', label: 'Agenda', singular: 'agendamento', icon: <CalendarCheck size={18}/> },
  { key: 'doctors', label: 'Médicos', singular: 'médico', icon: <Stethoscope size={18}/> },
  { key: 'insurances', label: 'Convênios', singular: 'convênio', icon: <ShieldCheck size={18}/> },
  { key: 'clinic', label: 'Clínica', singular: 'clínica', icon: <Building2 size={18}/> },
  { key: 'users', label: 'Usuários', singular: 'usuário', icon: <Users size={18}/> },
  { key: 'procedures', label: 'Procedimentos', singular: 'procedimento', icon: <ClipboardList size={18}/> },
  { key: 'exam-types', label: 'Tipos de Exames', singular: 'tipo de exame', icon: <FlaskConical size={18}/> },
  { key: 'certificates', label: 'Certificados Digitais', singular: 'certificado digital', icon: <KeyRound size={18}/> },
  { key: 'injectables', label: 'Injetáveis', singular: 'injetável', icon: <Syringe size={18}/> },
  { key: 'suppliers', label: 'Fornecedores', singular: 'fornecedor', icon: <Factory size={18}/> },
  { key: 'reports', label: 'Relatórios', singular: 'relatório', icon: <FileBarChart size={18}/> },
  { key: 'finance', label: 'Financeiro', singular: 'lançamento financeiro', icon: <CircleDollarSign size={18}/> },
  { key: 'cash', label: 'Caixa', singular: 'movimentação de caixa', icon: <Wallet size={18}/> },
  { key: 'accounts', label: 'Contas a pagar e receber', singular: 'conta', icon: <Receipt size={18}/> },
  { key: 'sales', label: 'Vendas', singular: 'venda', icon: <ShoppingCart size={18}/> },
  { key: 'crm', label: 'CRM', singular: 'atendimento CRM', icon: <ClipboardCheck size={18}/> },
];

export const menuGroups: { label: string; icon: React.ReactNode; keys: ModuleKey[]; plannedItems?: { label: string; icon: React.ReactNode }[] }[] = [
  { label: 'GESTÃO CLÍNICA', icon: <Building2 size={16}/>, keys: ['patients', 'medical-records', 'exam-groups', 'attendances', 'appointments', 'crm', 'doctors', 'insurances', 'clinic'] },
  { label: 'CADASTROS E CONFIGURAÇÕES', icon: <ClipboardList size={16}/>, keys: ['users', 'procedures', 'exam-types', 'certificates'] },
  { label: 'PROCEDIMENTOS E INSUMOS', icon: <Syringe size={16}/>, keys: ['injectables', 'suppliers'] },
  { label: 'GESTÃO ADMINISTRATIVA E FINANCEIRA', icon: <ChartNoAxesCombined size={16}/>, keys: ['reports', 'finance', 'cash', 'accounts', 'sales'] },
];

export function canAccessModule(profile: string, key: ModuleKey) { const normalizedProfile = String(profile || '').toUpperCase(); if (key === 'patients') return ['ADMINISTRADOR', 'MEDICO', 'SECRETARIA'].includes(normalizedProfile); if (key === 'medical-records' || key === 'exam-groups') return normalizedProfile === 'MEDICO'; if (key === 'certificates' || key === 'reports' || key === 'finance' || key === 'cash' || key === 'accounts' || key === 'sales' || key === 'crm') return normalizedProfile === 'ADMINISTRADOR'; return normalizedProfile === 'ADMINISTRADOR' || (key === 'appointments' && normalizedProfile === 'SECRETARIA'); }
