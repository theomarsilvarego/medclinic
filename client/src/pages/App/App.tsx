import React, { useEffect, useState } from "react";
import {
  Activity,
  CalendarCheck,
  ClipboardPlus,
  Building2,
  ChevronRight,
  ClipboardList,
  LogOut,
  Menu,
  PanelLeftClose,
  PanelLeftOpen,
  ShieldCheck,
  Stethoscope,
  Users,
} from "lucide-react";
import type { ModuleKey } from "../../lib/app";
import { canAccessModule, menuGroups, modules } from "../../lib/modules";
import { profileLabel, request } from "../../lib/app";
import { Login } from "../Login/Login";
import { Dashboard } from "../Dashboard/Dashboard";
import { CrudPage } from "../CrudPage/CrudPage";
import { AppointmentsPage } from "../AppointmentsPage/AppointmentsPage";
import { DoctorAgendaPage } from "../DoctorAgendaPage/DoctorAgendaPage";
import { MedicalRecordsPage } from "../MedicalRecordsPage/MedicalRecordsPage";
import { ExamGroupsPage } from "../ExamGroupsPage/ExamGroupsPage";
import { CertificateSettingsPage } from "../CertificateSettingsPage/CertificateSettingsPage";
import { ReportsPage } from "../ReportsPage/ReportsPage";
import { FinancialPage } from "../FinancialPage/FinancialPage";
import { CrmPage } from "../CrmPage/CrmPage";
import "./App.css";

export function App() {
  const [user, setUser] = useState<any>(null);
  const [module, setModule] = useState<ModuleKey>("overview");
  const [mobileMenu, setMobileMenu] = useState(false);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);
  const [recordPatientId, setRecordPatientId] = useState<number | null>(null);
  const [recordAppointmentId, setRecordAppointmentId] = useState<number | null>(null);
  const [allowNewRecord, setAllowNewRecord] = useState(false);
  const dataAtual = new Date().toLocaleDateString("pt-BR", {
    day: "2-digit",
    month: "long",
    year: "numeric",
  });
  useEffect(() => {
    if (localStorage.getItem("medclinic_token"))
      request("/auth/me")
        .then(setUser)
        .catch(() => localStorage.removeItem("medclinic_token"));
  }, []);
  if (!user) return <Login onLogin={setUser} />;
  function logout() {
    localStorage.removeItem("medclinic_token");
    setUser(null);
  }
  const normalizedProfile = String(user.profile || "").toUpperCase();
  return (
    <div className={sidebarCollapsed ? "shell sidebar-collapsed" : "shell"}>
      <aside
        className={`${mobileMenu ? "sidebar open" : "sidebar"}${sidebarCollapsed ? " collapsed" : ""}`}
      >
        <div className="brand">
          <div className="brand-mark">
            <Activity size={21} />
          </div>
          <div className="brand-copy">
            <strong>MedClinic</strong>
            <span>INTIMAVIE</span>
          </div>
        </div>
        <div className="nav-group">
          <span className="nav-caption">VISÃO GERAL</span>
          <button
            className={module === "overview" ? "nav-item active" : "nav-item"}
            onClick={() => {
              setModule("overview");
              setMobileMenu(false);
            }}
          >
            <Activity size={18} /> Dashboard
          </button>
        </div>
        {menuGroups.map((group) => {
          const groupModules = group.keys
            .map((key) => modules.find((item) => item.key === key))
            .filter((item) => item && canAccessModule(user.profile, item.key));
          if (!groupModules.length) return null;
          return (
            <div className="nav-group" key={group.label}>
              <span className="nav-caption">{group.icon}{group.label}</span>
              {group.plannedItems?.map((item) => (
                <button
                  className="nav-item nav-item-disabled"
                  key={item.label}
                  type="button"
                  disabled
                  title={`${item.label}: módulo ainda não disponível`}
                >
                  {item.icon}
                  {item.label}
                </button>
              ))}
              {groupModules.map((item) => item && (
                <button
                  key={item.key}
                  className={module === item.key ? "nav-item active" : "nav-item"}
                  onClick={() => {
                    setModule(item.key);
                    if (item.key === "medical-records") {
                      setRecordPatientId(null);
                      setRecordAppointmentId(null);
                      setAllowNewRecord(false);
                    }
                    setMobileMenu(false);
                  }}
                >
                  {item.icon}
                  {item.label}
                </button>
              ))}
            </div>
          );
        })}
        <div className="sidebar-footer">
          <button
            className="collapse-button"
            onClick={() => setSidebarCollapsed(!sidebarCollapsed)}
            title={sidebarCollapsed ? "Expandir menu" : "Recolher menu"}
          >
            {sidebarCollapsed ? (
              <PanelLeftOpen size={17} />
            ) : (
              <PanelLeftClose size={17} />
            )}
            <span>{sidebarCollapsed ? "Expandir" : "Recolher menu"}</span>
          </button>
          <div className="secure">
            <ShieldCheck size={16} />
            <span>
              Ambiente protegido
              <br />
              <b>Dados criptografados</b>
            </span>
          </div>
        </div>
      </aside>
      <div className="content">
        <header className="topbar">
          <button
            className="icon-button menu"
            onClick={() => setMobileMenu(!mobileMenu)}
          >
            <Menu size={20} />
          </button>
          <div className="breadcrumb">
            Intimavie <ChevronRight size={14} />{" "}
            <strong>
              {module === "overview"
                ? "Dashboard"
                : module === "doctor-day"
                  ? "Agenda do dia"
                  : modules.find((m) => m.key === module)?.label}
            </strong>
          </div>
          <div className="top-actions">
            <span className="date">{dataAtual}</span>
            <div className="avatar">
              {user.fullName
                ?.split(" ")
                .map((x: string) => x[0])
                .slice(0, 2)
                .join("")}
            </div>
            <div className="user-name">
              <strong>{user.fullName}</strong>
              <span>{profileLabel(user.profile)}</span>
            </div>
            <button className="icon-button" onClick={logout} title="Sair">
              <LogOut size={18} />
            </button>
          </div>
        </header>
        <main className="main">
          {module === "overview" ? (
            <Dashboard setModule={setModule} user={user} />
          ) : module === "reports" ? (
            normalizedProfile === "ADMINISTRADOR" ? (
              <ReportsPage />
            ) : (
              <Dashboard setModule={setModule} user={user} />
            )
          ) : module === "certificates" ? (
            normalizedProfile === "ADMINISTRADOR" ? (
              <CertificateSettingsPage />
            ) : (
              <Dashboard setModule={setModule} user={user} />
            )
          ) : ["finance", "cash", "accounts", "sales"].includes(module) ? (
            normalizedProfile === "ADMINISTRADOR" ? (
              <FinancialPage module={module as "finance" | "cash" | "accounts" | "sales"} />
            ) : (
              <Dashboard setModule={setModule} user={user} />
            )
          ) : module === "crm" ? (
            normalizedProfile === "ADMINISTRADOR" ? <CrmPage /> : <Dashboard setModule={setModule} user={user} />
          ) : module === "doctor-day" ? (
            user.profile === "MEDICO" ? (
              <DoctorAgendaPage
                onOpenPatient={(patientId, appointmentId) => {
                  setRecordPatientId(patientId);
                  setRecordAppointmentId(appointmentId);
                  setAllowNewRecord(true);
                  setModule("medical-records");
                }}
                onViewRecord={(patientId, appointmentId) => {
                  setRecordPatientId(patientId);
                  setRecordAppointmentId(appointmentId);
                  setAllowNewRecord(false);
                  setModule("medical-records");
                }}
              />
            ) : (
              <Dashboard setModule={setModule} user={user} />
            )
          ) : module === "medical-records" ? (
            user.profile === "MEDICO" ? (
              <MedicalRecordsPage
                patientId={recordPatientId}
                appointmentId={recordAppointmentId}
                allowNewRecord={allowNewRecord}
                enableExamRequests={allowNewRecord}
                onReturnToAgenda={() => {
                  setRecordPatientId(null);
                  setRecordAppointmentId(null);
                  setAllowNewRecord(false);
                  setModule("doctor-day");
                }}
              />
            ) : (
              <Dashboard setModule={setModule} user={user} />
            )
          ) : module === "exam-groups" ? (
            user.profile === "MEDICO" ? (
              <ExamGroupsPage />
            ) : (
              <Dashboard setModule={setModule} user={user} />
            )
          ) : module === "appointments" ? (
            <AppointmentsPage user={user} />
          ) : (
            <CrudPage
              module={module}
              profile={user.profile}
              onOpenPatientRecords={(patientId) => {
                setRecordPatientId(patientId);
                setRecordAppointmentId(null);
                setAllowNewRecord(false);
                setModule("medical-records");
              }}
            />
          )}
        </main>
      </div>
    </div>
  );
}
