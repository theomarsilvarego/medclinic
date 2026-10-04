import React, { useEffect, useState } from 'react';
import { Activity, CalendarCheck, ClipboardPlus, Building2, ChevronRight, ClipboardList, LogOut, Menu, PanelLeftClose, PanelLeftOpen, ShieldCheck, Stethoscope, Users } from 'lucide-react';
import type { ModuleKey } from '../lib/app';
import { canAccessModule, modules } from '../lib/modules';
import { profileLabel, request } from '../lib/app';
import { Login } from './Login';
import { Dashboard } from './Dashboard';
import { CrudPage } from './CrudPage';
import { AppointmentsPage } from './AppointmentsPage';
import { DoctorAgendaPage } from './DoctorAgendaPage';
import { MedicalRecordsPage } from './MedicalRecordsPage';
import { ExamGroupsPage } from './ExamGroupsPage';
import { CertificateSettingsPage } from './CertificateSettingsPage';

export function App() {
  const [user, setUser] = useState<any>(null);
  const [module, setModule] = useState<ModuleKey>('overview');
  const [mobileMenu, setMobileMenu] = useState(false);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);
  const [recordPatientId, setRecordPatientId] = useState<number | null>(null);
  const [allowNewRecord, setAllowNewRecord] = useState(false);
  useEffect(() => { if (localStorage.getItem('medclinic_token')) request('/auth/me').then(setUser).catch(() => localStorage.removeItem('medclinic_token')); }, []);
  if (!user) return <Login onLogin={setUser}/>;
  function logout() { localStorage.removeItem('medclinic_token'); setUser(null); }
  return <div className={sidebarCollapsed ? 'shell sidebar-collapsed' : 'shell'}><aside className={`${mobileMenu ? 'sidebar open' : 'sidebar'}${sidebarCollapsed ? ' collapsed' : ''}`}><div className="brand"><div className="brand-mark"><Activity size={21}/></div><div className="brand-copy"><strong>MedClinic</strong><span>INTIMAVIE</span></div></div><div className="nav-group"><span className="nav-caption">VISÃO GERAL</span><button className={module === 'overview' ? 'nav-item active' : 'nav-item'} onClick={()=>{setModule('overview');setMobileMenu(false)}}><Activity size={18}/> Dashboard</button></div><div className="nav-group"><span className="nav-caption">{user.profile === 'ADMINISTRADOR' ? 'GESTÃO CLÍNICA' : user.profile === 'MEDICO' ? 'ÁREA MÉDICA' : 'ATENDIMENTO'}</span>{modules.filter(item=>canAccessModule(user.profile, item.key)).map(item=><button key={item.key} className={module === item.key ? 'nav-item active' : 'nav-item'} onClick={()=>{setModule(item.key);if(item.key==='medical-records'){setRecordPatientId(null);setAllowNewRecord(false)}setMobileMenu(false)}}>{item.icon}{item.label}</button>)}</div><div className="sidebar-footer"><button className="collapse-button" onClick={()=>setSidebarCollapsed(!sidebarCollapsed)} title={sidebarCollapsed?'Expandir menu':'Recolher menu'}>{sidebarCollapsed?<PanelLeftOpen size={17}/>:<PanelLeftClose size={17}/>}<span>{sidebarCollapsed?'Expandir':'Recolher menu'}</span></button><div className="secure"><ShieldCheck size={16}/><span>Ambiente protegido<br/><b>Dados criptografados</b></span></div></div></aside><div className="content"><header className="topbar"><button className="icon-button menu" onClick={()=>setMobileMenu(!mobileMenu)}><Menu size={20}/></button><div className="breadcrumb">Intimavie <ChevronRight size={14}/> <strong>{module === 'overview' ? 'Dashboard' : module === 'doctor-day' ? 'Agenda do dia' : modules.find(m=>m.key===module)?.label}</strong></div><div className="top-actions"><span className="date">28 de setembro de 2026</span><div className="avatar">{user.fullName?.split(' ').map((x:string)=>x[0]).slice(0,2).join('')}</div><div className="user-name"><strong>{user.fullName}</strong><span>{profileLabel(user.profile)}</span></div><button className="icon-button" onClick={logout} title="Sair"><LogOut size={18}/></button></div></header><main className="main">{module === 'overview' ? <Dashboard setModule={setModule} user={user}/> : module === 'certificates' ? (user.profile === 'ADMINISTRADOR' ? <CertificateSettingsPage/> : <Dashboard setModule={setModule} user={user}/>) : module === 'doctor-day' ? (user.profile === 'MEDICO' ? <DoctorAgendaPage onOpenPatient={(patientId)=>{setRecordPatientId(patientId);setAllowNewRecord(true);setModule('medical-records')}}/> : <Dashboard setModule={setModule} user={user}/>) : module === 'medical-records' ? (user.profile === 'MEDICO' ? <MedicalRecordsPage patientId={recordPatientId} allowNewRecord={allowNewRecord} enableExamRequests={allowNewRecord}/> : <Dashboard setModule={setModule} user={user}/>) : module === 'exam-groups' ? (user.profile === 'MEDICO' ? <ExamGroupsPage/> : <Dashboard setModule={setModule} user={user}/>) : module === 'appointments' ? <AppointmentsPage user={user}/> : <CrudPage module={module} profile={user.profile} onOpenPatientRecords={(patientId)=>{setRecordPatientId(patientId);setAllowNewRecord(false);setModule('medical-records')}}/>}</main></div></div>;
}
