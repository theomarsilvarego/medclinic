import React, { useEffect, useState } from 'react';
import { FileKey2, KeyRound, ShieldCheck, Upload, X } from 'lucide-react';
import { API, request } from '../lib/app';

type Certificate = Record<string, any>;

export function CertificateSettingsPage() {
  const [certificates, setCertificates] = useState<Certificate[]>([]);
  const [name, setName] = useState('Certificado da médica');
  const [password, setPassword] = useState('');
  const [file, setFile] = useState<File | null>(null);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  async function load() { try { setCertificates(await request('/admin/digital-certificates') || []); } catch (e: any) { setError(e.message); } finally { setLoading(false); } }
  useEffect(() => { void load(); }, []);
  async function save(event: React.FormEvent) {
    event.preventDefault(); if (!file || !name.trim() || !password) { setError('Informe o nome, selecione o arquivo PFX/P12 e digite a senha.'); return; }
    setSaving(true); setError(''); setMessage('');
    try { const form = new FormData(); form.append('name', name.trim()); form.append('password', password); form.append('certificate', file); const token = localStorage.getItem('medclinic_token'); const response = await fetch(`${API}/admin/digital-certificates`, { method: 'POST', headers: token ? { Authorization: `Bearer ${token}` } : {}, body: form }); const result = await response.json().catch(() => ({})); if (!response.ok) throw new Error(result.message || 'Não foi possível salvar o certificado.'); setMessage('Certificado configurado. Os próximos pedidos de exames serão assinados digitalmente.'); setPassword(''); setFile(null); const input = document.getElementById('digital-certificate-file') as HTMLInputElement | null; if (input) input.value = ''; await load(); } catch (e: any) { setError(e.message); } finally { setSaving(false); }
  }
  async function deactivate(id: number) { if (!confirm('Desativar o certificado atual? Os próximos PDFs não terão assinatura digital até que outro seja configurado.')) return; try { await request(`/admin/digital-certificates/${id}`, { method: 'DELETE' }); await load(); } catch (e: any) { setError(e.message); } }
  const active = certificates.find(item => item.active);
  return <div className="certificate-page"><div className="page-heading"><div><p className="eyebrow">ADMINISTRAÇÃO</p><h1>Certificados digitais</h1><p className="muted">Configure a assinatura digital dos pedidos de exames laboratoriais.</p></div><KeyRound size={30} className="certificate-heading-icon" /></div>{error && <div className="error page-error">{error}</div>}{message && <div className="success page-error">{message}</div>}<div className="certificate-grid"><section className="certificate-card"><div className="certificate-card-heading"><span className="certificate-icon"><ShieldCheck size={21}/></span><div><h2>Certificado ativo</h2><p>O arquivo e a senha ficam criptografados no banco de dados.</p></div></div>{loading ? <p className="muted">Carregando…</p> : active ? <div className="certificate-active"><strong>{active.name}</strong><span><FileKey2 size={14}/> {active.fileName}</span><small>Configurado em {new Date(active.createdAt).toLocaleDateString('pt-BR')} por {active.uploadedBy?.fullName || 'Administrador'}</small><button className="secondary" onClick={() => void deactivate(Number(active.id))}><X size={15}/> Desativar certificado</button></div> : <div className="certificate-empty"><KeyRound size={25}/><strong>Nenhum certificado ativo</strong><span>Os pedidos continuarão sem assinatura digital até configurar um certificado.</span></div>}</section><section className="certificate-card"><div className="certificate-card-heading"><span className="certificate-icon"><Upload size={21}/></span><div><h2>Adicionar certificado</h2><p>Compatível com arquivos A1 nos formatos PFX ou P12.</p></div></div><form className="certificate-form" onSubmit={save}><label>Nome de identificação<input value={name} onChange={event => setName(event.target.value)} placeholder="Ex.: Certificado Dra. Christiane" /></label><label>Arquivo PFX/P12<input id="digital-certificate-file" type="file" accept=".pfx,.p12,application/x-pkcs12" onChange={event => setFile(event.target.files?.[0] || null)} /></label><label>Senha do certificado<input type="password" value={password} onChange={event => setPassword(event.target.value)} autoComplete="new-password" /></label><small>A senha não é exibida novamente e nunca é retornada pela API.</small><button className="primary" type="submit" disabled={saving}>{saving ? 'Salvando…' : 'Salvar e ativar certificado'}</button></form></section></div></div>;
}
