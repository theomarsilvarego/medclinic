import 'dotenv/config';
import express, { NextFunction, Request, Response } from 'express';
import cors from 'cors';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { AppointmentItemType, AppointmentStatus, InjectableType, PrismaClient, Profile } from '@prisma/client';
import { z } from 'zod';

const prisma = new PrismaClient();
const app = express();
const port = Number(process.env.PORT || 3333);
const jwtSecret = process.env.JWT_SECRET || 'dev-secret';

type AuthRequest = Request & { user?: { id: number; profile: Profile; login: string } };
app.use(cors({ origin: process.env.CORS_ORIGIN?.split(',') || true }));
app.use(express.json());

function signToken(user: { id: number; profile: Profile; login: string }) {
  return jwt.sign(user, jwtSecret, { expiresIn: '8h' });
}

function auth(req: AuthRequest, res: Response, next: NextFunction) {
  const header = req.headers.authorization;
  if (!header?.startsWith('Bearer ')) return res.status(401).json({ message: 'Token não informado.' });
  try {
    req.user = jwt.verify(header.slice(7), jwtSecret) as AuthRequest['user'];
    next();
  } catch { res.status(401).json({ message: 'Token inválido ou expirado.' }); }
}

function adminOnly(req: AuthRequest, res: Response, next: NextFunction) {
  if (req.user?.profile !== Profile.ADMINISTRADOR) return res.status(403).json({ message: 'Acesso restrito ao administrador.' });
  next();
}

function appointmentAccess(req: AuthRequest, res: Response, next: NextFunction) {
  if (![Profile.ADMINISTRADOR, Profile.SECRETARIA, Profile.MEDICO].includes(req.user?.profile as Profile)) return res.status(403).json({ message: 'Perfil sem acesso à agenda.' });
  next();
}

function appointmentManage(req: AuthRequest, res: Response, next: NextFunction) {
  if (req.user?.profile !== Profile.ADMINISTRADOR && req.user?.profile !== Profile.SECRETARIA) return res.status(403).json({ message: 'Apenas administrador e secretária podem gerenciar agendamentos.' });
  next();
}

function doctorOnly(req: AuthRequest, res: Response, next: NextFunction) {
  if (req.user?.profile !== Profile.MEDICO) return res.status(403).json({ message: 'Acesso restrito ao perfil Médico.' });
  next();
}

function routeId(req: Request, res: Response, fallback?: unknown, respond = true) {
  const paramId = req.params.id;
  const rawId = paramId && paramId !== 'undefined' && paramId !== 'null' && paramId !== 'NaN' ? paramId : fallback;
  const id = Number(rawId);
  if (!Number.isInteger(id) || id <= 0) {
    if (respond) res.status(400).json({ message: 'ID do cadastro inválido. Atualize a lista e tente novamente.' });
    return null;
  }
  return id;
}

const requiredText = z.string().trim().min(1);
const loginSchema = z.object({ login: requiredText, password: z.string().min(1) });
const userSchema = z.object({ fullName: requiredText, login: requiredText, password: z.string().optional(), profile: z.nativeEnum(Profile) });
const clinicSchema = z.object({ legalName: requiredText, tradeName: requiredText, cnpj: requiredText, cnae: requiredText, address: requiredText });
const doctorSchema = z.object({ fullName: requiredText, crm: requiredText, rqe: requiredText, specialty: requiredText });
const financialSchema = z.object({ name: requiredText, value: z.coerce.number().nonnegative(), active: z.boolean().default(true) });
const insuranceSchema = financialSchema.extend({ ans: requiredText });
const attendanceSchema = financialSchema.extend({ insuranceId: z.coerce.number().int().positive() });
const injectableSchema = z.object({
  name: requiredText,
  type: z.nativeEnum(InjectableType),
  supplier: requiredText,
  invoiceValue: z.coerce.number().nonnegative(),
  value: z.coerce.number().nonnegative(),
  quantity: z.coerce.number().int().nonnegative(),
  minimum: z.coerce.number().int().nonnegative()
});

const appointmentSchema = z.object({
  appointmentDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, 'Data inválida.'),
  scheduledTime: z.string().regex(/^(20:00|(?:08|09|10|11|12|13|14|15|16|17|18|19):(00|30))$/, 'Horário inválido.'),
  patientId: z.coerce.number().int().positive(),
  doctorId: z.coerce.number().int().positive(),
  insuranceId: z.coerce.number().int().positive(),
  itemType: z.nativeEnum(AppointmentItemType),
  attendanceId: z.coerce.number().int().positive().nullable().optional(),
  procedureId: z.coerce.number().int().positive().nullable().optional(),
  status: z.nativeEnum(AppointmentStatus).default(AppointmentStatus.AGENDADO),
  notes: z.string().optional().nullable()
});

const appointmentInclude = {
  patient: { select: { id: true, fullName: true, phone: true } },
  doctor: { select: { id: true, fullName: true, specialty: true } },
  insurance: { select: { id: true, name: true } },
  attendance: { select: { id: true, name: true } },
  procedure: { select: { id: true, name: true } }
};

const medicalRecordSchema = z.object({
  patientId: z.coerce.number().int().positive(),
  appointmentId: z.coerce.number().int().positive().nullable().optional(),
  recordDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, 'Data inválida.'),
  title: requiredText,
  chiefComplaint: z.string().optional().nullable(),
  medicalHistory: z.string().optional().nullable(),
  physicalExam: z.string().optional().nullable(),
  diagnosis: z.string().optional().nullable(),
  conduct: z.string().optional().nullable(),
  prescription: z.string().optional().nullable()
});

const medicalRecordInclude = {
  patient: { select: { id: true, fullName: true, phone: true, cpf: true } },
  author: { select: { id: true, fullName: true } },
  appointment: { select: { id: true, scheduledTime: true, appointmentDate: true } }
};

async function validateAppointmentInsurance(data: z.infer<typeof appointmentSchema>) {
  if (data.itemType === AppointmentItemType.ATENDIMENTO && data.attendanceId) {
    const attendance = await prisma.attendance.findUnique({ where: { id: data.attendanceId }, select: { insuranceId: true } });
    if (!attendance || attendance.insuranceId !== data.insuranceId) throw new Error('O atendimento selecionado não pertence ao convênio informado.');
  }
}

function appointmentData(data: z.infer<typeof appointmentSchema>) {
  const isAttendance = data.itemType === AppointmentItemType.ATENDIMENTO;
  if (isAttendance && !data.attendanceId) throw new Error('Selecione um atendimento.');
  if (!isAttendance && !data.procedureId) throw new Error('Selecione um procedimento.');
  return { ...data, appointmentDate: new Date(`${data.appointmentDate}T00:00:00.000Z`), attendanceId: isAttendance ? data.attendanceId : null, procedureId: isAttendance ? null : data.procedureId };
}

app.get('/api/health', (_req, res) => res.json({ status: 'ok', service: 'MedClinic API' }));
app.post('/api/auth/login', async (req, res) => {
  const parsed = loginSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Informe login e senha.' });
  const user = await prisma.user.findUnique({ where: { login: parsed.data.login } });
  if (!user || !(await bcrypt.compare(parsed.data.password, user.passwordHash))) return res.status(401).json({ message: 'Login ou senha inválidos.' });
  const token = signToken({ id: user.id, profile: user.profile, login: user.login });
  res.json({ token, user: { id: user.id, fullName: user.fullName, login: user.login, profile: user.profile } });
});
app.get('/api/auth/me', auth, async (req: AuthRequest, res) => {
  const user = await prisma.user.findUnique({ where: { id: req.user!.id }, select: { id: true, fullName: true, login: true, profile: true } });
  res.json(user);
});

const patientSchema = z.object({
  sourceCode: z.coerce.number().int().positive(),
  recordNumber: z.string().trim().optional().nullable(),
  fullName: requiredText,
  sex: z.coerce.number().int().optional().nullable(),
  maritalStatus: z.coerce.number().int().optional().nullable(),
  cpf: z.string().trim().optional().nullable(),
  email: z.string().trim().email().optional().nullable().or(z.literal('')),
  phone: z.string().trim().optional().nullable(),
  birthDate: z.coerce.date().optional().nullable(),
  insuranceCode: z.coerce.number().int().optional().nullable(),
  notes: z.string().optional().nullable()
});

// Pacientes são acessíveis a qualquer perfil autenticado.
app.get('/api/patients', auth, async (_req, res) => {
  const [patients, insurances] = await Promise.all([
    prisma.patient.findMany({ orderBy: { fullName: 'asc' } }),
    prisma.insurance.findMany({ select: { id: true, name: true } })
  ]);
  const insuranceNames = new Map(insurances.map(insurance => [insurance.id, insurance.name]));
  res.json(patients.map(patient => ({ ...patient, insuranceName: patient.insuranceCode ? insuranceNames.get(patient.insuranceCode) || null : null })));
});
app.post('/api/patients', auth, async (req, res) => {
  const parsed = patientSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Preencha nome e código do paciente corretamente.' });
  res.status(201).json(await prisma.patient.create({ data: parsed.data }));
});
app.put('/api/patients/:id', auth, async (req, res) => {
  const parsed = patientSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Dados do paciente inválidos.' });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.patient.update({ where: { id }, data: parsed.data }));
});
app.delete('/api/patients/:id', auth, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.patient.delete({ where: { id } });
  res.status(204).send();
});

app.get('/api/medical-records', auth, doctorOnly, async (req: AuthRequest, res) => {
  const rawPatientId = req.query.patientId;
  const patientId = rawPatientId ? Number(rawPatientId) : undefined;
  if (patientId !== undefined && (!Number.isInteger(patientId) || patientId <= 0)) return res.status(400).json({ message: 'Paciente inválido.' });
  res.json(await prisma.medicalRecord.findMany({ where: patientId ? { patientId } : undefined, orderBy: [{ recordDate: 'desc' }, { createdAt: 'desc' }], include: medicalRecordInclude }));
});
app.post('/api/medical-records', auth, doctorOnly, async (req: AuthRequest, res) => {
  const parsed = medicalRecordSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Preencha a data, o título e o paciente do prontuário.' });
  const data = { ...parsed.data, recordDate: new Date(`${parsed.data.recordDate}T00:00:00.000Z`), authorId: req.user!.id };
  res.status(201).json(await prisma.medicalRecord.create({ data, include: medicalRecordInclude }));
});
app.put('/api/medical-records/:id', auth, doctorOnly, async (req: AuthRequest, res) => {
  const parsed = medicalRecordSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Preencha a data, o título e o paciente do prontuário.' });
  const id = routeId(req, res, req.body?.id); if (id === null) return;
  const data = { ...parsed.data, recordDate: new Date(`${parsed.data.recordDate}T00:00:00.000Z`) };
  res.json(await prisma.medicalRecord.update({ where: { id }, data, include: medicalRecordInclude }));
});
app.delete('/api/medical-records/:id', auth, doctorOnly, async (req, res) => {
  const id = routeId(req, res); if (id === null) return;
  await prisma.medicalRecord.delete({ where: { id } });
  res.status(204).send();
});

app.get('/api/appointments/meta', auth, appointmentAccess, async (_req, res) => {
  const [patients, doctors, insurances, attendances, procedures] = await Promise.all([
    prisma.patient.findMany({ orderBy: { fullName: 'asc' }, select: { id: true, fullName: true, phone: true } }),
    prisma.doctor.findMany({ orderBy: { fullName: 'asc' }, select: { id: true, fullName: true, specialty: true } }),
    prisma.insurance.findMany({ where: { active: true }, orderBy: { name: 'asc' }, select: { id: true, name: true } }),
    prisma.attendance.findMany({ where: { active: true }, orderBy: { name: 'asc' }, select: { id: true, name: true, insuranceId: true, insurance: { select: { name: true } } } }),
    prisma.procedure.findMany({ where: { active: true }, orderBy: { name: 'asc' }, select: { id: true, name: true, value: true } })
  ]);
  res.json({ patients, doctors, insurances, attendances, procedures });
});
app.get('/api/appointments', auth, appointmentAccess, async (req, res) => {
  const date = String(req.query.date || '');
  if (!/^\d{4}-\d{2}-\d{2}$/.test(date)) return res.status(400).json({ message: 'Informe a data no formato AAAA-MM-DD.' });
  res.json(await prisma.appointment.findMany({ where: { appointmentDate: new Date(`${date}T00:00:00.000Z`) }, orderBy: [{ scheduledTime: 'asc' }, { doctor: { fullName: 'asc' } }], include: appointmentInclude }));
});
app.post('/api/appointments', auth, appointmentManage, async (req, res) => {
  const parsed = appointmentSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Preencha corretamente os dados do agendamento.' });
  try { await validateAppointmentInsurance(parsed.data); const data = appointmentData(parsed.data); res.status(201).json(await prisma.appointment.create({ data, include: appointmentInclude })); }
  catch (err: any) { if (err?.code === 'P2002') return res.status(409).json({ message: 'Este médico já possui agendamento nesse horário.' }); if (err?.message) return res.status(400).json({ message: err.message }); throw err; }
});
app.put('/api/appointments/:id', auth, appointmentManage, async (req, res) => {
  const parsed = appointmentSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Preencha corretamente os dados do agendamento.' });
  const id = routeId(req, res, req.body?.id); if (id === null) return;
  try { await validateAppointmentInsurance(parsed.data); const data = appointmentData(parsed.data); res.json(await prisma.appointment.update({ where: { id }, data, include: appointmentInclude })); }
  catch (err: any) { if (err?.code === 'P2002') return res.status(409).json({ message: 'Este médico já possui agendamento nesse horário.' }); if (err?.message) return res.status(400).json({ message: err.message }); throw err; }
});
app.delete('/api/appointments/:id', auth, appointmentManage, async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.appointment.delete({ where: { id } }); res.status(204).send(); });

app.use('/api/admin', auth, adminOnly);

app.get('/api/admin/users', async (_req, res) => res.json(await prisma.user.findMany({ orderBy: { id: 'desc' }, select: { id: true, fullName: true, login: true, profile: true, createdAt: true } })));
app.post('/api/admin/users', async (req, res) => {
  const parsed = userSchema.safeParse(req.body);
  if (!parsed.success || !parsed.data.password) return res.status(400).json({ message: 'Nome, login, senha e perfil são obrigatórios.' });
  const data = parsed.data;
  const password = data.password as string;
  const user = await prisma.user.create({ data: { fullName: data.fullName, login: data.login, passwordHash: await bcrypt.hash(password, 10), profile: data.profile }, select: { id: true, fullName: true, login: true, profile: true } });
  res.status(201).json(user);
});
app.put('/api/admin/users/:id', async (req, res) => {
  const parsed = userSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Dados de usuário inválidos.' });
  const data = parsed.data;
  let id = routeId(req, res, req.body?.id, false);
  if (id === null) {
    const existing = await prisma.user.findUnique({ where: { login: data.login }, select: { id: true } });
    if (!existing) return res.status(400).json({ message: 'ID do cadastro inválido e login não localizado. Atualize a lista e tente novamente.' });
    id = existing.id;
  }
  const user = await prisma.user.update({ where: { id }, data: { fullName: data.fullName, login: data.login, profile: data.profile, ...(data.password ? { passwordHash: await bcrypt.hash(data.password, 10) } : {}) }, select: { id: true, fullName: true, login: true, profile: true } });
  res.json(user);
});
app.delete('/api/admin/users/:id', async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.user.delete({ where: { id } }); res.status(204).send(); });

app.get('/api/admin/clinic', async (_req, res) => res.json(await prisma.clinic.findMany({ orderBy: { id: 'desc' } })));
app.post('/api/admin/clinic', async (req, res) => {
  const parsed = clinicSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Preencha todos os campos da clínica.' });
  res.status(201).json(await prisma.clinic.create({ data: parsed.data }));
});
app.put('/api/admin/clinic/:id', async (req, res) => {
  const parsed = clinicSchema.safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: 'Preencha todos os campos da clínica.' });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.clinic.update({ where: { id }, data: parsed.data }));
});
app.delete('/api/admin/clinic/:id', async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.clinic.delete({ where: { id } });
  res.status(204).send();
});

async function crud<T extends { id: number }>(res: Response, model: any, method: 'findMany' | 'create' | 'update' | 'delete', args?: any) { return res.json(await model[method](args)); }
app.get('/api/admin/doctors', async (_req, res) => crud(res, prisma.doctor, 'findMany', { orderBy: { id: 'desc' } }));
app.post('/api/admin/doctors', async (req, res) => { const p = doctorSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do médico.' }); res.status(201).json(await prisma.doctor.create({ data: p.data })); });
app.put('/api/admin/doctors/:id', async (req, res) => { const p = doctorSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do médico.' }); const id = routeId(req, res, req.body?.id); if (id === null) return; res.json(await prisma.doctor.update({ where: { id }, data: p.data })); });
app.delete('/api/admin/doctors/:id', async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.doctor.delete({ where: { id } }); res.status(204).send(); });

app.get('/api/admin/insurances', async (_req, res) => crud(res, prisma.insurance, 'findMany', { orderBy: { id: 'desc' } }));
app.post('/api/admin/insurances', async (req, res) => { const p = insuranceSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do convênio.' }); res.status(201).json(await prisma.insurance.create({ data: p.data })); });
app.put('/api/admin/insurances/:id', async (req, res) => { const p = insuranceSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do convênio.' }); const id = routeId(req, res, req.body?.id); if (id === null) return; res.json(await prisma.insurance.update({ where: { id }, data: p.data })); });
app.delete('/api/admin/insurances/:id', async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.insurance.delete({ where: { id } }); res.status(204).send(); });

app.get('/api/admin/attendances', async (_req, res) => res.json(await prisma.attendance.findMany({ orderBy: { id: 'desc' }, include: { insurance: { select: { id: true, name: true } } } })));
app.post('/api/admin/attendances', async (req, res) => { const p = attendanceSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha nome, valor e convênio do atendimento.' }); res.status(201).json(await prisma.attendance.create({ data: p.data, include: { insurance: { select: { id: true, name: true } } } })); });
app.put('/api/admin/attendances/:id', async (req, res) => { const p = attendanceSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha nome, valor e convênio do atendimento.' }); const id = routeId(req, res, req.body?.id); if (id === null) return; res.json(await prisma.attendance.update({ where: { id }, data: p.data, include: { insurance: { select: { id: true, name: true } } } })); });
app.delete('/api/admin/attendances/:id', async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.attendance.delete({ where: { id } }); res.status(204).send(); });

app.get('/api/admin/procedures', async (_req, res) => crud(res, prisma.procedure, 'findMany', { orderBy: { id: 'desc' } }));
app.post('/api/admin/procedures', async (req, res) => { const p = financialSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do procedimento.' }); res.status(201).json(await prisma.procedure.create({ data: p.data })); });
app.put('/api/admin/procedures/:id', async (req, res) => { const p = financialSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do procedimento.' }); const id = routeId(req, res, req.body?.id); if (id === null) return; res.json(await prisma.procedure.update({ where: { id }, data: p.data })); });
app.delete('/api/admin/procedures/:id', async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.procedure.delete({ where: { id } }); res.status(204).send(); });

app.get('/api/admin/injectables', async (_req, res) => crud(res, prisma.injectable, 'findMany', { orderBy: { id: 'desc' } }));
app.post('/api/admin/injectables', async (req, res) => { const p = injectableSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha corretamente os dados do injetável.' }); res.status(201).json(await prisma.injectable.create({ data: p.data })); });
app.put('/api/admin/injectables/:id', async (req, res) => { const p = injectableSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha corretamente os dados do injetável.' }); const id = routeId(req, res, req.body?.id); if (id === null) return; res.json(await prisma.injectable.update({ where: { id }, data: p.data })); });
app.delete('/api/admin/injectables/:id', async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.injectable.delete({ where: { id } }); res.status(204).send(); });

app.use((err: any, _req: Request, res: Response, _next: NextFunction) => { console.error(err); res.status(500).json({ message: 'Erro interno do servidor.' }); });
app.listen(port, '0.0.0.0', () => console.log(`MedClinic API em http://localhost:${port}`));
