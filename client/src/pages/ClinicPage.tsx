import React, { useEffect, useState } from 'react';
import { Building2, Pencil, Plus } from 'lucide-react';
import type { Row } from '../lib/app';
import { request } from '../lib/app';
import { Modal } from './Modal';

const fields = [
  { key: 'legalName', label: 'Razão social' },
  { key: 'tradeName', label: 'Nome fantasia' },
  { key: 'cnpj', label: 'CNPJ' },
  { key: 'cnae', label: 'CNAE' },
  { key: 'address', label: 'Endereço', type: 'textarea' },
];

export function ClinicPage() {
  const [data, setData] = useState<Row>({});
  const [loading, setLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [error, setError] = useState('');

  async function load() {
    setLoading(true);
    setError('');
    try {
      const result = await request('/admin/clinic');
      setData(result || {});
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => { load(); }, []);

  async function save(values: Row) {
    try {
      await request('/admin/clinic', { method: 'PUT', body: JSON.stringify(values) });
      setData(values);
      setModalOpen(false);
    } catch (e: any) {
      setError(e.message);
    }
  }

  const hasData = Boolean(data.tradeName || data.legalName || data.cnpj || data.cnae || data.address);

  return <>
    <div className="page-heading">
      <div>
        <p className="eyebrow">ADMINISTRAÇÃO</p>
        <h1>Clínica</h1>
        <p className="muted">Cadastre e mantenha os dados atualizados.</p>
      </div>
      <button className="primary" onClick={() => setModalOpen(true)}>
        <Plus size={17} /> {hasData ? 'Editar clínica' : 'Nova clínica'}
      </button>
    </div>
    {error && <div className="error page-error">{error}</div>}
    <div className="table-card">
      <div className="table-head">
        <strong>{loading ? 'Carregando…' : `${hasData ? 1 : 0} cadastro${hasData ? '' : 's'}`}</strong>
        <span className="muted">Última atualização agora</span>
      </div>
      {loading ? <div className="empty">Carregando…</div> : !hasData ? <div className="empty"><Building2 size={28}/><strong>Nenhum cadastro ainda</strong><span>Adicione os dados da clínica usando o botão acima.</span></div> : <div className="table-scroll">
        <table>
          <thead><tr><th>Nome fantasia</th><th>Razão social</th><th>CNPJ</th><th>CNAE</th><th></th></tr></thead>
          <tbody><tr>
            <td>{data.tradeName || '—'}</td>
            <td>{data.legalName || '—'}</td>
            <td>{data.cnpj || '—'}</td>
            <td>{data.cnae || '—'}</td>
            <td className="row-actions"><button onClick={() => setModalOpen(true)} title="Editar clínica"><Pencil size={16}/></button></td>
          </tr></tbody>
        </table>
      </div>}
    </div>
    {modalOpen && <Modal title={hasData ? 'Editar clínica' : 'Nova clínica'} fields={fields} initial={data} onClose={() => setModalOpen(false)} onSave={save}/>}
  </>;
}
