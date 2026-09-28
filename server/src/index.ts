import 'dotenv/config';
import express, { NextFunction, Request, Response } from 'express';
import cors from 'cors';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { PrismaClient, Profile } from '@prisma/client';
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

app.get('/api/admin/procedures', async (_req, res) => crud(res, prisma.procedure, 'findMany', { orderBy: { id: 'desc' } }));
app.post('/api/admin/procedures', async (req, res) => { const p = financialSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do procedimento.' }); res.status(201).json(await prisma.procedure.create({ data: p.data })); });
app.put('/api/admin/procedures/:id', async (req, res) => { const p = financialSchema.safeParse(req.body); if (!p.success) return res.status(400).json({ message: 'Preencha os dados do procedimento.' }); const id = routeId(req, res, req.body?.id); if (id === null) return; res.json(await prisma.procedure.update({ where: { id }, data: p.data })); });
app.delete('/api/admin/procedures/:id', async (req, res) => { const id = routeId(req, res); if (id === null) return; await prisma.procedure.delete({ where: { id } }); res.status(204).send(); });

app.use((err: any, _req: Request, res: Response, _next: NextFunction) => { console.error(err); res.status(500).json({ message: 'Erro interno do servidor.' }); });
app.listen(port, '0.0.0.0', () => console.log(`MedClinic API em http://localhost:${port}`));
