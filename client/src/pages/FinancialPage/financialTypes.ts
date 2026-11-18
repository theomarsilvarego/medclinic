export type FormMode = "movement" | "account" | "open-session" | "sale" | "payable";
export type FinancialSplitPayment = { method: string; amount: string; date: string; installments: string };

export type PaymentTarget = {
  kind: "receivable" | "payable";
  id: number;
  description: string;
  balance: number;
  installmentId?: number;
  paymentMethod?: string;
  idempotencyKey?: string;
};

export type FinancialForm = {
  description: string;
  category: string;
  person: string;
  supplierId: string;
  patientId: string;
  professionalId: string;
  value: string;
  discountAmount: string;
  date: string;
  dueDate: string;
  method: string;
  installments: string;
  accountId: string;
  accountType: string;
  openingAmount: string;
  kind: string;
  fromAccountId: string;
  toAccountId: string;
  closingAmount: string;
  idempotencyKey: string;
  paymentBreakdown: FinancialSplitPayment[];
};
