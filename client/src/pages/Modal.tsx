import React, { useEffect, useState } from 'react';
import { ImagePlus, X } from 'lucide-react';
import { API } from '../lib/app';
import type { Row } from '../lib/app';
export function Modal({title,fields,initial,onClose,onSave}:{title:string;fields:any[];initial:Row;onClose:()=>void;onSave:(d:Row)=>void}) {
  const [data,setData]=useState<Row>(initial);
  const [preview,setPreview]=useState<string | null>(null);
  const [zoom,setZoom]=useState(1);
  const [offsetX,setOffsetX]=useState(50);
  const [offsetY,setOffsetY]=useState(50);
  const update=(key:string,value:any)=>setData({...data,[key]:value});
  useEffect(() => {
    let objectUrl: string | null = null;
    if (!initial.photoUrl) return;
    fetch(`${API}${initial.photoUrl}`, { headers: { Authorization: `Bearer ${localStorage.getItem('medclinic_token') || ''}` } })
      .then(response => response.ok ? response.blob() : null)
      .then(blob => { if (blob) { objectUrl = URL.createObjectURL(blob); setPreview(objectUrl); } })
      .catch(() => undefined);
    return () => { if (objectUrl) URL.revokeObjectURL(objectUrl); };
  }, [initial.photoUrl]);
  useEffect(() => () => {
    if (data.photo instanceof File && preview?.startsWith('blob:')) URL.revokeObjectURL(preview);
  }, [data.photo, preview]);
  const handlePhoto = (file: File | undefined) => {
    if (!file) return;
    if (!['image/jpeg', 'image/png'].includes(file.type)) return alert('A foto deve estar no formato JPG ou PNG.');
    if (file.size > 10 * 1024 * 1024) return alert('A foto deve ter no máximo 10 MB.');
    if (preview?.startsWith('blob:')) URL.revokeObjectURL(preview);
    setPreview(URL.createObjectURL(file));
    setZoom(1); setOffsetX(50); setOffsetY(50);
    update('photo', file);
  };
  const save = async () => {
    let photoToSave = data.photo;
    if (data.photo instanceof File && preview) {
      const image = new Image();
      image.src = preview;
      await new Promise(resolve => { image.onload = resolve; image.onerror = resolve; });
      if (image.naturalWidth) {
        const canvas = document.createElement('canvas'); canvas.width = 800; canvas.height = 800;
        const context = canvas.getContext('2d');
        if (context) {
          const scale = Math.max(800 / image.naturalWidth, 800 / image.naturalHeight) * zoom;
          const width = image.naturalWidth * scale, height = image.naturalHeight * scale;
          const x = (800 - width) * offsetX / 100, y = (800 - height) * offsetY / 100;
          context.drawImage(image, x, y, width, height);
          const blob = await new Promise<Blob | null>(resolve => canvas.toBlob(resolve, data.photo.type, .9));
          if (blob) photoToSave = new File([blob], data.photo.name, { type: data.photo.type });
        }
      }
    }
    onSave({ ...data, photo: photoToSave });
  };
  return <div className="modal-backdrop"><div className="modal">
    <div className="modal-header"><div><p className="eyebrow">CADASTRO</p><h2>{title}</h2></div><button className="icon-button" onClick={onClose}><X size={19}/></button></div>
    <div className="modal-fields">{fields.map(f=><label key={f.key} className={[f.type==='checkbox'?'check-label':'',f.fullWidth?'modal-field-full-width':''].filter(Boolean).join(' ')}>
      {f.type==='checkbox' ? <><input type="checkbox" checked={data[f.key] ?? true} onChange={e=>update(f.key,e.target.checked)}/>{f.label}</> : <>
        {f.label}
        {f.type==='file' ? <div className="patient-photo-picker"><div className="patient-photo-preview">{preview ? <img src={preview} alt="Prévia enquadrada da foto do paciente" style={{ transform: `scale(${zoom})`, objectPosition: `${offsetX}% ${offsetY}%` }} /> : <ImagePlus size={28} />}</div><div><input type="file" accept="image/jpeg,image/png" onChange={e=>handlePhoto(e.target.files?.[0])}/>{preview && <><label className="photo-crop-control">Zoom <input type="range" min="1" max="2.5" step="0.05" value={zoom} onChange={e=>setZoom(Number(e.target.value))}/></label><label className="photo-crop-control">Horizontal <input type="range" min="0" max="100" value={offsetX} onChange={e=>setOffsetX(Number(e.target.value))}/></label><label className="photo-crop-control">Vertical <input type="range" min="0" max="100" value={offsetY} onChange={e=>setOffsetY(Number(e.target.value))}/></label></>}<small>JPG ou PNG, até 10 MB. Ajuste o enquadramento da thumb.</small></div></div> : f.type==='select' ? <select value={data[f.key]||''} onChange={e=>update(f.key,e.target.value)}><option value="">Selecione…</option>{f.options.map((o:any)=><option key={typeof o==='string'?o:o.value} value={typeof o==='string'?o:o.value}>{typeof o==='string'?o:o.label}</option>)}</select> : f.type==='textarea' ? <textarea rows={5} value={data[f.key]||''} onChange={e=>update(f.key,e.target.value)}/> : <input type={f.type||'text'} value={data[f.key]||''} onChange={e=>update(f.key,e.target.value)}/>} 
      </>}
    </label>)}</div>
    <div className="modal-footer"><button className="secondary" onClick={onClose}>Cancelar</button><button className="primary" onClick={save}>Salvar cadastro</button></div>
  </div></div>;
}
