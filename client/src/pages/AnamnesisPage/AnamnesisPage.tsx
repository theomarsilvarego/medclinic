import React, { useEffect, useMemo, useState } from "react";
import { AlertCircle, CheckCircle2, HeartPulse, LoaderCircle, ShieldCheck } from "lucide-react";
import { API } from "../../lib/app";
import "./anamnesis.css";
import "./AnamnesisPage.css";

type Answers = {
  orderNumber: string;
  appointmentDate: string;
  cpf: string;
  fullName: string;
  titularNumber: string;
  maritalStatus: string;
  phone: string;
  birthDate: string;
  age: string;
  lastMenstruationDate: string;
  weightKg: string;
  bloodPressureSystolic: string;
  bloodPressureDiastolic: string;
  menarcheAge: string;
  contraceptiveUse: "SIM" | "NAO" | "";
  contraceptiveMethod: string;
  pregnancies: string;
  normalBirths: string;
  cesareanBirths: string;
  abortions: string;
  lastPreventiveExam: string;
  umg: string;
  hasChronicHypertension: boolean;
  hasOtherComorbidities: boolean;
  comorbidityDetails: string;
  hasAllergy: "SIM" | "NAO" | "";
  allergyDetails: string;
  previousSurgeries: string;
  physicalActivity: string;
  chiefComplaint: string;
  routineEvaluation: boolean;
  otherReason: string;
};

type Prefill = {
  orderNumber: string;
  appointmentDate: string;
  patient: { fullName: string; cpf: string | null; phone: string | null; birthDate: string };
};

const emptyAnswers: Answers = {
  orderNumber: "",
  appointmentDate: "",
  cpf: "",
  fullName: "",
  titularNumber: "",
  maritalStatus: "",
  phone: "",
  birthDate: "",
  age: "",
  lastMenstruationDate: "",
  weightKg: "",
  bloodPressureSystolic: "",
  bloodPressureDiastolic: "",
  menarcheAge: "",
  contraceptiveUse: "",
  contraceptiveMethod: "",
  pregnancies: "",
  normalBirths: "",
  cesareanBirths: "",
  abortions: "",
  lastPreventiveExam: "",
  umg: "",
  hasChronicHypertension: false,
  hasOtherComorbidities: false,
  comorbidityDetails: "",
  hasAllergy: "",
  allergyDetails: "",
  previousSurgeries: "",
  physicalActivity: "",
  chiefComplaint: "",
  routineEvaluation: false,
  otherReason: "",
};

function localDateValue(date = new Date()) {
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
}

function ageFromDate(value: string) {
  if (!value) return "";
  const [year, month, day] = value.split("-").map(Number);
  if (!year || !month || !day) return "";
  const now = new Date();
  let age = now.getFullYear() - year;
  if (now.getMonth() + 1 < month || (now.getMonth() + 1 === month && now.getDate() < day)) age -= 1;
  return age >= 0 && age < 130 ? String(age) : "";
}

function Field({ id, label, className = "", children }: { id: string; label: string; className?: string; children: React.ReactNode }) {
  return <div className={`anamnesis-field ${className}`}><label htmlFor={id}>{label}</label>{children}</div>;
}

function RadioChoice({ label, value, selected, onChange, name }: { label: string; value: "SIM" | "NAO"; selected: "SIM" | "NAO" | ""; onChange: (value: "SIM" | "NAO") => void; name: string }) {
  return <label className="anamnesis-choice"><input type="radio" name={name} value={value} checked={selected === value} onChange={() => onChange(value)} /><span>{label}</span></label>;
}

export function AnamnesisPage({ token }: { token: string }) {
  const [answers, setAnswers] = useState<Answers>(emptyAnswers);
  const [loading, setLoading] = useState(true);
  const [loadError, setLoadError] = useState("");
  const [submitError, setSubmitError] = useState("");
  const [consentAccepted, setConsentAccepted] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);
  const [retryCount, setRetryCount] = useState(0);
  const today = useMemo(() => localDateValue(), []);
  const currentMonth = today.slice(0, 7);

  useEffect(() => {
    const previousTitle = document.title;
    const themeMeta = document.querySelector<HTMLMetaElement>('meta[name="theme-color"]');
    const previousTheme = themeMeta?.content;
    document.title = "Ficha de anamnese · Intimavie";
    if (themeMeta) themeMeta.content = "#075f57";
    return () => {
      document.title = previousTitle;
      if (themeMeta && previousTheme) themeMeta.content = previousTheme;
    };
  }, []);

  useEffect(() => {
    let active = true;
    setLoading(true);
    setLoadError("");
    fetch(`${API}/public/anamnesis/${encodeURIComponent(token)}`, { headers: { Accept: "application/json" } })
      .then(async response => {
        const payload = await response.json().catch(() => ({}));
        if (!response.ok) throw new Error(payload.message || "Não foi possível abrir a ficha.");
        if (!active) return;
        const data = payload as Prefill;
        setAnswers(current => ({
          ...current,
          orderNumber: data.orderNumber,
          appointmentDate: data.appointmentDate,
          fullName: data.patient.fullName || "",
          cpf: data.patient.cpf || "",
          phone: data.patient.phone || "",
          birthDate: data.patient.birthDate || "",
        }));
      })
      .catch(error => { if (active) setLoadError(error instanceof Error ? error.message : "Não foi possível abrir a ficha."); })
      .finally(() => { if (active) setLoading(false); });
    return () => { active = false; };
  }, [token, retryCount]);

  function update<K extends keyof Answers>(key: K, value: Answers[K]) {
    setAnswers(current => ({ ...current, [key]: value }));
  }

  async function submit(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setSubmitError("");
    if (!consentAccepted) {
      setSubmitError("Para enviar a ficha, confirme o aceite de uso dos dados conforme a LGPD.");
      return;
    }
    setSubmitting(true);
    try {
      const response = await fetch(`${API}/public/anamnesis/${encodeURIComponent(token)}`, {
        method: "POST",
        headers: { "Content-Type": "application/json", Accept: "application/json" },
        body: JSON.stringify({ answers: { ...answers, age: ageFromDate(answers.birthDate) }, consentAccepted }),
      });
      const payload = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(payload.message || "Não foi possível enviar a ficha.");
      setSubmitted(true);
    } catch (error) {
      setSubmitError(error instanceof Error ? error.message : "Não foi possível enviar a ficha. Tente novamente.");
    } finally {
      setSubmitting(false);
    }
  }

  return <div className="anamnesis-page">
    <header className="anamnesis-hero">
      <div className="anamnesis-hero-inner">
        <p className="anamnesis-kicker">SINDICATO DOS VIGILANTES DE RONDÔNIA · SINTESV-RO</p>
        <div className="anamnesis-title-row"><div className="anamnesis-title-icon"><HeartPulse size={22} /></div><h1>Ficha de anamnese</h1></div>
        <p className="anamnesis-subtitle">Clínica Intimavie · preencha antes da consulta</p>
      </div>
    </header>

    <main className="anamnesis-main">
      {loading ? <div className="anamnesis-state-card" role="status"><LoaderCircle className="anamnesis-spinner" size={24} />Validando seu link seguro…</div> : null}
      {!loading && loadError ? <div className="anamnesis-state-card anamnesis-error-state" role="alert"><AlertCircle size={23} /><div><strong>Não foi possível abrir a ficha</strong><p>{loadError}</p><button className="anamnesis-button" type="button" onClick={() => setRetryCount(value => value + 1)}>Tentar novamente</button></div></div> : null}
      {!loading && !loadError && submitted ? <div className="anamnesis-success-card" role="status"><div className="anamnesis-success-icon"><CheckCircle2 size={30} /></div><p className="anamnesis-kicker">FICHA RECEBIDA</p><h2>Obrigado por preencher</h2><p>Sua ficha de anamnese foi enviada com segurança para a equipe da Clínica Intimavie.</p><p className="anamnesis-success-note">Se precisar corrigir alguma informação, entre em contato com a clínica.</p></div> : null}
      {!loading && !loadError && !submitted ? <form className="anamnesis-form" onSubmit={event => void submit(event)}>
        <section className="anamnesis-section" aria-labelledby="anamnesis-identification-title">
          <h2 id="anamnesis-identification-title"><span>1</span>Identificação</h2>
          <div className="anamnesis-grid two">
            <Field id="orderNumber" label="Ordem Nº"><input id="orderNumber" value={answers.orderNumber} readOnly /></Field>
            <Field id="appointmentDate" label="Data"><input id="appointmentDate" type="date" value={answers.appointmentDate} readOnly /></Field>
            <Field id="cpf" label="CPF" className="wide"><input id="cpf" inputMode="numeric" autoComplete="off" placeholder="000.000.000-00" value={answers.cpf} onChange={event => update("cpf", event.target.value)} maxLength={14} /></Field>
            <Field id="fullName" label="Nome completo" className="wide"><input id="fullName" autoComplete="name" placeholder="Preenchido pelo agendamento" value={answers.fullName} onChange={event => update("fullName", event.target.value)} maxLength={180} required /></Field>
            <Field id="titularNumber" label="Nº titular"><input id="titularNumber" value={answers.titularNumber} onChange={event => update("titularNumber", event.target.value)} maxLength={40} /></Field>
            <Field id="maritalStatus" label="Estado civil"><select id="maritalStatus" value={answers.maritalStatus} onChange={event => update("maritalStatus", event.target.value)}><option value="">Selecione</option><option>Solteira</option><option>Casada</option><option>União estável</option><option>Divorciada</option><option>Viúva</option><option>Outro</option></select></Field>
            <Field id="phone" label="Contato (DDD + telefone)" className="wide"><input id="phone" type="tel" inputMode="tel" autoComplete="tel" placeholder="(69) 90000-0000" value={answers.phone} onChange={event => update("phone", event.target.value)} maxLength={40} /></Field>
            <Field id="birthDate" label="Data de nascimento"><input id="birthDate" type="date" max={today} autoComplete="bday" value={answers.birthDate} onChange={event => update("birthDate", event.target.value)} /></Field>
            <Field id="age" label="Idade"><input id="age" value={ageFromDate(answers.birthDate)} readOnly inputMode="numeric" /></Field>
          </div>
        </section>

        <section className="anamnesis-section" aria-labelledby="anamnesis-measures-title">
          <h2 id="anamnesis-measures-title"><span>2</span>Medidas e ciclo</h2>
          <div className="anamnesis-grid two">
            <Field id="lastMenstruationDate" label="DUM (última menstruação)"><input id="lastMenstruationDate" type="date" max={today} value={answers.lastMenstruationDate} onChange={event => update("lastMenstruationDate", event.target.value)} /></Field>
            <Field id="weightKg" label="Peso (kg)"><input id="weightKg" type="number" min="0" max="500" step="0.1" inputMode="decimal" value={answers.weightKg} onChange={event => update("weightKg", event.target.value)} /></Field>
            <div className="anamnesis-field wide"><span className="anamnesis-label">PA (mmHg)</span><div className="anamnesis-pressure"><input aria-label="Pressão arterial sistólica" type="number" min="0" max="300" placeholder="120" inputMode="numeric" value={answers.bloodPressureSystolic} onChange={event => update("bloodPressureSystolic", event.target.value)} /><span aria-hidden="true">×</span><input aria-label="Pressão arterial diastólica" type="number" min="0" max="200" placeholder="80" inputMode="numeric" value={answers.bloodPressureDiastolic} onChange={event => update("bloodPressureDiastolic", event.target.value)} /></div></div>
            <Field id="menarcheAge" label="Menarca (idade da primeira menstruação)" className="wide"><input id="menarcheAge" type="number" min="0" max="99" inputMode="numeric" value={answers.menarcheAge} onChange={event => update("menarcheAge", event.target.value)} /></Field>
          </div>
        </section>

        <section className="anamnesis-section" aria-labelledby="anamnesis-gynecology-title">
          <h2 id="anamnesis-gynecology-title"><span>3</span>Histórico ginecológico</h2>
          <fieldset className="anamnesis-choice-group"><legend>MC – método contraceptivo</legend><div className="anamnesis-choice-row"><RadioChoice name="contraceptiveUse" label="Sim" value="SIM" selected={answers.contraceptiveUse} onChange={value => update("contraceptiveUse", value)} /><RadioChoice name="contraceptiveUse" label="Não" value="NAO" selected={answers.contraceptiveUse} onChange={value => update("contraceptiveUse", value)} /></div></fieldset>
          <Field id="contraceptiveMethod" label="Qual?"><input id="contraceptiveMethod" value={answers.contraceptiveMethod} onChange={event => update("contraceptiveMethod", event.target.value)} maxLength={2000} /></Field>
          <div className="anamnesis-label anamnesis-group-label">G.P.A.</div>
          <div className="anamnesis-grid two anamnesis-gpa">
            <Field id="pregnancies" label="Gestações"><input id="pregnancies" type="number" min="0" max="99" value={answers.pregnancies} onChange={event => update("pregnancies", event.target.value)} /></Field>
            <Field id="normalBirths" label="Parto normal"><input id="normalBirths" type="number" min="0" max="99" value={answers.normalBirths} onChange={event => update("normalBirths", event.target.value)} /></Field>
            <Field id="cesareanBirths" label="Parto cesária"><input id="cesareanBirths" type="number" min="0" max="99" value={answers.cesareanBirths} onChange={event => update("cesareanBirths", event.target.value)} /></Field>
            <Field id="abortions" label="Aborto"><input id="abortions" type="number" min="0" max="99" value={answers.abortions} onChange={event => update("abortions", event.target.value)} /></Field>
          </div>
          <div className="anamnesis-grid two">
            <Field id="lastPreventiveExam" label="Último preventivo"><input id="lastPreventiveExam" type="month" max={currentMonth} value={answers.lastPreventiveExam} onChange={event => update("lastPreventiveExam", event.target.value)} /></Field>
            <Field id="umg" label="UMG"><input id="umg" value={answers.umg} onChange={event => update("umg", event.target.value)} maxLength={2000} /></Field>
          </div>
        </section>

        <section className="anamnesis-section" aria-labelledby="anamnesis-general-title">
          <h2 id="anamnesis-general-title"><span>4</span>Saúde geral</h2>
          <fieldset className="anamnesis-choice-group"><legend>Comorbidade</legend>
            <label className="anamnesis-check"><input type="checkbox" checked={answers.hasChronicHypertension} onChange={event => update("hasChronicHypertension", event.target.checked)} /><span>H.A.C. (hipertensão arterial crônica)</span></label>
            <label className="anamnesis-check"><input type="checkbox" checked={answers.hasOtherComorbidities} onChange={event => update("hasOtherComorbidities", event.target.checked)} /><span>Outros</span></label>
          </fieldset>
          <Field id="comorbidityDetails" label="Quais?"><input id="comorbidityDetails" value={answers.comorbidityDetails} onChange={event => update("comorbidityDetails", event.target.value)} maxLength={2000} /></Field>
          <fieldset className="anamnesis-choice-group"><legend>Alergia</legend><div className="anamnesis-choice-row"><RadioChoice name="hasAllergy" label="Não" value="NAO" selected={answers.hasAllergy} onChange={value => update("hasAllergy", value)} /><RadioChoice name="hasAllergy" label="Sim" value="SIM" selected={answers.hasAllergy} onChange={value => update("hasAllergy", value)} /></div></fieldset>
          <Field id="allergyDetails" label="Quais?"><input id="allergyDetails" value={answers.allergyDetails} onChange={event => update("allergyDetails", event.target.value)} maxLength={2000} /></Field>
          <Field id="previousSurgeries" label="Cirurgias prévias"><textarea id="previousSurgeries" rows={3} value={answers.previousSurgeries} onChange={event => update("previousSurgeries", event.target.value)} maxLength={2000} /></Field>
          <Field id="physicalActivity" label="Atividade física"><input id="physicalActivity" placeholder="Tipo e frequência" value={answers.physicalActivity} onChange={event => update("physicalActivity", event.target.value)} maxLength={500} /></Field>
        </section>

        <section className="anamnesis-section" aria-labelledby="anamnesis-reason-title">
          <h2 id="anamnesis-reason-title"><span>5</span>Motivo da consulta</h2>
          <Field id="chiefComplaint" label="QP – queixa principal"><textarea id="chiefComplaint" rows={3} value={answers.chiefComplaint} onChange={event => update("chiefComplaint", event.target.value)} maxLength={2000} /></Field>
          <label className="anamnesis-check anamnesis-routine"><input type="checkbox" checked={answers.routineEvaluation} onChange={event => update("routineEvaluation", event.target.checked)} /><span>Avaliação de rotina</span></label>
          <Field id="otherReason" label="Outros"><textarea id="otherReason" rows={4} value={answers.otherReason} onChange={event => update("otherReason", event.target.value)} maxLength={2000} /></Field>
        </section>

        <div className="anamnesis-consent">
          <label><input type="checkbox" checked={consentAccepted} onChange={event => setConsentAccepted(event.target.checked)} required /><span>Confirmo que as informações são verdadeiras e autorizo o uso dos meus dados pela clínica, conforme a LGPD.</span></label>
          <p><ShieldCheck size={15} /> A ficha será encaminhada à equipe responsável pelo seu atendimento.</p>
        </div>
        {submitError ? <div className="anamnesis-submit-error" role="alert"><AlertCircle size={17} />{submitError}</div> : null}
        <button className="anamnesis-submit" type="submit" disabled={submitting || !consentAccepted}>{submitting ? <><LoaderCircle className="anamnesis-spinner" size={19} />Enviando ficha…</> : "Enviar ficha"}</button>
      </form> : null}
    </main>
    <footer className="anamnesis-footer">Clínica Intimavie · atendimento acolhedor e confidencial</footer>
  </div>;
}
