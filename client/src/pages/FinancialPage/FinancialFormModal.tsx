import React from "react";
import { Check, X } from "lucide-react";
import type { Row } from "../../lib/app";
import type { FinancialForm, FormMode } from "./financialTypes";

type Props = {
  formMode: FormMode | null;
  form: FinancialForm;
  accounts: Row[];
  suppliers: Row[];
  patients: Row[];
  doctors: Row[];
  saving: boolean;
  onClose: () => void;
  onChange: (patch: Partial<FinancialForm>) => void;
  onSubmit: (event: React.FormEvent) => void;
};

export function FinancialFormModal({ formMode, form, accounts, suppliers, patients, doctors, saving, onClose, onChange, onSubmit }: Props) {
  if (!formMode) return null;
  const change = (patch: Partial<FinancialForm>) => onChange(patch);
  return (
    <div className="modal-backdrop" onMouseDown={(event) => event.target === event.currentTarget && onClose()}>
      <section className="modal financial-form-modal" role="dialog" aria-modal="true" aria-labelledby="financial-form-title">
        <div className="modal-header">
          <div>
            <p className="eyebrow">NOVO REGISTRO</p>
            <h2 id="financial-form-title">{formMode === "sale" ? "Nova venda" : formMode === "payable" ? "Nova conta a pagar" : formMode === "account" ? "Nova conta financeira" : formMode === "open-session" ? "Abertura de caixa" : "Nova movimentação"}</h2>
            <span className="modal-identification-code" aria-label="Código do modal A007">A007</span>
          </div>
          <button className="icon-button" type="button" onClick={onClose} aria-label="Fechar"><X size={19} /></button>
        </div>
        <form onSubmit={onSubmit}>
          {(formMode === "sale" || formMode === "payable" || formMode === "movement" || formMode === "account") && <label>{formMode === "sale" ? "Serviço comercializado" : formMode === "payable" ? "Descrição da despesa" : formMode === "account" ? "Nome da conta" : "Descrição da movimentação"}<input required value={form.description} onChange={(event) => change({ description: event.target.value })} /></label>}
          {formMode === "sale" && <>
            <label>Paciente<select required value={form.patientId} onChange={(event) => change({ patientId: event.target.value })}><option value="">Selecione</option>{patients.map((row) => <option key={row.id} value={row.id}>{row.fullName}</option>)}</select></label>
            <label>Profissional<select required value={form.professionalId} onChange={(event) => change({ professionalId: event.target.value })}><option value="">Selecione</option>{doctors.map((row) => <option key={row.id} value={row.id}>{row.fullName}</option>)}</select></label>
          </>}
          {formMode === "payable" && <>
            <label>Categoria<input required value={form.category} onChange={(event) => change({ category: event.target.value })} placeholder="Ex.: aluguel, material, serviços" /></label>
            <label>Fornecedor<select required value={form.supplierId} onChange={(event) => change({ supplierId: event.target.value })}><option value="">Selecione</option>{suppliers.map((row) => <option key={row.id} value={row.id}>{row.name || row.legalName}</option>)}</select></label>
          </>}
          {formMode === "account" && <label>Tipo de conta<select value={form.accountType} onChange={(event) => change({ accountType: event.target.value })}><option value="CASH">Caixa físico</option><option value="BANK">Conta bancária</option><option value="OTHER">Outra conta financeira</option></select></label>}
          {(formMode === "sale" || formMode === "payable") && <div className="financial-form-grid">
            <label>{formMode === "sale" ? "Data da venda" : "Valor"}{formMode === "sale" ? <input type="date" value={form.date} onChange={(event) => change({ date: event.target.value })} /> : <input required type="number" min="0.01" step="0.01" value={form.value} onChange={(event) => change({ value: event.target.value })} />}</label>
            <label>{formMode === "sale" ? "Valor" : "Vencimento"}{formMode === "sale" ? <input required type="number" min="0.01" step="0.01" value={form.value} onChange={(event) => change({ value: event.target.value })} /> : <input required type="date" value={form.dueDate} onChange={(event) => change({ dueDate: event.target.value })} />}</label>
          </div>}
          {formMode === "sale" && <>
            <div className="financial-form-grid"><label>Desconto<input type="number" min="0" step="0.01" value={form.discountAmount} onChange={(event) => change({ discountAmount: event.target.value })} /></label><label>Vencimento<input required type="date" value={form.dueDate} onChange={(event) => change({ dueDate: event.target.value })} /></label></div>
            <div className="financial-form-grid"><label>Parcelas<select value={form.installments} onChange={(event) => change({ installments: event.target.value })}>{Array.from({ length: 12 }, (_, i) => <option key={i + 1} value={i + 1}>{i + 1}x</option>)}</select></label><label>Forma prevista<select value={form.method} onChange={(event) => change({ method: event.target.value })}><option value="PIX">Pix</option><option value="DEBIT_CARD">Débito</option><option value="CREDIT_CARD">Crédito</option><option value="CASH">Dinheiro</option><option value="BANK_TRANSFER">Transferência</option></select></label></div>
          </>}
          {formMode === "account" && <label>Saldo inicial<input type="number" min="0" step="0.01" value={form.openingAmount} onChange={(event) => change({ openingAmount: event.target.value })} /></label>}
          {formMode === "open-session" && <>
            <label>Conta física<select required value={form.accountId} onChange={(event) => change({ accountId: event.target.value })}><option value="">Selecione</option>{accounts.filter((item) => item.type === "CASH").map((row) => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label>
            <label>Valor de abertura<input required type="number" min="0" step="0.01" value={form.openingAmount} onChange={(event) => change({ openingAmount: event.target.value })} /></label>
          </>}
          {formMode === "movement" && <>
            <label>Tipo<select value={form.kind} onChange={(event) => change({ kind: event.target.value })}><option value="SUPRIMENTO">Suprimento</option><option value="SANGRIA">Sangria</option><option value="TRANSFERENCIA">Transferência entre contas</option><option value="AJUSTE_ENTRADA">Ajuste de entrada</option><option value="AJUSTE_SAIDA">Ajuste de saída</option></select></label>
            {form.kind === "TRANSFERENCIA" ? <div className="financial-form-grid"><label>Conta de origem<select required value={form.fromAccountId} onChange={(event) => change({ fromAccountId: event.target.value })}>{accounts.map((row) => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label><label>Conta de destino<select required value={form.toAccountId} onChange={(event) => change({ toAccountId: event.target.value })}>{accounts.map((row) => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label></div> : <label>Conta<select required value={form.accountId} onChange={(event) => change({ accountId: event.target.value })}><option value="">Selecione</option>{accounts.map((row) => <option key={row.id} value={row.id}>{row.name}</option>)}</select></label>}
            <div className="financial-form-grid"><label>Valor<input required type="number" min="0.01" step="0.01" value={form.value} onChange={(event) => change({ value: event.target.value })} /></label><label>Data<input required type="date" value={form.date} onChange={(event) => change({ date: event.target.value })} /></label></div>
          </>}
          <div className="modal-footer"><button type="button" className="secondary" onClick={onClose}>Cancelar</button><button type="submit" className="primary" disabled={saving}><Check size={16} />{saving ? "Salvando…" : "Salvar registro"}</button></div>
        </form>
      </section>
    </div>
  );
}
