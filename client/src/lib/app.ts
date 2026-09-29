export type Profile = 'ADMINISTRADOR' | 'MEDICO' | 'SECRETARIA';
export type ModuleKey = 'overview' | 'doctor-day' | 'patients' | 'users' | 'clinic' | 'doctors' | 'insurances' | 'procedures' | 'attendances' | 'appointments';
export type Row = Record<string, any>;

export const API = import.meta.env.VITE_API_URL || 'http://localhost:3333/api';
export async function request(path: string, options: RequestInit = {}) { const token = localStorage.getItem('medclinic_token'); const res = await fetch(`${API}${path}`, { ...options, headers: { 'Content-Type': 'application/json', ...(token ? { Authorization: `Bearer ${token}` } : {}), ...(options.headers || {}) } }); if (!res.ok) { const e = await res.json().catch(() => ({})); throw new Error(e.message || 'Não foi possível concluir a operação.'); } return res.status === 204 ? null : res.json(); }
export const getRowId = (row: Row | null | undefined) => { const id = Number(row?.id); return Number.isInteger(id) && id > 0 ? id : null; };
export const money = (value: number) => new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(Number(value || 0));
export const profileLabel = (profile: string) => ({ ADMINISTRADOR: 'Administrador', MEDICO: 'Médico', SECRETARIA: 'Secretária' }[profile] || profile);
export const profileGreeting = (profile: string) => ({ ADMINISTRADOR: 'administrador', MEDICO: 'médico', SECRETARIA: 'secretária' }[profile] || 'usuário');
