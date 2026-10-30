import React from "react";
import { Check, X } from "lucide-react";
import { money, type Row } from "../../lib/app";
import type { FinancialForm, PaymentTarget } from "./financialTypes";

type Props = {
  settlement: PaymentTarget | null;
  form: FinancialForm;
  accounts: Row[];
  saving: boolean;
  onClose: () => void;
  onChange: (patch: Partial<FinancialForm>) => void;
  onSubmit: (event: React.FormEvent) => void;
};

export function SettlementModal({ settlement, form, accounts, saving, onClose, onChange, onSubmit }: Props) {
  if (!settlement) return null;
  return (
    <div className="modal-backdrop" onMouseDown={(event) => event.target === event.currentTarget && onClose()}>
      <section className="modal financial-form-modal" role="dialog" aria-modal="true" aria-labelledby="financial-settlement-title">
        <div className="modal-header">
          <div>
            <p className="eyebrow">BAIXA FINANCEIRA</p>
            <h2 id="financial-settlement-title">{settlement.kind === "receivable" ? "Registrar recebimento" : "Registrar pagamento"}</h2>
            <small>{settlement.description} · Saldo {money(settlement.balance)}</small>
          </div>
          <button className="icon-button" type="button" onClick={onClose} aria-label="Fechar"><X size={19} /></button>
        </div>
        <form onSubmit={onSubmit}>
          <label>Valor recebido/pago<input required type="number" min="0.01" max={settlement.balance} step="0.01" value={form.value} onChange={(event) => onChange({ value: event.target.value })} /></label>
          <label>Conta de destino/origem<select required value={form.accountId} onChange={(event) => onChange({ accountId: event.target.value })}><option value="">Selecione</option>{accounts.map((row) => <option key={row.id} value={row.id}>{row.name} · {row.type === "CASH" ? "Caixa" : row.type === "BANK" ? "Banco" : "Outra"}</option>)}</select></label>
          <div className="financial-form-grid">
            <label>Data do pagamento<input required type="date" value={form.date} onChange={(event) => onChange({ date: event.target.value })} /></label>
            <label>Forma<select value={form.method} onChange={(event) => onChange({ method: event.target.value })}><option value="PIX">Pix</option><option value="DEBIT_CARD">Débito</option><option value="CREDIT_CARD">Crédito</option><option value="CASH">Dinheiro</option><option value="BANK_TRANSFER">Transferência</option><option value="OTHER">Outro</option></select></label>
          </div>
          <div className="modal-footer"><button type="button" className="secondary" onClick={onClose}>Cancelar</button><button type="submit" className="primary" disabled={saving}><Check size={16} />{saving ? "Processando…" : "Confirmar baixa"}</button></div>
        </form>
      </section>
    </div>
  );
}
