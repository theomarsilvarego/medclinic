import React, { useEffect, useState } from "react";
import { Check, Clipboard, FileText, LoaderCircle, MessageCircle, QrCode, RefreshCw, ShieldCheck, X } from "lucide-react";
import QRCode from "qrcode";
import type { Row } from "../lib/app";
import { request } from "../lib/app";
import "./anamnesis-share.css";

type AnamnesisState = {
  state: "not_created" | "pending" | "submitted";
  expiresAt?: string;
  submittedAt?: string;
  consentAcceptedAt?: string | null;
  answers?: Record<string, unknown> | null;
};

const groups: { title: string; fields: [string, string][] }[] = [
  { title: "Identificação", fields: [["orderNumber", "Ordem Nº"], ["appointmentDate", "Data do agendamento"], ["cpf", "CPF"], ["fullName", "Nome completo"], ["titularNumber", "Nº titular"], ["maritalStatus", "Estado civil"], ["phone", "Contato"], ["birthDate", "Data de nascimento"], ["age", "Idade"]] },
  { title: "Medidas e ciclo", fields: [["lastMenstruationDate", "DUM"], ["weightKg", "Peso (kg)"], ["bloodPressureSystolic", "PA sistólica"], ["bloodPressureDiastolic", "PA diastólica"], ["menarcheAge", "Menarca"]] },
  { title: "Histórico ginecológico", fields: [["contraceptiveUse", "Método contraceptivo"], ["contraceptiveMethod", "Qual método"], ["pregnancies", "Gestações"], ["normalBirths", "Partos normais"], ["cesareanBirths", "Partos cesárea"], ["abortions", "Abortos"], ["lastPreventiveExam", "Último preventivo"], ["umg", "UMG"]] },
  { title: "Saúde geral", fields: [["hasChronicHypertension", "H.A.C."], ["hasOtherComorbidities", "Outras comorbidades"], ["comorbidityDetails", "Comorbidades informadas"], ["hasAllergy", "Alergia"], ["allergyDetails", "Alergias informadas"], ["previousSurgeries", "Cirurgias prévias"], ["physicalActivity", "Atividade física"]] },
  { title: "Motivo da consulta", fields: [["chiefComplaint", "Queixa principal"], ["routineEvaluation", "Avaliação de rotina"], ["otherReason", "Outros detalhes"]] },
];

function formatValue(value: unknown) {
  if (value === null || value === undefined || value === "") return "Não informado";
  if (typeof value === "boolean") return value ? "Sim" : "Não";
  if (value === "SIM") return "Sim";
  if (value === "NAO") return "Não";
  const text = String(value);
  if (/^\d{4}-\d{2}-\d{2}$/.test(text)) {
    const [year, month, day] = text.split("-");
    return `${day}/${month}/${year}`;
  }
  return text;
}

function phoneForWhatsApp(phone: unknown) {
  const digits = String(phone || "").replace(/\D/g, "");
  if (!digits) return "";
  return digits.startsWith("55") ? digits : `55${digits}`;
}

export function AnamnesisAppointmentModal({ appointment, onClose }: { appointment: Row; onClose: () => void }) {
  const [state, setState] = useState<AnamnesisState | null>(null);
  const [qrCode, setQrCode] = useState("");
  const [publicUrl, setPublicUrl] = useState("");
  const [loading, setLoading] = useState(true);
  const [generating, setGenerating] = useState(false);
  const [error, setError] = useState("");
  const [copied, setCopied] = useState(false);
  const [retry, setRetry] = useState(0);

  useEffect(() => {
    let active = true;
    setLoading(true);
    setError("");
    request(`/appointments/${Number(appointment.id)}/anamnesis`)
      .then((result: AnamnesisState) => { if (active) setState(result); })
      .catch((cause: unknown) => { if (active) setError(cause instanceof Error ? cause.message : "Não foi possível carregar a ficha."); })
      .finally(() => { if (active) setLoading(false); });
    return () => { active = false; };
  }, [appointment.id, retry]);

  useEffect(() => {
    const onKeyDown = (event: KeyboardEvent) => { if (event.key === "Escape") onClose(); };
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [onClose]);

  async function generateLink() {
    setGenerating(true);
    setError("");
    setCopied(false);
    try {
      const result = await request(`/appointments/${Number(appointment.id)}/anamnesis-link`, { method: "POST" });
      const url = `${window.location.origin}/anamnese/${result.token}`;
      const image = await QRCode.toDataURL(url, {
        width: 260,
        margin: 2,
        errorCorrectionLevel: "M",
        color: { dark: "#143d37", light: "#ffffff" },
      });
      setPublicUrl(url);
      setQrCode(image);
      setState(current => current ? { ...current, state: "pending", expiresAt: result.expiresAt } : { state: "pending", expiresAt: result.expiresAt });
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Não foi possível gerar o QR Code.");
    } finally {
      setGenerating(false);
    }
  }

  async function copyLink() {
    if (!publicUrl) return;
    try {
      await navigator.clipboard.writeText(publicUrl);
      setCopied(true);
      window.setTimeout(() => setCopied(false), 2200);
    } catch {
      setError("Não foi possível copiar automaticamente. Selecione e copie o link exibido.");
    }
  }

  function shareWhatsApp() {
    const phone = phoneForWhatsApp(appointment.patient?.phone);
    const firstName = String(appointment.patient?.fullName || "").trim().split(/\s+/)[0];
    const message = `Olá${firstName ? `, ${firstName}` : ""}! Para se preparar para sua consulta na Clínica Intimavie, preencha sua ficha de anamnese pelo link seguro: ${publicUrl}`;
    const query = new URLSearchParams({ text: message });
    const target = phone ? `https://wa.me/${phone}?${query}` : `https://wa.me/?${query}`;
    window.open(target, "_blank", "noopener,noreferrer");
  }

  const formattedExpiry = state?.expiresAt ? new Date(state.expiresAt).toLocaleDateString("pt-BR") : "";
  const formattedSubmission = state?.submittedAt ? new Date(state.submittedAt).toLocaleString("pt-BR", { dateStyle: "short", timeStyle: "short" }) : "";

  return <div className="anamnesis-share-backdrop" onMouseDown={event => { if (event.target === event.currentTarget) onClose(); }}>
    <section className="anamnesis-share-modal" role="dialog" aria-modal="true" aria-labelledby="anamnesis-share-title">
      <header className="anamnesis-share-header">
        <div className="anamnesis-share-heading"><span className="anamnesis-share-icon"><QrCode size={20} /></span><div><p>AGENDAMENTO · {appointment.scheduledTime}</p><h2 id="anamnesis-share-title">Ficha de anamnese</h2><span>{appointment.patient?.fullName}</span></div></div>
        <button className="anamnesis-share-close" type="button" onClick={onClose} aria-label="Fechar janela"><X size={19} /></button>
      </header>
      <div className="anamnesis-share-content">
        {loading ? <div className="anamnesis-share-state"><LoaderCircle className="anamnesis-share-spin" size={20} />Verificando o status da ficha…</div> : null}
        {!loading && error && !state ? <div className="anamnesis-share-error" role="alert">{error}<button type="button" onClick={() => setRetry(value => value + 1)}>Tentar novamente</button></div> : null}
        {!loading && state?.state === "submitted" ? <div className="anamnesis-submitted-view">
          <div className="anamnesis-submitted-banner"><Check size={18} /><div><strong>Ficha enviada pelo paciente</strong><span>{formattedSubmission}</span></div></div>
          <div className="anamnesis-consent-receipt"><ShieldCheck size={16} /> Aceite LGPD registrado{state.consentAcceptedAt ? ` em ${new Date(state.consentAcceptedAt).toLocaleString("pt-BR", { dateStyle: "short", timeStyle: "short" })}` : ""}.</div>
          {groups.map(group => <section className="anamnesis-answer-group" key={group.title}><h3>{group.title}</h3><dl>{group.fields.map(([key, label]) => <div key={key}><dt>{label}</dt><dd>{formatValue(state.answers?.[key])}</dd></div>)}</dl></section>)}
        </div> : null}
        {!loading && state?.state !== "submitted" && state && !publicUrl ? <div className="anamnesis-share-start">
          <div className="anamnesis-share-description"><p>Gere um QR Code vinculado a este agendamento e entregue à paciente para preencher a ficha no celular.</p><p>O link é pessoal, expira em 30 dias e deixa de funcionar após o envio da ficha.</p></div>
          {state.state === "pending" && <div className="anamnesis-existing-link"><ShieldCheck size={17} /> Existe um link pendente. Gerar outro invalida o QR anterior.</div>}
          <button className="anamnesis-share-primary" type="button" onClick={() => void generateLink()} disabled={generating}>{generating ? <><LoaderCircle className="anamnesis-share-spin" size={17} />Gerando…</> : state.state === "pending" ? <><RefreshCw size={17} />Gerar novo QR Code</> : <><QrCode size={17} />Gerar QR Code e link</>}</button>
        </div> : null}
        {!loading && state?.state !== "submitted" && publicUrl ? <div className="anamnesis-share-result">
          <div className="anamnesis-qr-frame"><img src={qrCode} alt="QR Code para abrir a ficha de anamnese deste agendamento" /></div>
          <p className="anamnesis-qr-caption">A paciente pode ler o QR Code com a câmera do celular</p>
          <label className="anamnesis-link-label" htmlFor="anamnesis-public-link">Link de acesso</label>
          <div className="anamnesis-link-row"><input id="anamnesis-public-link" value={publicUrl} readOnly /><button type="button" onClick={() => void copyLink()} aria-label="Copiar link da ficha" title="Copiar link">{copied ? <Check size={18} /> : <Clipboard size={18} />}</button></div>
          {formattedExpiry && <p className="anamnesis-expiry">Expira em {formattedExpiry}. O acesso é exclusivo para ficha deste agendamento.</p>}
          <div className="anamnesis-share-actions"><button className="anamnesis-share-secondary" type="button" onClick={() => void copyLink()}><Clipboard size={16} />{copied ? "Link copiado" : "Copiar link"}</button><button className="anamnesis-share-whatsapp" type="button" onClick={shareWhatsApp}><MessageCircle size={17} />Abrir WhatsApp</button></div>
          {!phoneForWhatsApp(appointment.patient?.phone) && <p className="anamnesis-no-phone">O cadastro da paciente não tem telefone; o WhatsApp abrirá sem destinatário.</p>}
        </div> : null}
        {error && state ? <div className="anamnesis-share-error" role="alert">{error}</div> : null}
        {!loading && state?.state === "submitted" && state.answers ? <div className="anamnesis-answers-note"><FileText size={15} /> Os dados enviados estão organizados por seção para consulta da equipe.</div> : null}
      </div>
      <footer className="anamnesis-share-footer"><button className="secondary" type="button" onClick={onClose}>Fechar</button></footer>
    </section>
  </div>;
}
