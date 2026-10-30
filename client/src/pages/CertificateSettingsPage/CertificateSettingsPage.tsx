import React, { useEffect, useState } from "react";
import { FileKey2, KeyRound, ShieldCheck, Upload, X } from "lucide-react";
import { API, request } from "../../lib/app";
import "./CertificateSettingsPage.css";

type Doctor = { id: number; fullName: string; crm: string };
type MedicalUser = { id: number; fullName: string; login: string };
type Certificate = Record<string, any>;

export function CertificateSettingsPage() {
  const [certificates, setCertificates] = useState<Certificate[]>([]);
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [medicalUsers, setMedicalUsers] = useState<MedicalUser[]>([]);
  const [doctorId, setDoctorId] = useState("");
  const [assignedUserId, setAssignedUserId] = useState("");
  const [name, setName] = useState("");
  const [password, setPassword] = useState("");
  const [file, setFile] = useState<File | null>(null);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");

  async function load() {
    try {
      const [certificateRows, doctorRows, userRows] = await Promise.all([
        request("/admin/digital-certificates"),
        request("/admin/clinical-document-doctors"),
        request("/admin/clinical-document-users"),
      ]);
      setCertificates(certificateRows || []);
      setDoctors(doctorRows || []);
      setMedicalUsers(userRows || []);
      if (!doctorId && doctorRows?.length) setDoctorId(String(doctorRows[0].id));
      if (!assignedUserId && userRows?.length) setAssignedUserId(String(userRows[0].id));
    } catch (cause: any) {
      setError(cause.message || "Não foi possível carregar os certificados.");
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => { void load(); }, []);

  async function save(event: React.FormEvent) {
    event.preventDefault();
    if (!doctorId || !assignedUserId || !file || !name.trim() || !password) {
      setError("Selecione a médica e a conta autorizada, informe nome, arquivo PFX/P12 e senha.");
      return;
    }
    setSaving(true);
    setError("");
    setMessage("");
    try {
      const form = new FormData();
      form.append("doctorId", doctorId);
      form.append("assignedUserId", assignedUserId);
      form.append("name", name.trim());
      form.append("password", password);
      form.append("certificate", file);
      const token = localStorage.getItem("medclinic_token");
      const response = await fetch(`${API}/admin/digital-certificates`, {
        method: "POST",
        headers: token ? { Authorization: `Bearer ${token}` } : {},
        body: form,
      });
      const result = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(result.message || "Não foi possível salvar o certificado.");
      setMessage(`Certificado ICP-Brasil associado a ${result.doctor?.fullName || "médica"} e à conta ${result.assignedUser?.fullName || "médica"}.`);
      setPassword("");
      setFile(null);
      const input = document.getElementById("digital-certificate-file") as HTMLInputElement | null;
      if (input) input.value = "";
      await load();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível salvar o certificado.");
    } finally {
      setSaving(false);
    }
  }

  async function deactivate(id: number) {
    if (!confirm("Desativar este certificado? Novos documentos assinados por essa médica ficarão bloqueados até configurar outro.")) return;
    try {
      await request(`/admin/digital-certificates/${id}`, { method: "DELETE" });
      setMessage("Certificado desativado.");
      await load();
    } catch (cause: any) {
      setError(cause.message || "Não foi possível desativar o certificado.");
    }
  }

  const active = certificates.filter((item) => item.active);
  return (
    <div className="certificate-page">
      <div className="page-heading">
        <div>
          <p className="eyebrow">ADMINISTRAÇÃO</p>
          <h1>Certificados digitais</h1>
          <p className="muted">Associe o certificado individual à médica e à conta autorizada. O sistema confere a chave correspondente, o titular cadastrado e a validade temporal.</p>
        </div>
        <KeyRound size={30} className="certificate-heading-icon" />
      </div>
      {error && <div className="error page-error" role="alert">{error}</div>}
      {message && <div className="success page-error" role="status">{message}</div>}
      <div className="certificate-grid">
        <section className="certificate-card">
          <div className="certificate-card-heading">
            <span className="certificate-icon"><ShieldCheck size={21} /></span>
            <div><h2>Certificados ativos</h2><p>O arquivo e a senha permanecem criptografados no banco.</p></div>
          </div>
          {loading ? <p className="muted">Carregando…</p> : active.length ? (
            <div className="certificate-active-list">
              {active.map((certificate) => (
                <div className="certificate-active" key={certificate.id}>
              <strong>{certificate.doctor?.fullName || "Certificado legado sem vínculo médico"}</strong>
              <span><FileKey2 size={14} /> {certificate.fileName}</span>
              <small>{certificate.name}{certificate.doctor?.crm ? ` · CRM ${certificate.doctor.crm}` : ""}{certificate.assignedUser ? ` · conta: ${certificate.assignedUser.fullName}` : " · sem conta médica vinculada"} · configurado em {new Date(certificate.createdAt).toLocaleDateString("pt-BR")}</small>
                  <button className="secondary" type="button" onClick={() => void deactivate(Number(certificate.id))}><X size={15} /> Desativar</button>
                </div>
              ))}
            </div>
          ) : (
            <div className="certificate-empty"><KeyRound size={25} /><strong>Nenhum certificado ativo</strong><span>A emissão de receitas e atestados ficará indisponível até cadastrar um certificado individual válido.</span></div>
          )}
        </section>
        <section className="certificate-card">
          <div className="certificate-card-heading">
            <span className="certificate-icon"><Upload size={21} /></span>
            <div><h2>Vincular certificado</h2><p>Compatível com certificados A1 nos formatos PFX ou P12.</p></div>
          </div>
          <form className="certificate-form" onSubmit={save}>
            <label>Médica titular
              <select value={doctorId} onChange={(event) => setDoctorId(event.target.value)} required>
                <option value="">Selecione a médica</option>
                {doctors.map((doctor) => <option key={doctor.id} value={doctor.id}>{doctor.fullName} · CRM {doctor.crm}</option>)}
              </select>
            </label>
            <label>Conta autorizada a emitir/cancelar
              <select value={assignedUserId} onChange={(event) => setAssignedUserId(event.target.value)} required>
                <option value="">Selecione a conta médica</option>
                {medicalUsers.map((user) => <option key={user.id} value={user.id}>{user.fullName} · {user.login}</option>)}
              </select>
            </label>
            <label>Nome de identificação<input value={name} onChange={(event) => setName(event.target.value)} placeholder="Ex.: Certificado Dra. Nome" /></label>
            <label>Arquivo PFX/P12<input id="digital-certificate-file" type="file" accept=".pfx,.p12,application/x-pkcs12" onChange={(event) => setFile(event.target.files?.[0] || null)} /></label>
            <label>Senha do certificado<input type="password" value={password} onChange={(event) => setPassword(event.target.value)} autoComplete="new-password" /></label>
            <small>A titularidade do certificado será conferida com o nome cadastrado. Use certificado ICP-Brasil individual e valide a cadeia de confiança/revogação no leitor de PDF antes de utilizar o documento externamente. A senha não será exibida novamente.</small>
            <button className="primary" type="submit" disabled={saving || !doctors.length || !medicalUsers.length}>{saving ? "Salvando…" : "Salvar e vincular certificado"}</button>
          </form>
        </section>
      </div>
    </div>
  );
}
