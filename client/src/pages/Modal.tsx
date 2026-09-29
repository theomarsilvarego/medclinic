import React, { useState } from 'react';
import { X } from 'lucide-react';
import type { Row } from '../lib/app';
export function Modal({title,fields,initial,onClose,onSave}:{title:string;fields:any[];initial:Row;onClose:()=>void;onSave:(d:Row)=>void}) {
  const [data,setData]=useState<Row>(initial);
  const update=(key:string,value:any)=>setData({...data,[key]:value});
  return <div className="modal-backdrop"><div className="modal">
    <div className="modal-header"><div><p className="eyebrow">CADASTRO</p><h2>{title}</h2></div><button className="icon-button" onClick={onClose}><X size={19}/></button></div>
    <div className="modal-fields">{fields.map(f=><label key={f.key} className={f.type==='checkbox'?'check-label':''}>
      {f.type==='checkbox' ? <><input type="checkbox" checked={data[f.key] ?? true} onChange={e=>update(f.key,e.target.checked)}/>{f.label}</> : <>
        {f.label}
        {f.type==='select' ? <select value={data[f.key]||''} onChange={e=>update(f.key,e.target.value)}><option value="">Selecione…</option>{f.options.map((o:any)=><option key={typeof o==='string'?o:o.value} value={typeof o==='string'?o:o.value}>{typeof o==='string'?o:o.label}</option>)}</select> : f.type==='textarea' ? <textarea rows={5} value={data[f.key]||''} onChange={e=>update(f.key,e.target.value)}/> : <input type={f.type||'text'} value={data[f.key]||''} onChange={e=>update(f.key,f.type==='number'?Number(e.target.value):e.target.value)}/>}
      </>}
    </label>)}</div>
    <div className="modal-footer"><button className="secondary" onClick={onClose}>Cancelar</button><button className="primary" onClick={()=>onSave(data)}>Salvar cadastro</button></div>
  </div></div>;
}
