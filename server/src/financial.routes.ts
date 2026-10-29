import { createHash, randomUUID } from "node:crypto";
import { Router, Request, Response, NextFunction } from "express";
import {
  CashSessionStatus,
  FinancialAccountType,
  FinancialMovementType,
  FinancialPaymentMethod,
  FinancialStatus,
  Prisma,
  PrismaClient,
} from "@prisma/client";
import { z } from "zod";

type AuthRequest = Request & { user?: { id: number } };
const dateSchema = z.string().regex(/^\d{4}-\d{2}-\d{2}$/);
const positiveMoney = z.coerce.number().finite().gt(0).max(9_999_999_999);
const paymentMethodSchema = z.nativeEnum(FinancialPaymentMethod);
const accountSchema = z.object({
  name: z.string().trim().min(2).max(120),
  type: z.nativeEnum(FinancialAccountType),
  openingBalance: z.coerce.number().finite().min(0).default(0),
});
const payableSchema = z.object({
  description: z.string().trim().min(2).max(255),
  category: z.string().trim().min(2).max(100),
  supplierId: z.coerce.number().int().positive(),
  amount: positiveMoney,
  dueDate: dateSchema,
  idempotencyKey: z.string().trim().min(8).max(100).optional(),
});
const saleSchema = z.object({
  serviceDescription: z.string().trim().min(2).max(255),
  patientId: z.coerce.number().int().positive(),
  professionalId: z.coerce.number().int().positive(),
  saleDate: dateSchema,
  dueDate: dateSchema,
  amount: positiveMoney,
  discountAmount: z.coerce.number().finite().min(0).default(0),
  installments: z.coerce.number().int().min(1).max(12).default(1),
  paymentMethod: paymentMethodSchema.optional(),
  idempotencyKey: z.string().trim().min(8).max(100).optional(),
});
const paymentSchema = z.object({
  amount: positiveMoney,
  accountId: z.coerce.number().int().positive(),
  paymentDate: dateSchema,
  method: paymentMethodSchema,
  installmentId: z.coerce.number().int().positive().optional(),
  idempotencyKey: z.string().trim().min(8).max(100).optional(),
});
const reversalSchema = z.object({
  paymentId: z.coerce.number().int().positive(),
  amount: positiveMoney,
  reason: z.string().trim().min(3).max(500),
  idempotencyKey: z.string().trim().min(8).max(100).optional(),
});
const movementSchema = z.discriminatedUnion("kind", [
  z.object({
    kind: z.enum(["SUPRIMENTO", "SANGRIA", "AJUSTE_ENTRADA", "AJUSTE_SAIDA"]),
    accountId: z.coerce.number().int().positive(),
    amount: positiveMoney,
    movementDate: dateSchema,
    description: z.string().trim().min(3).max(255),
    idempotencyKey: z.string().trim().min(8).max(120).optional(),
  }),
  z.object({
    kind: z.literal("TRANSFERENCIA"),
    fromAccountId: z.coerce.number().int().positive(),
    toAccountId: z.coerce.number().int().positive(),
    amount: positiveMoney,
    movementDate: dateSchema,
    description: z.string().trim().min(3).max(255),
    idempotencyKey: z.string().trim().min(8).max(120).optional(),
  }),
]);
const openSessionSchema = z.object({
  accountId: z.coerce.number().int().positive(),
  openingAmount: z.coerce.number().finite().min(0).max(9_999_999_999),
  openedAt: z.string().datetime().optional(),
});
const closeSessionSchema = z.object({
  closingAmount: z.coerce.number().finite().min(0).max(9_999_999_999),
  closedAt: z.string().datetime().optional(),
});

const dateValue = (value: string) => new Date(`${value}T00:00:00.000Z`);
const cents = (value: number | Prisma.Decimal | string) => Math.round(Number(value) * 100);
const decimal = (valueInCents: number) => new Prisma.Decimal(valueInCents).div(100);
const asMoney = (value: number | Prisma.Decimal | string) => Number(value);
const netPaid = (amount: number | Prisma.Decimal, reversed: number | Prisma.Decimal) => cents(amount) - cents(reversed);
const inflowMovementTypes: FinancialMovementType[] = [
  FinancialMovementType.ENTRADA,
  FinancialMovementType.TRANSFERENCIA_ENTRADA,
  FinancialMovementType.SUPRIMENTO,
  FinancialMovementType.ABERTURA,
  FinancialMovementType.AJUSTE_ENTRADA,
  FinancialMovementType.ESTORNO_ENTRADA,
];
const isAccountInflow = (type: FinancialMovementType) => inflowMovementTypes.includes(type);
const isRevenue = (type: FinancialMovementType) => type === FinancialMovementType.ENTRADA || type === FinancialMovementType.ESTORNO_ENTRADA;
const isExpense = (type: FinancialMovementType) => type === FinancialMovementType.SAIDA || type === FinancialMovementType.ESTORNO_SAIDA;

function validatedDate(value: string) {
  const date = dateValue(value);
  return Number.isNaN(date.getTime()) || date.toISOString().slice(0, 10) !== value ? null : date;
}

function asyncRoute(handler: (req: AuthRequest, res: Response) => Promise<unknown>) {
  return (req: Request, res: Response, next: NextFunction) => {
    void handler(req as AuthRequest, res).catch(next);
  };
}

function statusFor(totalCents: number, paidCents: number): FinancialStatus {
  if (paidCents >= totalCents) return FinancialStatus.PAID;
  if (paidCents > 0) return FinancialStatus.PARTIAL;
  return FinancialStatus.PENDING;
}

async function requireOpenCashSession(tx: Prisma.TransactionClient, accountId: number) {
  const account = await tx.financialAccount.findUnique({ where: { id: accountId }, select: { id: true, type: true, active: true, openingBalance: true } });
  if (!account || !account.active) throw Object.assign(new Error("Conta financeira não encontrada ou inativa."), { status: 404 });
  if (account.type === FinancialAccountType.CASH) {
    const session = await tx.cashSession.findFirst({ where: { accountId, status: CashSessionStatus.ABERTA } });
    if (!session) throw Object.assign(new Error("Abra o caixa físico antes de registrar esta movimentação."), { status: 409 });
  }
  return account;
}

async function assertSufficientCash(tx: Prisma.TransactionClient, account: { id: number; type: FinancialAccountType; openingBalance: Prisma.Decimal }, amountCents: number) {
  if (account.type !== FinancialAccountType.CASH) return;
  const movements = await tx.financialMovement.findMany({ where: { accountId: account.id }, select: { type: true, amount: true } });
  const balanceCents = cents(account.openingBalance) + movements.reduce((sum, movement) => sum + (isAccountInflow(movement.type) ? cents(movement.amount) : -cents(movement.amount)), 0);
  if (amountCents > balanceCents) throw Object.assign(new Error("O valor excede o saldo disponível no caixa físico."), { status: 409 });
}

export function createFinancialRouter(prisma: PrismaClient) {
  const router = Router();

  router.get("/summary", asyncRoute(async (req, res) => {
    const days = Math.min(365, Math.max(1, Number(req.query.days || 30)));
    const from = new Date(Date.now() - days * 86_400_000);
    const [accounts, movements, sales, receivables, payables] = await Promise.all([
      prisma.financialAccount.findMany({ where: { active: true }, include: { movements: { select: { type: true, amount: true } } }, orderBy: { id: "asc" } }),
      prisma.financialMovement.findMany({ where: { movementDate: { gte: new Date(from.toISOString().slice(0, 10) + "T00:00:00.000Z") } }, select: { type: true, amount: true } }),
      prisma.financialSale.aggregate({ where: { saleDate: { gte: new Date(from.toISOString().slice(0, 10) + "T00:00:00.000Z") }, status: { not: FinancialStatus.CANCELED } }, _sum: { totalAmount: true } }),
      prisma.financialReceivable.findMany({ where: { status: { not: FinancialStatus.CANCELED } }, select: { totalAmount: true, paidAmount: true } }),
      prisma.financialPayable.findMany({ where: { status: { not: FinancialStatus.CANCELED } }, select: { amount: true, paidAmount: true } }),
    ]);
    const accountBalances = accounts.map(({ movements: rows, ...account }) => ({
      id: account.id,
      name: account.name,
      type: account.type,
      balance: Number(account.openingBalance) + rows.reduce((sum, item) => sum + (isAccountInflow(item.type) ? Number(item.amount) : -Number(item.amount)), 0),
    }));
    const revenue = movements.filter((item) => isRevenue(item.type)).reduce((sum, item) => sum + Number(item.amount), 0);
    const expenses = movements.filter((item) => isExpense(item.type)).reduce((sum, item) => sum + Number(item.amount), 0);
    res.json({
      periodDays: days,
      salesTotal: Number(sales._sum.totalAmount || 0),
      cashIn: revenue,
      cashOut: expenses,
      netCashFlow: revenue - expenses,
      receivablesOutstanding: receivables.reduce((sum, item) => sum + Math.max(0, Number(item.totalAmount) - Number(item.paidAmount)), 0),
      payablesOutstanding: payables.reduce((sum, item) => sum + Math.max(0, Number(item.amount) - Number(item.paidAmount)), 0),
      receivablesOpenCount: receivables.filter((item) => Number(item.totalAmount) > Number(item.paidAmount)).length,
      payablesOpenCount: payables.filter((item) => Number(item.amount) > Number(item.paidAmount)).length,
      accounts: accountBalances,
    });
  }));

  router.get("/accounts", asyncRoute(async (_req, res) => {
    const accounts = await prisma.financialAccount.findMany({ where: { active: true }, orderBy: [{ type: "asc" }, { name: "asc" }] });
    const balances = await Promise.all(accounts.map(async (account) => {
      const movements = await prisma.financialMovement.findMany({ where: { accountId: account.id }, select: { type: true, amount: true } });
      const balance = Number(account.openingBalance) + movements.reduce((sum, item) => sum + (isAccountInflow(item.type) ? Number(item.amount) : -Number(item.amount)), 0);
      return { ...account, balance };
    }));
    res.json(balances);
  }));

  router.post("/accounts", asyncRoute(async (req, res) => {
    const parsed = accountSchema.safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Informe nome, tipo e saldo inicial válidos." });
    if (parsed.data.type === FinancialAccountType.CASH && parsed.data.openingBalance > 0)
      return res.status(400).json({ message: "O saldo inicial do caixa físico deve ser informado ao abrir a sessão de caixa." });
    const created = await prisma.$transaction(async (tx) => {
      const account = await tx.financialAccount.create({ data: { name: parsed.data.name, type: parsed.data.type, openingBalance: decimal(0) } });
      if (parsed.data.type !== FinancialAccountType.CASH && parsed.data.openingBalance > 0) {
        await tx.financialMovement.create({ data: {
          accountId: account.id, type: FinancialMovementType.ABERTURA, amount: decimal(cents(parsed.data.openingBalance)),
          movementDate: new Date(new Date().toISOString().slice(0, 10) + "T00:00:00.000Z"), description: "Saldo inicial da conta",
          originType: "CONTA_ABERTURA", originId: account.id, idempotencyKey: `account-opening:${account.id}`, createdById: (req as AuthRequest).user!.id,
        } });
      }
      return account;
    });
    res.status(201).json(created);
  }));

  router.get("/sales", asyncRoute(async (req, res) => {
    const from = typeof req.query.from === "string" && validatedDate(req.query.from) ? dateValue(req.query.from) : undefined;
    const to = typeof req.query.to === "string" && validatedDate(req.query.to) ? dateValue(req.query.to) : undefined;
    const where: Prisma.FinancialSaleWhereInput = {
      ...(from || to ? { saleDate: { ...(from ? { gte: from } : {}), ...(to ? { lte: to } : {}) } } : {}),
      ...(typeof req.query.status === "string" && Object.values(FinancialStatus).includes(req.query.status as FinancialStatus) ? { status: req.query.status as FinancialStatus } : {}),
    };
    res.json(await prisma.financialSale.findMany({ where, include: { patient: { select: { id: true, fullName: true } }, professional: { select: { id: true, fullName: true } }, items: true, receivable: { select: { id: true, totalAmount: true, paidAmount: true, status: true } } }, orderBy: [{ saleDate: "desc" }, { id: "desc" }], take: 500 }));
  }));

  router.post("/sales", asyncRoute(async (req, res) => {
    const parsed = saleSchema.safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Preencha serviço, paciente, profissional, valor e datas." });
    const saleDate = validatedDate(parsed.data.saleDate);
    const dueDate = validatedDate(parsed.data.dueDate);
    const grossCents = cents(parsed.data.amount);
    const discountCents = cents(parsed.data.discountAmount);
    if (!saleDate || !dueDate) return res.status(400).json({ message: "Informe datas válidas para a venda e o vencimento." });
    if (discountCents > grossCents) return res.status(400).json({ message: "O desconto não pode superar o valor da venda." });
    const totalCents = grossCents - discountCents;
    if (totalCents <= 0) return res.status(400).json({ message: "O total da venda após o desconto deve ser maior que zero." });
    try {
      const sale = await prisma.$transaction(async (tx) => {
        const [patient, doctor] = await Promise.all([
          tx.patient.findUnique({ where: { id: parsed.data.patientId }, select: { id: true } }),
          tx.doctor.findUnique({ where: { id: parsed.data.professionalId }, select: { fullName: true } }),
        ]);
        if (!patient || !doctor) throw Object.assign(new Error("Paciente ou profissional não encontrado."), { status: 404 });
        const saleKey = parsed.data.idempotencyKey || randomUUID();
        return tx.financialSale.create({ data: {
          code: `VEN-${Date.now().toString(36).toUpperCase()}-${randomUUID().replace(/-/g, "").slice(0, 8).toUpperCase()}`,
          serviceDescription: parsed.data.serviceDescription, patientId: patient.id,
          professionalId: parsed.data.professionalId, professionalName: doctor.fullName, saleDate,
          grossAmount: decimal(grossCents), discountAmount: decimal(discountCents), totalAmount: decimal(totalCents),
          status: FinancialStatus.PENDING, idempotencyKey: `manual-sale:${saleKey}`, createdById: (req as AuthRequest).user!.id,
          items: { create: [{ sourceType: "MANUAL", description: parsed.data.serviceDescription, amount: decimal(totalCents) }] },
          receivable: { create: {
            totalAmount: decimal(totalCents), dueDate, installmentCount: parsed.data.installments,
            preferredPaymentMethod: parsed.data.paymentMethod, status: FinancialStatus.PENDING,
            installments: { create: Array.from({ length: parsed.data.installments }, (_, index) => {
              const dueMonth = new Date(Date.UTC(dueDate.getUTCFullYear(), dueDate.getUTCMonth() + index, 1));
              const day = Math.min(dueDate.getUTCDate(), new Date(Date.UTC(dueMonth.getUTCFullYear(), dueMonth.getUTCMonth() + 1, 0)).getUTCDate());
              const baseCents = Math.floor(totalCents / parsed.data.installments);
              return { number: index + 1, dueDate: new Date(Date.UTC(dueMonth.getUTCFullYear(), dueMonth.getUTCMonth(), day)), amount: decimal(baseCents + (index < totalCents % parsed.data.installments ? 1 : 0)) };
            }) },
          } },
        }, include: { patient: { select: { fullName: true } }, professional: { select: { fullName: true } }, receivable: true } });
      }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
      res.status(201).json(sale);
    } catch (error: any) {
      if (error?.code === "P2002") return res.status(409).json({ message: "Esta venda já foi registrada." });
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.get("/receivables", asyncRoute(async (_req, res) => {
    res.json(await prisma.financialReceivable.findMany({ include: { sale: { include: { patient: { select: { id: true, fullName: true } }, professional: { select: { fullName: true } }, items: true } }, installments: { orderBy: { number: "asc" } }, payments: { include: { account: { select: { name: true } }, movement: true }, orderBy: { createdAt: "desc" } } }, orderBy: [{ dueDate: "asc" }, { id: "desc" }], take: 500 }));
  }));

  router.get("/payables", asyncRoute(async (_req, res) => {
    res.json(await prisma.financialPayable.findMany({ include: { supplier: { select: { id: true, name: true, legalName: true } }, payments: { include: { account: { select: { name: true } }, movement: true }, orderBy: { createdAt: "desc" } } }, orderBy: [{ dueDate: "asc" }, { id: "desc" }], take: 500 }));
  }));

  router.post("/payables", asyncRoute(async (req, res) => {
    const parsed = payableSchema.safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Informe descrição, categoria, fornecedor, valor e vencimento válidos." });
    const dueDate = validatedDate(parsed.data.dueDate);
    if (!dueDate) return res.status(400).json({ message: "Informe uma data de vencimento válida." });
    const created = await prisma.financialPayable.create({ data: {
      description: parsed.data.description, category: parsed.data.category, supplierId: parsed.data.supplierId,
      amount: decimal(cents(parsed.data.amount)), dueDate, idempotencyKey: parsed.data.idempotencyKey || randomUUID(), createdById: (req as AuthRequest).user!.id,
    }, include: { supplier: { select: { id: true, name: true, legalName: true } } } });
    res.status(201).json(created);
  }));

  router.post("/receivables/:id/payments", asyncRoute(async (req, res) => {
    const id = Number(req.params.id);
    if (!Number.isInteger(id) || id < 1) return res.status(400).json({ message: "Conta a receber inválida." });
    const parsed = paymentSchema.safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Informe valor, conta, data e forma de pagamento válidos." });
    const paymentDate = validatedDate(parsed.data.paymentDate);
    if (!paymentDate) return res.status(400).json({ message: "Informe uma data de pagamento válida." });
    const key = parsed.data.idempotencyKey || randomUUID();
    try {
      const payment = await prisma.$transaction(async (tx) => {
        const receivable = await tx.financialReceivable.findUnique({ where: { id }, include: { installments: true, sale: true } });
        if (!receivable || receivable.status === FinancialStatus.CANCELED) throw Object.assign(new Error("Conta a receber não encontrada ou cancelada."), { status: 404 });
        const account = await requireOpenCashSession(tx, parsed.data.accountId);
        const amountCents = cents(parsed.data.amount);
        const outstandingCents = cents(receivable.totalAmount) - cents(receivable.paidAmount);
        if (amountCents > outstandingCents) throw Object.assign(new Error("O recebimento excede o saldo pendente."), { status: 409 });
        let installment = null;
        if (parsed.data.installmentId) {
          installment = receivable.installments.find((item) => item.id === parsed.data.installmentId) || null;
          if (!installment) throw Object.assign(new Error("Parcela não pertence a esta conta a receber."), { status: 400 });
          if (amountCents > cents(installment.amount) - cents(installment.paidAmount)) throw Object.assign(new Error("O recebimento excede o saldo da parcela."), { status: 409 });
        }
        const created = await tx.financialReceivablePayment.create({ data: {
          receivableId: id, installmentId: installment?.id, accountId: account.id, amount: decimal(amountCents), paymentDate,
          method: parsed.data.method, idempotencyKey: key, createdById: (req as AuthRequest).user!.id,
        } });
        await tx.financialMovement.create({ data: {
          accountId: account.id, type: FinancialMovementType.ENTRADA, amount: decimal(amountCents), movementDate: paymentDate,
          description: `Recebimento da venda ${receivable.sale.code}`, originType: "RECEBIMENTO_VENDA", originId: receivable.saleId,
          idempotencyKey: `receivable-payment:${key}`, receivablePaymentId: created.id, createdById: (req as AuthRequest).user!.id,
        } });
        const newPaid = cents(receivable.paidAmount) + amountCents;
        await tx.financialReceivable.update({ where: { id }, data: { paidAmount: decimal(newPaid), status: statusFor(cents(receivable.totalAmount), newPaid) } });
        await tx.financialSale.update({ where: { id: receivable.saleId }, data: { status: statusFor(cents(receivable.totalAmount), newPaid) } });
        let unallocatedCents = amountCents;
        const allocationRows: { paymentId: number; installmentId: number; amount: Prisma.Decimal }[] = [];
        const allocationTargets = installment ? [installment] : [...receivable.installments].sort((a, b) => a.number - b.number);
        for (const target of allocationTargets) {
          if (unallocatedCents <= 0) break;
          const installmentBalance = cents(target.amount) - cents(target.paidAmount);
          const allocatedCents = Math.min(unallocatedCents, installmentBalance);
          if (allocatedCents <= 0) continue;
          const installmentPaid = cents(target.paidAmount) + allocatedCents;
          await tx.financialReceivableInstallment.update({ where: { id: target.id }, data: { paidAmount: decimal(installmentPaid), status: statusFor(cents(target.amount), installmentPaid) } });
          allocationRows.push({ paymentId: created.id, installmentId: target.id, amount: decimal(allocatedCents) });
          unallocatedCents -= allocatedCents;
        }
        if (unallocatedCents > 0) throw Object.assign(new Error("Não foi possível distribuir o pagamento entre as parcelas."), { status: 409 });
        if (allocationRows.length) await tx.financialReceivableAllocation.createMany({ data: allocationRows });
        return created;
      }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
      res.status(201).json(payment);
    } catch (error: any) {
      if (error?.code === "P2002") return res.status(409).json({ message: "Este pagamento já foi registrado." });
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.post("/payables/:id/payments", asyncRoute(async (req, res) => {
    const id = Number(req.params.id);
    if (!Number.isInteger(id) || id < 1) return res.status(400).json({ message: "Conta a pagar inválida." });
    const parsed = paymentSchema.omit({ installmentId: true }).safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Informe valor, conta, data e forma de pagamento válidos." });
    const paymentDate = validatedDate(parsed.data.paymentDate);
    if (!paymentDate) return res.status(400).json({ message: "Informe uma data de pagamento válida." });
    const key = parsed.data.idempotencyKey || randomUUID();
    try {
      const payment = await prisma.$transaction(async (tx) => {
        const payable = await tx.financialPayable.findUnique({ where: { id } });
        if (!payable || payable.status === FinancialStatus.CANCELED) throw Object.assign(new Error("Conta a pagar não encontrada ou cancelada."), { status: 404 });
        const account = await requireOpenCashSession(tx, parsed.data.accountId);
        const amountCents = cents(parsed.data.amount);
        await assertSufficientCash(tx, account, amountCents);
        const outstandingCents = cents(payable.amount) - cents(payable.paidAmount);
        if (amountCents > outstandingCents) throw Object.assign(new Error("O pagamento excede o saldo pendente."), { status: 409 });
        const created = await tx.financialPayablePayment.create({ data: {
          payableId: id, accountId: account.id, amount: decimal(amountCents), paymentDate, method: parsed.data.method,
          idempotencyKey: key, createdById: (req as AuthRequest).user!.id,
        } });
        await tx.financialMovement.create({ data: {
          accountId: account.id, type: FinancialMovementType.SAIDA, amount: decimal(amountCents), movementDate: paymentDate,
          description: `Pagamento: ${payable.description}`, originType: "PAGAMENTO_DESPESA", originId: id,
          idempotencyKey: `payable-payment:${key}`, payablePaymentId: created.id, createdById: (req as AuthRequest).user!.id,
        } });
        const newPaid = cents(payable.paidAmount) + amountCents;
        await tx.financialPayable.update({ where: { id }, data: { paidAmount: decimal(newPaid), status: statusFor(cents(payable.amount), newPaid) } });
        return created;
      }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
      res.status(201).json(payment);
    } catch (error: any) {
      if (error?.code === "P2002") return res.status(409).json({ message: "Este pagamento já foi registrado." });
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.post("/receivables/:id/reversals", asyncRoute(async (req, res) => {
    const id = Number(req.params.id);
    const parsed = reversalSchema.safeParse(req.body);
    if (!Number.isInteger(id) || id < 1 || !parsed.success) return res.status(400).json({ message: "Informe a conta, pagamento, valor e motivo do estorno." });
    const key = parsed.data.idempotencyKey || randomUUID();
    try {
      const reversal = await prisma.$transaction(async (tx) => {
        const payment = await tx.financialReceivablePayment.findFirst({ where: { id: parsed.data.paymentId, receivableId: id }, include: { movement: true, allocations: { include: { installment: true }, orderBy: { installmentId: "desc" } } } });
        const receivable = await tx.financialReceivable.findUnique({ where: { id }, include: { sale: true } });
        if (!payment || !payment.movement || !receivable) throw Object.assign(new Error("Pagamento da conta a receber não encontrado."), { status: 404 });
        const remaining = netPaid(payment.amount, payment.reversedAmount);
        const reversalCents = cents(parsed.data.amount);
        if (reversalCents > remaining) throw Object.assign(new Error("O estorno excede o saldo do pagamento original."), { status: 409 });
        const account = await requireOpenCashSession(tx, payment.accountId);
        await assertSufficientCash(tx, account, reversalCents);
        const created = await tx.financialMovement.create({ data: {
          accountId: account.id, type: FinancialMovementType.ESTORNO_SAIDA, amount: decimal(reversalCents), movementDate: new Date(),
          description: `Estorno de recebimento: ${parsed.data.reason}`, originType: "ESTORNO_RECEBIMENTO", originId: payment.id,
          idempotencyKey: `receivable-reversal:${key}`, reversalOfId: payment.movement.id, createdById: (req as AuthRequest).user!.id,
        } });
        await tx.financialReceivablePayment.update({ where: { id: payment.id }, data: { reversedAmount: decimal(cents(payment.reversedAmount) + reversalCents) } });
        const paid = cents(receivable.paidAmount) - reversalCents;
        await tx.financialReceivable.update({ where: { id }, data: { paidAmount: decimal(paid), status: statusFor(cents(receivable.totalAmount), paid) } });
        await tx.financialSale.update({ where: { id: receivable.saleId }, data: { status: statusFor(cents(receivable.totalAmount), paid) } });
        let remainingReversal = reversalCents;
        for (const allocation of payment.allocations) {
          if (remainingReversal <= 0) break;
          const allocationBalance = cents(allocation.amount) - cents(allocation.reversedAmount);
          const reversed = Math.min(remainingReversal, allocationBalance);
          if (reversed <= 0) continue;
          const installmentPaid = cents(allocation.installment.paidAmount) - reversed;
          await tx.financialReceivableAllocation.update({ where: { id: allocation.id }, data: { reversedAmount: decimal(cents(allocation.reversedAmount) + reversed) } });
          await tx.financialReceivableInstallment.update({ where: { id: allocation.installmentId }, data: { paidAmount: decimal(installmentPaid), status: statusFor(cents(allocation.installment.amount), installmentPaid) } });
          remainingReversal -= reversed;
        }
        if (remainingReversal > 0) throw Object.assign(new Error("Não foi possível reverter a alocação original do pagamento."), { status: 409 });
        return created;
      }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
      res.status(201).json(reversal);
    } catch (error: any) {
      if (error?.code === "P2002") return res.status(409).json({ message: "Este estorno já foi registrado." });
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.post("/payables/:id/reversals", asyncRoute(async (req, res) => {
    const id = Number(req.params.id);
    const parsed = reversalSchema.safeParse(req.body);
    if (!Number.isInteger(id) || id < 1 || !parsed.success) return res.status(400).json({ message: "Informe a conta, pagamento, valor e motivo do estorno." });
    const key = parsed.data.idempotencyKey || randomUUID();
    try {
      const reversal = await prisma.$transaction(async (tx) => {
        const payment = await tx.financialPayablePayment.findFirst({ where: { id: parsed.data.paymentId, payableId: id }, include: { movement: true } });
        const payable = await tx.financialPayable.findUnique({ where: { id } });
        if (!payment || !payment.movement || !payable) throw Object.assign(new Error("Pagamento da conta a pagar não encontrado."), { status: 404 });
        const amountCents = cents(parsed.data.amount);
        if (amountCents > netPaid(payment.amount, payment.reversedAmount)) throw Object.assign(new Error("O estorno excede o saldo do pagamento original."), { status: 409 });
        const account = await requireOpenCashSession(tx, payment.accountId);
        const created = await tx.financialMovement.create({ data: {
          accountId: account.id, type: FinancialMovementType.ESTORNO_ENTRADA, amount: decimal(amountCents), movementDate: new Date(),
          description: `Estorno de pagamento: ${parsed.data.reason}`, originType: "ESTORNO_PAGAMENTO_DESPESA", originId: payment.id,
          idempotencyKey: `payable-reversal:${key}`, reversalOfId: payment.movement.id, createdById: (req as AuthRequest).user!.id,
        } });
        await tx.financialPayablePayment.update({ where: { id: payment.id }, data: { reversedAmount: decimal(cents(payment.reversedAmount) + amountCents) } });
        const paid = cents(payable.paidAmount) - amountCents;
        await tx.financialPayable.update({ where: { id }, data: { paidAmount: decimal(paid), status: statusFor(cents(payable.amount), paid) } });
        return created;
      }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
      res.status(201).json(reversal);
    } catch (error: any) {
      if (error?.code === "P2002") return res.status(409).json({ message: "Este estorno já foi registrado." });
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.post("/payables/:id/cancel", asyncRoute(async (req, res) => {
    const id = Number(req.params.id);
    const reason = z.string().trim().min(3).max(500).safeParse(req.body?.reason);
    if (!Number.isInteger(id) || id < 1 || !reason.success) return res.status(400).json({ message: "Informe um motivo válido para o cancelamento." });
    const result = await prisma.$transaction(async (tx) => {
      const payable = await tx.financialPayable.findUnique({ where: { id } });
      if (!payable) throw Object.assign(new Error("Conta a pagar não encontrada."), { status: 404 });
      if (cents(payable.paidAmount) > 0) throw Object.assign(new Error("Estorne os pagamentos registrados antes de cancelar a obrigação."), { status: 409 });
      return tx.financialPayable.update({ where: { id }, data: { status: FinancialStatus.CANCELED, canceledAt: new Date(), cancellationReason: reason.data } });
    });
    res.json(result);
  }));

  router.post("/sales/:id/cancel", asyncRoute(async (req, res) => {
    const id = Number(req.params.id);
    const reason = z.string().trim().min(3).max(500).safeParse(req.body?.reason);
    if (!Number.isInteger(id) || id < 1 || !reason.success) return res.status(400).json({ message: "Informe um motivo válido para o cancelamento." });
    try {
      const result = await prisma.$transaction(async (tx) => {
        const sale = await tx.financialSale.findUnique({ where: { id }, include: { receivable: true } });
        if (!sale || !sale.receivable) throw Object.assign(new Error("Venda/conta a receber não encontrada."), { status: 404 });
        if (cents(sale.receivable.paidAmount) > 0) throw Object.assign(new Error("Estorne os recebimentos registrados antes de cancelar a venda."), { status: 409 });
        await tx.financialReceivable.update({ where: { id: sale.receivable.id }, data: { status: FinancialStatus.CANCELED } });
        return tx.financialSale.update({ where: { id }, data: { status: FinancialStatus.CANCELED, canceledAt: new Date(), cancellationReason: reason.data } });
      }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
      res.json(result);
    } catch (error: any) {
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.get("/movements", asyncRoute(async (req, res) => {
    const accountId = Number(req.query.accountId);
    res.json(await prisma.financialMovement.findMany({ where: Number.isInteger(accountId) && accountId > 0 ? { accountId } : {}, include: { account: { select: { id: true, name: true, type: true } } }, orderBy: [{ movementDate: "desc" }, { id: "desc" }], take: 1000 }));
  }));

  router.post("/movements", asyncRoute(async (req, res) => {
    const parsed = movementSchema.safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Informe os dados válidos da movimentação." });
    const movementDate = validatedDate(parsed.data.movementDate);
    if (!movementDate) return res.status(400).json({ message: "Informe uma data válida." });
    const key = parsed.data.idempotencyKey || randomUUID();
    try {
      const result = await prisma.$transaction(async (tx) => {
        if (parsed.data.kind === "TRANSFERENCIA") {
          if (parsed.data.fromAccountId === parsed.data.toAccountId) throw Object.assign(new Error("A conta de origem e destino devem ser diferentes."), { status: 400 });
          const from = await requireOpenCashSession(tx, parsed.data.fromAccountId);
          const to = await requireOpenCashSession(tx, parsed.data.toAccountId);
          if (cents(parsed.data.amount) > cents(from.openingBalance) + (await tx.financialMovement.findMany({ where: { accountId: from.id }, select: { type: true, amount: true } })).reduce((sum, row) => sum + (isAccountInflow(row.type) ? cents(row.amount) : -cents(row.amount)), 0)) throw Object.assign(new Error("Saldo insuficiente para a transferência."), { status: 409 });
          const transferGroupId = randomUUID();
          const amount = decimal(cents(parsed.data.amount));
          const out = await tx.financialMovement.create({ data: { accountId: from.id, type: FinancialMovementType.TRANSFERENCIA_SAIDA, amount, movementDate, description: parsed.data.description, originType: "TRANSFERENCIA", transferGroupId, idempotencyKey: `transfer-out:${key}`, createdById: (req as AuthRequest).user!.id } });
          await tx.financialMovement.create({ data: { accountId: to.id, type: FinancialMovementType.TRANSFERENCIA_ENTRADA, amount, movementDate, description: parsed.data.description, originType: "TRANSFERENCIA", transferGroupId, idempotencyKey: `transfer-in:${key}`, createdById: (req as AuthRequest).user!.id } });
          return out;
        }
        const account = await requireOpenCashSession(tx, parsed.data.accountId);
        const type = parsed.data.kind as FinancialMovementType;
        if (type === FinancialMovementType.SANGRIA || type === FinancialMovementType.AJUSTE_SAIDA)
          await assertSufficientCash(tx, account, cents(parsed.data.amount));
        const created = await tx.financialMovement.create({ data: {
          accountId: account.id, type, amount: decimal(cents(parsed.data.amount)), movementDate,
          description: parsed.data.description, originType: "MOVIMENTO_MANUAL", originId: null,
          idempotencyKey: `manual:${key}`, createdById: (req as AuthRequest).user!.id,
        } });
        return created;
      }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
      res.status(201).json(result);
    } catch (error: any) {
      if (error?.code === "P2002") return res.status(409).json({ message: "Esta movimentação já foi registrada." });
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.get("/cash-sessions", asyncRoute(async (req, res) => {
    const accountId = Number(req.query.accountId);
    const where = Number.isInteger(accountId) && accountId > 0 ? { accountId } : {};
    res.json(await prisma.cashSession.findMany({ where, include: { account: { select: { id: true, name: true, type: true } } }, orderBy: [{ openedAt: "desc" }, { id: "desc" }], take: 100 }));
  }));

  router.post("/cash-sessions/open", asyncRoute(async (req, res) => {
    const parsed = openSessionSchema.safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Informe a conta de caixa e o valor de abertura." });
    try {
      const session = await prisma.$transaction(async (tx) => {
        const account = await tx.financialAccount.findUnique({ where: { id: parsed.data.accountId } });
        if (!account || !account.active || account.type !== FinancialAccountType.CASH) throw Object.assign(new Error("Selecione uma conta física ativa."), { status: 400 });
        const openedAt = parsed.data.openedAt ? new Date(parsed.data.openedAt) : new Date();
        const created = await tx.cashSession.create({ data: { accountId: account.id, openingAmount: decimal(cents(parsed.data.openingAmount)), openedAt, openSessionKey: `OPEN:${account.id}`, openedById: (req as AuthRequest).user!.id } });
        const [priorSessions, priorMovements] = await Promise.all([
          tx.cashSession.count({ where: { accountId: account.id, status: CashSessionStatus.FECHADA } }),
          tx.financialMovement.count({ where: { accountId: account.id } }),
        ]);
        if (parsed.data.openingAmount > 0 && priorSessions === 0 && priorMovements === 0) await tx.financialMovement.create({ data: {
          accountId: account.id, type: FinancialMovementType.ABERTURA, amount: decimal(cents(parsed.data.openingAmount)), movementDate: new Date(openedAt.toISOString().slice(0, 10) + "T00:00:00.000Z"),
          description: "Abertura de caixa", originType: "ABERTURA_CAIXA", originId: created.id, idempotencyKey: `cash-open:${created.id}`, createdById: (req as AuthRequest).user!.id,
        } });
        return created;
      });
      res.status(201).json(session);
    } catch (error: any) {
      if (error?.code === "P2002") return res.status(409).json({ message: "Já existe uma sessão de caixa aberta para esta conta." });
      if (error?.status) return res.status(error.status).json({ message: error.message });
      throw error;
    }
  }));

  router.post("/cash-sessions/:id/close", asyncRoute(async (req, res) => {
    const id = Number(req.params.id);
    const parsed = closeSessionSchema.safeParse(req.body);
    if (!Number.isInteger(id) || id < 1 || !parsed.success) return res.status(400).json({ message: "Informe o valor contado para fechar o caixa." });
    const result = await prisma.$transaction(async (tx) => {
      const session = await tx.cashSession.findUnique({ where: { id } });
      if (!session || session.status !== CashSessionStatus.ABERTA) throw Object.assign(new Error("Sessão de caixa não encontrada ou já fechada."), { status: 409 });
      const movements = await tx.financialMovement.findMany({ where: { accountId: session.accountId, createdAt: { gte: session.openedAt } }, select: { type: true, amount: true } });
      const expectedCents = cents(session.openingAmount) + movements.reduce((sum, item) => item.type === FinancialMovementType.ABERTURA ? sum : sum + (isAccountInflow(item.type) ? cents(item.amount) : -cents(item.amount)), 0);
      const counted = cents(parsed.data.closingAmount);
      return tx.cashSession.update({ where: { id }, data: {
        status: CashSessionStatus.FECHADA, closingAmount: decimal(counted), expectedClosingAmount: decimal(expectedCents), difference: decimal(counted - expectedCents),
        closedAt: parsed.data.closedAt ? new Date(parsed.data.closedAt) : new Date(), openSessionKey: null, closedById: (req as AuthRequest).user!.id,
      } });
    });
    res.json(result);
  }));

  return router;
}


type BillingKind = "EXAME" | "ULTRASSOM" | "INJETAVEL" | "PROCEDIMENTO";
type BillingSelection = { kind: BillingKind; id: number };

export async function createSalesFromRequests(
  prisma: PrismaClient,
  userId: number,
  selections: BillingSelection[],
  paymentMethod: FinancialPaymentMethod | undefined,
  discountPercent: number,
  installments: number,
  saleDate: Date,
) {
  const grouped = new Map<BillingKind, number[]>();
  selections.forEach(({ kind, id }) => {
    const ids = grouped.get(kind) || [];
    if (!ids.includes(id)) ids.push(id);
    grouped.set(kind, ids);
  });
  const requestCount = [...grouped.values()].reduce((sum, ids) => sum + ids.length, 0);
  const toCents = (value: number | Prisma.Decimal | string) => Math.round(Number(value) * 100);
  const fromCents = (value: number) => new Prisma.Decimal(value).div(100);
  const normalizeName = (value: string) => value.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLocaleLowerCase("pt-BR").replace(/[^a-z0-9]+/g, " ").trim();
  return prisma.$transaction(async (tx) => {
    const [exams, ultrasounds, injectables, procedures, imagingProcedures] = await Promise.all([
      grouped.has("EXAME") ? tx.examRequest.findMany({ where: { id: { in: grouped.get("EXAME") }, billingStatus: "A_FATURAR" }, include: { medicalRecord: { include: { appointment: { include: { patient: true, doctor: true } } } }, examGroup: { include: { items: { include: { examType: true } } } } } }) : [],
      grouped.has("ULTRASSOM") ? tx.ultrasoundRequest.findMany({ where: { id: { in: grouped.get("ULTRASSOM") }, billingStatus: "A_FATURAR" }, include: { medicalRecord: { include: { appointment: { include: { patient: true, doctor: true } } } } } }) : [],
      grouped.has("INJETAVEL") ? tx.injectableRequest.findMany({ where: { id: { in: grouped.get("INJETAVEL") }, billingStatus: "A_FATURAR" }, include: { medicalRecord: { include: { appointment: { include: { patient: true, doctor: true } } } }, injectable: true } }) : [],
      grouped.has("PROCEDIMENTO") ? tx.procedureRequest.findMany({ where: { id: { in: grouped.get("PROCEDIMENTO") }, billingStatus: "A_FATURAR" }, include: { medicalRecord: { include: { appointment: { include: { patient: true, doctor: true } } } } } }) : [],
      tx.procedure.findMany({ where: { type: "DIAGNOSTICO_POR_IMAGEM", active: true }, select: { name: true, value: true } }),
    ]);
    if (exams.length + ultrasounds.length + injectables.length + procedures.length !== requestCount)
      throw Object.assign(new Error("Uma ou mais solicitações já foram faturadas ou não estão disponíveis. Atualize a lista."), { status: 409 });

    type Line = { kind: BillingKind; id: number; label: string; amountCents: number; appointment: any };
    const lines: Line[] = [];
    for (const item of exams) {
      const appointment = item.medicalRecord.appointment;
      const amountCents = item.examGroup.items.reduce((sum, entry) => sum + toCents(entry.examType.value), 0);
      if (!appointment || appointment.status !== "ATENDIDO" || appointment.patientId !== item.patientId || amountCents <= 0) throw Object.assign(new Error(`Não foi possível validar agendamento finalizado, paciente ou preço válido para ${item.groupName}.`), { status: 400 });
      lines.push({ kind: "EXAME", id: item.id, label: item.groupName, amountCents, appointment });
    }
    for (const item of ultrasounds) {
      const appointment = item.medicalRecord.appointment;
      const procedure = imagingProcedures.find(({ name }) => {
        const nameKey = normalizeName(name);
        if (item.type === "MAMAS") return nameKey.includes("mama") && !nameKey.includes("transvaginal") && !/\btv\b/.test(nameKey);
        if (!nameKey.includes("transvaginal") && !/\btv\b/.test(nameKey)) return false;
        const hasPreparation = /\b(preparo|preparacao)\b/.test(nameKey);
        return item.type === "TRANSVAGINAL_PREPARO" ? hasPreparation : !hasPreparation;
      });
      const names: Record<string, string> = { MAMAS: "Ultrassom de mamas", TRANSVAGINAL_ROTINA: "Ultrassom transvaginal de rotina", TRANSVAGINAL_PREPARO: "Ultrassom transvaginal com preparo" };
      const amountCents = procedure ? toCents(procedure.value) : 0;
      if (!appointment || appointment.status !== "ATENDIDO" || appointment.patientId !== item.patientId || amountCents <= 0) throw Object.assign(new Error(`Não há agendamento finalizado, paciente ou procedimento ativo de Diagnóstico por Imagem com preço correspondente para ${names[item.type] || item.type}.`), { status: 400 });
      lines.push({ kind: "ULTRASSOM", id: item.id, label: item.description || names[item.type] || item.type, amountCents, appointment });
    }
    for (const item of injectables) {
      const appointment = item.medicalRecord.appointment;
      const amountCents = toCents(item.injectable.value) * item.sessions;
      if (!appointment || appointment.status !== "ATENDIDO" || appointment.patientId !== item.patientId || amountCents <= 0) throw Object.assign(new Error(`Não há agendamento finalizado, paciente ou valor válido para o injetável ${item.name}.`), { status: 400 });
      lines.push({ kind: "INJETAVEL", id: item.id, label: `${item.name} · ${item.sessions} sessão(ões)`, amountCents, appointment });
    }
    for (const item of procedures) {
      const appointment = item.medicalRecord.appointment;
      const amountCents = toCents(item.value);
      if (!appointment || appointment.status !== "ATENDIDO" || appointment.patientId !== item.patientId || amountCents <= 0) throw Object.assign(new Error(`Não há agendamento finalizado, paciente ou valor válido para o procedimento ${item.name}.`), { status: 400 });
      lines.push({ kind: "PROCEDIMENTO", id: item.id, label: item.name, amountCents, appointment });
    }

    const byAppointment = new Map<number, Line[]>();
    for (const line of lines) {
      const group = byAppointment.get(line.appointment.id) || [];
      group.push(line);
      byAppointment.set(line.appointment.id, group);
    }
    const createdSales = [];
    for (const [appointmentId, saleLines] of byAppointment) {
      const appointment = saleLines[0].appointment;
      const grossCents = saleLines.reduce((sum, line) => sum + line.amountCents, 0);
      const discountCents = Math.round(grossCents * discountPercent / 100);
      const totalCents = grossCents - discountCents;
      const saleKey = createHash("sha256").update(`${appointmentId}|${saleLines.map(({ kind, id }) => `${kind}:${id}`).sort().join(",")}`).digest("hex");
      const code = `VEN-${Date.now().toString(36).toUpperCase()}-${randomUUID().replace(/-/g, "").slice(0, 8).toUpperCase()}`;
      let allocatedItemCents = 0;
      const saleItemData = saleLines.map((line, index) => {
        const itemCents = index === saleLines.length - 1
          ? totalCents - allocatedItemCents
          : Math.floor(line.amountCents * totalCents / grossCents);
        allocatedItemCents += itemCents;
        return {
          sourceType: line.kind,
          sourceId: line.id,
          sourceKey: `request:${line.kind}:${line.id}`,
          description: line.label,
          amount: fromCents(itemCents),
        };
      });
      const sale = await tx.financialSale.create({ data: {
        code,
        serviceDescription: saleLines.length === 1 ? saleLines[0].label : `${saleLines.length} serviços solicitados`,
        patientId: appointment.patientId,
        professionalId: appointment.doctorId,
        professionalName: appointment.doctor.fullName,
        appointmentId,
        saleDate,
        grossAmount: fromCents(grossCents),
        discountAmount: fromCents(discountCents),
        totalAmount: fromCents(totalCents),
        status: FinancialStatus.PENDING,
        idempotencyKey: `secretary-billing:${saleKey}`,
        createdById: userId,
        items: { create: saleItemData },
        receivable: { create: {
          totalAmount: fromCents(totalCents),
          dueDate: saleDate,
          installmentCount: installments,
          preferredPaymentMethod: paymentMethod,
          status: FinancialStatus.PENDING,
          installments: { create: Array.from({ length: installments }, (_, index) => {
            const monthDate = new Date(Date.UTC(saleDate.getUTCFullYear(), saleDate.getUTCMonth() + index, 1));
            const lastDay = new Date(Date.UTC(monthDate.getUTCFullYear(), monthDate.getUTCMonth() + 1, 0)).getUTCDate();
            const dueDate = new Date(Date.UTC(monthDate.getUTCFullYear(), monthDate.getUTCMonth(), Math.min(saleDate.getUTCDate(), lastDay)));
            const baseCents = Math.floor(totalCents / installments);
            const installmentCents = baseCents + (index < totalCents % installments ? 1 : 0);
            return { number: index + 1, dueDate, amount: fromCents(installmentCents) };
          }) },
        } },
      }, include: { receivable: true } });
      createdSales.push(sale);
    }

    const updateResults = await Promise.all([
      grouped.has("EXAME") ? tx.examRequest.updateMany({ where: { id: { in: grouped.get("EXAME") }, billingStatus: "A_FATURAR" }, data: { billingStatus: "FATURADO" } }) : null,
      grouped.has("ULTRASSOM") ? tx.ultrasoundRequest.updateMany({ where: { id: { in: grouped.get("ULTRASSOM") }, billingStatus: "A_FATURAR" }, data: { billingStatus: "FATURADO" } }) : null,
      grouped.has("INJETAVEL") ? tx.injectableRequest.updateMany({ where: { id: { in: grouped.get("INJETAVEL") }, billingStatus: "A_FATURAR" }, data: { billingStatus: "FATURADO" } }) : null,
      grouped.has("PROCEDIMENTO") ? tx.procedureRequest.updateMany({ where: { id: { in: grouped.get("PROCEDIMENTO") }, billingStatus: "A_FATURAR" }, data: { billingStatus: "FATURADO" } }) : null,
    ]);
    const updated = updateResults.reduce((sum, result) => sum + (result?.count || 0), 0);
    if (updated !== requestCount) throw Object.assign(new Error("Uma ou mais solicitações foram faturadas em outra operação. Nenhum registro foi alterado."), { status: 409 });
    return createdSales;
  }, { isolationLevel: Prisma.TransactionIsolationLevel.Serializable });
}
