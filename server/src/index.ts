import "dotenv/config";
import express, { NextFunction, Request, Response } from "express";
import cors from "cors";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import crypto from "node:crypto";
import fs from "node:fs";
import path from "node:path";
import {
  AppointmentItemType,
  AppointmentStatus,
  InjectableType,
  Prisma,
  ProcedureType,
  PrismaClient,
  Profile,
} from "@prisma/client";
import multer from "multer";
import PDFDocument from "pdfkit";
import { SignPdf } from "@signpdf/signpdf";
import { plainAddPlaceholder } from "@signpdf/placeholder-plain";
import { P12Signer } from "@signpdf/signer-p12";
import { z } from "zod";
import QRCode from "qrcode";
import forge from "node-forge";

const prisma = new PrismaClient();
const app = express();
const port = Number(process.env.PORT || 3333);
const jwtSecret = process.env.JWT_SECRET || "dev-secret";
const clinicTimeZone = process.env.CLINIC_TIMEZONE || "America/Porto_Velho";
const corsOrigins = new Set([
  "http://100.101.191.54:3000",
  "http://192.168.0.200:3000",
  "http://localhost:3000",
  "http://127.0.0.1:3000",
  ...(process.env.CORS_ORIGIN || "")
    .split(",")
    .map((origin) => origin.trim())
    .filter(Boolean),
]);
const certificateEncryptionKey = crypto
  .createHash("sha256")
  .update(process.env.CERTIFICATE_ENCRYPTION_KEY || jwtSecret)
  .digest();
const attachmentRoot = path.resolve(
  process.env.MEDICAL_RECORD_UPLOAD_DIR ||
    path.join(process.cwd(), "uploads", "medical-records"),
);
fs.mkdirSync(attachmentRoot, { recursive: true });
const patientPhotoRoot = path.resolve(
  process.env.PATIENT_PHOTO_UPLOAD_DIR ||
    path.join(process.cwd(), "uploads", "patient-photos"),
);
fs.mkdirSync(patientPhotoRoot, { recursive: true });
const examRequestPdfRoot = path.resolve(
  process.env.EXAM_REQUEST_PDF_DIR ||
    path.join(process.cwd(), "uploads", "exam-requests"),
);
fs.mkdirSync(examRequestPdfRoot, { recursive: true });
const allowedAttachments: Record<string, string> = {
  "application/pdf": ".pdf",
  "image/jpeg": ".jpg",
  "image/png": ".png",
};
const attachmentUpload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 10 * 1024 * 1024, files: 1 },
  fileFilter: (_req, file, callback) => {
    if (!allowedAttachments[file.mimetype])
      return callback(
        new Error(
          "Tipo de arquivo não permitido. Envie apenas PDF, JPG ou PNG.",
        ),
      );
    callback(null, true);
  },
});
const appointmentAttachmentUpload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 10 * 1024 * 1024, files: 10 },
  fileFilter: (_req, file, callback) => {
    if (!allowedAttachments[file.mimetype])
      return callback(new Error("Tipo de arquivo não permitido. Envie apenas PDF, JPG ou PNG."));
    callback(null, true);
  },
});
const appointmentFormUpload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 10 * 1024 * 1024, files: 20 },
  fileFilter: (_req, file, callback) => {
    if (!allowedAttachments[file.mimetype])
      return callback(new Error("Tipo de arquivo não permitido. Envie apenas PDF, JPG ou PNG."));
    callback(null, true);
  },
});
const patientPhotoUpload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 10 * 1024 * 1024, files: 1 },
  fileFilter: (_req, file, callback) => {
    if (!["image/jpeg", "image/png"].includes(file.mimetype))
      return callback(new Error("A foto deve estar no formato JPG ou PNG."));
    callback(null, true);
  },
});
const certificateUpload = multer({
  storage: multer.memoryStorage(),
  limits: { fileSize: 10 * 1024 * 1024, files: 1 },
  fileFilter: (_req, file, callback) => {
    if (
      !file.originalname.toLowerCase().endsWith(".pfx") &&
      !file.originalname.toLowerCase().endsWith(".p12")
    )
      return callback(
        new Error("Envie um certificado digital no formato PFX ou P12."),
      );
    callback(null, true);
  },
});

type AuthRequest = Request & {
  user?: { id: number; profile: Profile; login: string };
};
app.use(
  cors({
    origin: (origin, callback) => {
      if (!origin || corsOrigins.has(origin)) return callback(null, true);
      callback(new Error(`Origem não autorizada pelo CORS: ${origin}`));
    },
    methods: ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization"],
    optionsSuccessStatus: 204,
  }),
);
app.use(express.json());

function signToken(user: { id: number; profile: Profile; login: string }) {
  return jwt.sign(user, jwtSecret, { expiresIn: "8h" });
}

function auth(req: AuthRequest, res: Response, next: NextFunction) {
  const header = req.headers.authorization;
  if (!header?.startsWith("Bearer "))
    return res.status(401).json({ message: "Token não informado." });
  try {
    req.user = jwt.verify(header.slice(7), jwtSecret) as AuthRequest["user"];
    next();
  } catch {
    res.status(401).json({ message: "Token inválido ou expirado." });
  }
}

function adminOnly(req: AuthRequest, res: Response, next: NextFunction) {
  if (req.user?.profile !== Profile.ADMINISTRADOR)
    return res
      .status(403)
      .json({ message: "Acesso restrito ao administrador." });
  next();
}

function appointmentAccess(
  req: AuthRequest,
  res: Response,
  next: NextFunction,
) {
  if (
    ![Profile.ADMINISTRADOR, Profile.SECRETARIA, Profile.MEDICO].includes(
      req.user?.profile as Profile,
    )
  )
    return res.status(403).json({ message: "Perfil sem acesso à agenda." });
  next();
}

function appointmentManage(
  req: AuthRequest,
  res: Response,
  next: NextFunction,
) {
  if (
    req.user?.profile !== Profile.ADMINISTRADOR &&
    req.user?.profile !== Profile.SECRETARIA
  )
    return res.status(403).json({
      message:
        "Apenas administrador e secretária podem gerenciar agendamentos.",
    });
  next();
}
function appointmentAttachmentManage(req: AuthRequest, res: Response, next: NextFunction) {
  if (![Profile.ADMINISTRADOR, Profile.SECRETARIA, Profile.MEDICO].includes(req.user?.profile as Profile))
    return res.status(403).json({ message: "Perfil sem permissão para alterar anexos." });
  next();
}

function doctorOnly(req: AuthRequest, res: Response, next: NextFunction) {
  if (req.user?.profile !== Profile.MEDICO)
    return res
      .status(403)
      .json({ message: "Acesso restrito ao perfil Médico." });
  next();
}

function secretaryOnly(req: AuthRequest, res: Response, next: NextFunction) {
  if (req.user?.profile !== Profile.SECRETARIA)
    return res.status(403).json({ message: "Acesso restrito ao perfil Secretária." });
  next();
}

function clinicalRequestReadAccess(req: AuthRequest, res: Response, next: NextFunction) {
  if (req.user?.profile !== Profile.MEDICO && req.user?.profile !== Profile.SECRETARIA)
    return res.status(403).json({ message: "Perfil sem permissão para visualizar solicitações clínicas." });
  next();
}

function clinicTodayDate() {
  return new Intl.DateTimeFormat("en-CA", {
    timeZone: clinicTimeZone,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(new Date());
}

function encryptSecret(value: Buffer | string) {
  const iv = crypto.randomBytes(12);
  const cipher = crypto.createCipheriv(
    "aes-256-gcm",
    certificateEncryptionKey,
    iv,
  );
  const encrypted = Buffer.concat([cipher.update(value), cipher.final()]);
  return Buffer.concat([iv, cipher.getAuthTag(), encrypted]).toString("base64");
}
function decryptSecret(value: string) {
  const packed = Buffer.from(value, "base64");
  const decipher = crypto.createDecipheriv(
    "aes-256-gcm",
    certificateEncryptionKey,
    packed.subarray(0, 12),
  );
  decipher.setAuthTag(packed.subarray(12, 28));
  return Buffer.concat([
    decipher.update(packed.subarray(28)),
    decipher.final(),
  ]);
}

function routeId(
  req: Request,
  res: Response,
  fallback?: unknown,
  respond = true,
) {
  const paramId = req.params.id;
  const rawId =
    paramId &&
    paramId !== "undefined" &&
    paramId !== "null" &&
    paramId !== "NaN"
      ? paramId
      : fallback;
  const id = Number(rawId);
  if (!Number.isInteger(id) || id <= 0) {
    if (respond)
      res.status(400).json({
        message: "ID do cadastro inválido. Atualize a lista e tente novamente.",
      });
    return null;
  }
  return id;
}

const requiredText = z.string().trim().min(1);
const loginSchema = z.object({
  login: requiredText,
  password: z.string().min(1),
});
const userSchema = z.object({
  fullName: requiredText,
  login: requiredText,
  password: z.string().optional(),
  profile: z.nativeEnum(Profile),
});
const clinicSchema = z.object({
  legalName: requiredText,
  tradeName: requiredText,
  cnpj: requiredText,
  cnae: requiredText,
  address: requiredText,
});
const doctorSchema = z.object({
  fullName: requiredText,
  crm: requiredText,
  rqe: requiredText,
  specialty: requiredText,
});
const financialSchema = z.object({
  name: requiredText,
  value: z.coerce.number().nonnegative(),
  active: z.boolean().default(true),
});
const procedureSchema = financialSchema.extend({
  type: z.nativeEnum(ProcedureType),
});
const insuranceSchema = financialSchema.extend({ ans: requiredText });
const attendanceSchema = financialSchema.extend({
  insuranceId: z.coerce.number().int().positive(),
});
const injectableSchema = z.object({
  name: requiredText,
  type: z.nativeEnum(InjectableType),
  supplier: requiredText,
  expirationDate: z.preprocess(
    (value) => value === "" ? null : value,
    z.coerce.date().nullable().optional(),
  ),
  lot: z.preprocess(
    (value) => value === "" ? null : value,
    z.string().trim().max(100).nullable().optional(),
  ),
  unit: z.preprocess(
    (value) => value === "" ? null : value,
    z.string().trim().max(40).nullable().optional(),
  ),
  invoiceValue: z.coerce.number().nonnegative(),
  value: z.coerce.number().nonnegative(),
  quantity: z.coerce.number().int().nonnegative(),
  minimum: z.coerce.number().int().nonnegative(),
});
const supplierSchema = z.object({
  name: requiredText,
  cnpj: requiredText,
  legalName: requiredText,
  email: z.string().trim().email("E-mail inválido."),
  contact: requiredText,
  address: requiredText,
});
const examTypeSchema = z.object({
  code: requiredText,
  name: requiredText,
  invoiceValue: z.coerce.number().nonnegative(),
  value: z.coerce.number().nonnegative(),
  active: z.boolean().default(true),
});
const examGroupSchema = z.object({
  name: requiredText,
  examTypeIds: z
    .array(z.coerce.number().int().positive())
    .min(1, "Selecione pelo menos um exame.")
    .transform((ids) => [...new Set(ids)]),
});
const examRequestSchema = z.object({
  groups: z
    .array(
      z.object({
        examGroupId: z.coerce.number().int().positive(),
        examTypeIds: z
          .array(z.coerce.number().int().positive())
          .min(1, "Selecione pelo menos um exame."),
      }),
    )
    .min(1, "Selecione pelo menos um grupo."),
});
const ultrasoundRequestSchema = z.object({
  requests: z.array(z.object({
    type: z.enum(["MAMAS", "TRANSVAGINAL_ROTINA", "TRANSVAGINAL_PREPARO"]),
    description: z.string().trim().max(4000).optional().default(""),
  })).min(1, "Selecione pelo menos um exame de ultrassonografia."),
});
const injectableRequestSchema = z.object({
  items: z
    .array(
      z.object({
        injectableId: z.coerce.number().int().positive(),
        route: z.enum(["IM", "EV", "SC"]),
        sessions: z.coerce.number().int().min(1).max(99),
        observation: z.string().trim().max(4000).optional().nullable(),
      }),
    )
    .min(1, "Selecione pelo menos um injetável."),
});

const appointmentSchema = z.object({
  appointmentDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, "Data inválida."),
  scheduledTime: z
    .string()
    .regex(
      /^(20:00|(?:08|09|10|11|12|13|14|15|16|17|18|19):(00|15|30|45))$/,
      "Horário inválido.",
    ),
  patientId: z.coerce.number().int().positive(),
  doctorId: z.coerce.number().int().positive(),
  insuranceId: z.coerce.number().int().positive(),
  itemType: z.nativeEnum(AppointmentItemType),
  attendanceId: z.coerce.number().int().positive().nullable().optional(),
  procedureId: z.coerce.number().int().positive().nullable().optional(),
  status: z.nativeEnum(AppointmentStatus).default(AppointmentStatus.AGENDADO),
  notes: z.string().optional().nullable(),
});

const anamnesisText = z.string().trim().max(2000);
const anamnesisAnswersSchema = z.object({
  orderNumber: z.string().trim().min(1).max(30),
  appointmentDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  cpf: z.string().trim().max(14),
  fullName: z.string().trim().min(1).max(180),
  titularNumber: z.string().trim().max(40),
  maritalStatus: z.string().trim().max(40),
  phone: z.string().trim().max(40),
  birthDate: z.string().trim().max(10),
  age: z.string().trim().max(3),
  lastMenstruationDate: z.string().trim().max(10),
  weightKg: z.string().trim().max(20),
  bloodPressureSystolic: z.string().trim().max(10),
  bloodPressureDiastolic: z.string().trim().max(10),
  menarcheAge: z.string().trim().max(10),
  contraceptiveUse: z.enum(["SIM", "NAO", ""]),
  contraceptiveMethod: anamnesisText,
  pregnancies: z.string().trim().max(10),
  normalBirths: z.string().trim().max(10),
  cesareanBirths: z.string().trim().max(10),
  abortions: z.string().trim().max(10),
  lastPreventiveExam: z.string().trim().max(7),
  umg: anamnesisText,
  hasChronicHypertension: z.boolean(),
  hasOtherComorbidities: z.boolean(),
  comorbidityDetails: anamnesisText,
  hasAllergy: z.enum(["SIM", "NAO", ""]),
  allergyDetails: anamnesisText,
  previousSurgeries: anamnesisText,
  physicalActivity: anamnesisText,
  chiefComplaint: anamnesisText,
  routineEvaluation: z.boolean(),
  otherReason: anamnesisText,
});
const anamnesisSubmissionSchema = z.object({
  answers: anamnesisAnswersSchema,
  consentAccepted: z.boolean(),
});
const anamnesisTokenPattern = /^[a-zA-Z0-9_-]{43}$/;
const anamnesisConsentVersion = "2026-10-22-v1";
const anamnesisTokenLifetimeMs = 30 * 24 * 60 * 60 * 1000;

function hashAnamnesisToken(token: string) {
  return crypto.createHash("sha256").update(token).digest("hex");
}

function isSindicatoInsurance(name: string | null | undefined) {
  const normalized = String(name || "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .trim()
    .toUpperCase();
  return /^SINDICATO(?:$|[\s\-/])/.test(normalized);
}

async function isEligibleForAnamnesis(appointment: {
  insurance: { name: string };
  patient: { insuranceCode: number | null };
}) {
  if (!isSindicatoInsurance(appointment.insurance.name)) return false;
  if (appointment.patient.insuranceCode === null) return true;
  const patientInsurance = await prisma.insurance.findUnique({
    where: { id: appointment.patient.insuranceCode },
    select: { name: true },
  });
  return isSindicatoInsurance(patientInsurance?.name);
}

function setAnamnesisNoStoreHeaders(res: Response) {
  res.setHeader("Cache-Control", "no-store, max-age=0");
  res.setHeader("Pragma", "no-cache");
  res.setHeader("Referrer-Policy", "no-referrer");
  res.setHeader("X-Robots-Tag", "noindex, nofollow, noarchive");
}

async function findPublicAnamnesis(token: string) {
  if (!anamnesisTokenPattern.test(token)) return null;
  const form = await prisma.patientAnamnesis.findUnique({
    where: { tokenHash: hashAnamnesisToken(token) },
    include: {
      patient: { select: { id: true } },
      appointment: {
        include: {
          patient: {
            select: {
              id: true,
              fullName: true,
              cpf: true,
              phone: true,
              birthDate: true,
              insuranceCode: true,
            },
          },
          insurance: { select: { name: true } },
        },
      },
    },
  });
  if (
    !form ||
    form.revokedAt ||
    form.submittedAt ||
    form.expiresAt.getTime() <= Date.now() ||
    form.patientId !== form.appointment.patient.id
  ) return null;
  if (!(await isEligibleForAnamnesis(form.appointment))) return null;
  return form;
}

const appointmentInclude = {
  patient: { select: { id: true, fullName: true, phone: true, insuranceCode: true } },
  doctor: { select: { id: true, fullName: true, specialty: true } },
  insurance: { select: { id: true, name: true } },
  attendance: { select: { id: true, name: true } },
  procedure: { select: { id: true, name: true } },
  attachments: {
    orderBy: { uploadedAt: "asc" as const },
    include: { uploadedBy: { select: { id: true, fullName: true } } },
  },
};
async function persistAppointmentAttachments(
  appointmentId: number,
  patientId: number,
  files: Express.Multer.File[] | Record<string, Express.Multer.File[]>,
  uploadedById: number,
) {
  const fileList = Array.isArray(files) ? files : files.files || [];
  if (!fileList.length) return;
  const patientDirectory = path.join(attachmentRoot, String(patientId));
  await fs.promises.mkdir(patientDirectory, { recursive: true });
  for (const file of fileList) {
    const storageKey = `${patientId}/${crypto.randomUUID()}${allowedAttachments[file.mimetype]}`;
    await fs.promises.writeFile(path.resolve(attachmentRoot, storageKey), file.buffer);
    await prisma.appointmentAttachment.create({
      data: {
        appointmentId,
        patientId,
        fileName: file.originalname,
        mimeType: file.mimetype,
        sizeBytes: file.size,
        storageKey,
        url: `/appointment-attachments/file?key=${encodeURIComponent(storageKey)}`,
        uploadedById,
      },
    });
  }
}
const appointmentExamTypes = ["laboratorial", "usg_tv", "usg_mama", "preventivo"] as const;
const legacyAppointmentExamTypes: Record<string, typeof appointmentExamTypes[number]> = {
  LABORATORIAIS: "laboratorial",
  USG_TRANSVAGINAL: "usg_tv",
  USG_MANA: "usg_mama",
  PREVENTIVO: "preventivo",
};
const appointmentExamMetadataSchema = z.array(z.object({
  examType: z.enum(appointmentExamTypes),
  examDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, "Data do exame inválida.").refine((value) => {
    const date = new Date(`${value}T00:00:00.000Z`);
    return !Number.isNaN(date.getTime()) && date.toISOString().slice(0, 10) === value;
  }, "Data do exame inválida.").nullable(),
})).max(10);
function parseAppointmentExamUploads(req: AuthRequest) {
  let rawMetadata: unknown;
  try { rawMetadata = JSON.parse(String(req.body.examMetadata || "[]")); }
  catch { throw new Error("Os dados dos exames anexados são inválidos."); }
  const normalizedMetadata = Array.isArray(rawMetadata) ? rawMetadata.map((item: any) => ({
    ...item,
    examType: legacyAppointmentExamTypes[item?.examType] || item?.examType,
    examDate: item?.examDate || null,
  })) : rawMetadata;
  const metadata = appointmentExamMetadataSchema.safeParse(normalizedMetadata);
  if (!metadata.success) throw new Error("Informe uma classificação válida e, se preenchida, uma data válida para cada exame.");
  const fileFields = (req.files || {}) as Record<string, Express.Multer.File[]>;
  const files = fileFields.examFiles || [];
  if (files.length !== metadata.data.length)
    throw new Error("Anexe um arquivo para cada exame informado.");
  return { files, metadata: metadata.data };
}
async function persistAppointmentExamAttachments(
  appointmentId: number,
  patientId: number,
  files: Express.Multer.File[],
  metadata: { examType: typeof appointmentExamTypes[number]; examDate: string | null }[],
  uploadedById: number,
) {
  if (!files.length) return;
  const patientDirectory = path.join(attachmentRoot, String(patientId));
  await fs.promises.mkdir(patientDirectory, { recursive: true });
  for (const [index, file] of files.entries()) {
    const storageKey = `${patientId}/${crypto.randomUUID()}${allowedAttachments[file.mimetype]}`;
    await fs.promises.writeFile(path.resolve(attachmentRoot, storageKey), file.buffer);
    await prisma.appointmentAttachment.create({
      data: {
        appointmentId,
        patientId,
        fileName: file.originalname,
        mimeType: file.mimetype,
        examType: metadata[index].examType,
        examDate: metadata[index].examDate ? new Date(`${metadata[index].examDate}T00:00:00.000Z`) : null,
        sizeBytes: file.size,
        storageKey,
        url: `/appointment-attachments/file?key=${encodeURIComponent(storageKey)}`,
        uploadedById,
      },
    });
  }
}
async function ensureAppointmentMedicalRecord(
  appointmentId: number,
  patientId: number,
  appointmentDate: Date,
  authorId: number,
) {
  const recordDate = new Date(`${appointmentDate.toISOString().slice(0, 10)}T00:00:00.000Z`);
  const existing = await prisma.medicalRecord.findFirst({ where: { appointmentId }, select: { id: true } });
  if (existing) {
    await prisma.medicalRecord.update({ where: { id: existing.id }, data: { recordDate } });
    return existing.id;
  }
  const created = await prisma.medicalRecord.create({
    data: { patientId, authorId, appointmentId, recordDate, title: "Agendamento", conduct: null },
    select: { id: true },
  });
  return created.id;
}

const medicalRecordSchema = z.object({
  patientId: z.coerce.number().int().positive(),
  appointmentId: z.coerce.number().int().positive().nullable().optional(),
  recordDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, "Data inválida."),
  title: requiredText,
  conduct: z.string().optional().nullable(),
});

const injectableRequestInclude = {
  injectable: { select: { id: true, name: true, type: true } },
  requestedBy: { select: { id: true, fullName: true } },
};
const examRequestInclude = {
  examGroup: {
    select: {
      id: true,
      name: true,
      items: {
        orderBy: { id: "asc" as const },
        include: { examType: { select: { id: true, code: true, name: true } } },
      },
    },
  },
  requestedBy: { select: { id: true, fullName: true } },
};
const procedureRequestInclude = {
  procedure: { select: { id: true, name: true, type: true, value: true } },
  requestedBy: { select: { id: true, fullName: true } },
};
const ultrasoundRequestInclude = {
  requestedBy: { select: { id: true, fullName: true } },
};
const medicalRecordInclude = {
  patient: { select: { id: true, fullName: true, phone: true, cpf: true } },
  author: { select: { id: true, fullName: true } },
  appointment: {
    select: {
      id: true,
      scheduledTime: true,
      appointmentDate: true,
      status: true,
      notes: true,
      attachments: {
        orderBy: { uploadedAt: "asc" as const },
        include: { uploadedBy: { select: { id: true, fullName: true } } },
      },
    },
  },
  attachments: {
    orderBy: { uploadedAt: "asc" as const },
    include: { uploadedBy: { select: { id: true, fullName: true } } },
  },
  examRequests: {
    orderBy: { requestedAt: "asc" as const },
    include: examRequestInclude,
  },
  injectableRequests: {
    orderBy: { requestedAt: "asc" as const },
    include: injectableRequestInclude,
  },
  procedureRequests: {
    orderBy: { requestedAt: "asc" as const },
    include: procedureRequestInclude,
  },
  ultrasoundRequests: {
    orderBy: { requestedAt: "asc" as const },
    include: ultrasoundRequestInclude,
  },
};
const examGroupInclude = {
  items: {
    orderBy: { id: "asc" as const },
    include: {
      examType: {
        select: { id: true, code: true, name: true, value: true, active: true },
      },
    },
  },
};

function pdfDate(value: Date | string) {
  return new Date(value).toLocaleDateString("pt-BR", {
    timeZone: clinicTimeZone,
  });
}
function pdfDateTime(value: Date) {
  return value.toLocaleString("pt-BR", {
    timeZone: clinicTimeZone,
    dateStyle: "short",
    timeStyle: "medium",
  });
}
function pdfMoney(value: unknown) {
  return `R$ ${Number(value || 0)
    .toFixed(2)
    .replace(".", ",")}`;
}
function certificateAttributes(pfx: Buffer, password: string) {
  const asn1 = forge.asn1.fromDer(pfx.toString("binary"));
  const p12 = forge.pkcs12.pkcs12FromAsn1(asn1, false, password);
  const bags = p12.getBags({ bagType: forge.pki.oids.certBag });
  const cert = bags[forge.pki.oids.certBag]?.[0]?.cert;
  if (!cert) throw new Error("Não foi possível ler o certificado digital.");
  const subject = cert.subject.attributes;
  const commonName = String(
    subject.find((item: any) => item.shortName === "CN")?.value ||
      "Titular do certificado",
  );
  const cpfMatch = commonName.match(/(?:^|:)\s*(\d{11})(?:$|:)/);
  const name = commonName.replace(/:\s*\d{11}\s*$/, "").trim();
  return {
    name,
    cpf: cpfMatch?.[1] || "Não identificado",
    subject: subject
      .map((item: any) => `${item.shortName}=${item.value}`)
      .join(", "),
    issuer: cert.issuer.attributes
      .map((item: any) => `${item.shortName}=${item.value}`)
      .join(", "),
    serialNumber: cert.serialNumber,
    validFrom: cert.validity.notBefore,
    validTo: cert.validity.notAfter,
  };
}
async function getActiveCertificateDetails() {
  const certificate = await prisma.digitalCertificate.findFirst({
    where: { active: true },
    orderBy: { createdAt: "desc" },
  });
  if (!certificate) return null;
  const pfx = decryptSecret(certificate.pfxEncrypted);
  const password = decryptSecret(certificate.passwordEncrypted).toString(
    "utf8",
  );
  return {
    ...certificateAttributes(pfx, password),
    certificate,
    pfx,
    password,
  };
}
async function signPdfWithActiveCertificate(pdfPath: string) {
  const details = await getActiveCertificateDetails();
  if (!details) return false;
  const pdfBuffer = fs.readFileSync(pdfPath);
  const placeholder = plainAddPlaceholder({
    pdfBuffer,
    reason: "Assinatura digital de pedido de exames laboratoriais",
    name: details.name,
    contactInfo: "MedClinic",
    location: "Brasil",
  });
  const signedPdf = await new SignPdf().sign(
    placeholder,
    new P12Signer(details.pfx, { passphrase: details.password }),
  );
  fs.writeFileSync(pdfPath, signedPdf);
  return true;
}
const ultrasoundTypeLabels: Record<string, string> = {
  MAMAS: "USG de mamas — Mamas / axilas",
  TRANSVAGINAL_ROTINA: "USG transvaginal — Rotina ginecológica",
  TRANSVAGINAL_PREPARO: "USG transvaginal — Com preparo intestinal",
};

async function generateUltrasoundRequestPdf(data: any) {
  const pdfPath = path.join(examRequestPdfRoot, `usg-${data.id}.pdf`);
  const certificate = await getActiveCertificateDetails();
  const doctor = data.medicalRecord?.appointment?.doctor;
  const signedAt = new Date();
  const qrBuffer = await QRCode.toBuffer(`https://validar.iti.gov.br/?documento=${encodeURIComponent(data.code)}`, { errorCorrectionLevel: "M", margin: 1, width: 70 });
  await new Promise<void>((resolve, reject) => {
    const doc = new PDFDocument({ size: "A4", margin: 48 });
    const stream = fs.createWriteStream(pdfPath);
    stream.on("finish", resolve); stream.on("error", reject); doc.on("error", reject); doc.pipe(stream);
    const wine = "#741447"; const pale = "#f8edf3"; const ink = "#29242a"; const gray = "#706970";
    doc.rect(0, 0, 595, 70).fill(pale); doc.rect(0, 0, 595, 5).fill(wine);
    doc.fillColor(wine).font("Helvetica-Bold").fontSize(23).text("intimavie", 48, 25);
    doc.fillColor("#76566b").font("Helvetica").fontSize(9).text("MEDICINA ÍNTIMA", 51, 50);
    doc.fillColor(wine).font("Helvetica-Bold").fontSize(8).text(`SOLICITAÇÃO DE USG  ${data.code}`, 365, 29, { width: 182, align: "right" });
    doc.fillColor(wine).font("Helvetica-Bold").fontSize(10).text("SOLICITAÇÃO DE ULTRASSONOGRAFIA", 48, 105);
    doc.fillColor(gray).font("Helvetica").fontSize(8).text("PACIENTE", 65, 135);
    doc.fillColor(ink).font("Helvetica-Bold").fontSize(15).text(String(data.patient?.fullName || "").toUpperCase(), 65, 149, { width: 465 });
    doc.roundedRect(48, 205, 499, 82, 8).fillAndStroke("#fff9fc", "#d9b2c7");
    doc.fillColor(wine).font("Helvetica-Bold").fontSize(11).text(ultrasoundTypeLabels[data.type] || "Ultrassonografia", 65, 224, { width: 465 });
    doc.fillColor(gray).font("Helvetica").fontSize(9).text("Descrição / indicação clínica", 65, 250);
    doc.fillColor(ink).font("Helvetica").fontSize(10).text(data.description || "Não informada", 65, 270, { width: 465, height: 70, ellipsis: true });
    doc.roundedRect(48, 620, 499, 142, 8).fillAndStroke("#fff9fc", "#d9b2c7");
    doc.fillColor(wine).font("Helvetica-Bold").fontSize(8).text("ASSINATURA DIGITAL", 65, 633);
    doc.fillColor(ink).font("Helvetica-Bold").fontSize(8).text(`Assinado digitalmente por ${certificate?.name || data.requestedBy?.fullName || "Médico"}`, 65, 651, { width: 350, ellipsis: true });
    doc.fillColor(gray).font("Helvetica").fontSize(7).text(`CPF: ${certificate?.cpf || "Não disponível"}`, 65, 667);
    doc.text(`CRM/UF: ${doctor?.crm || "Não informado"}`, 65, 681);
    doc.text(`Data e hora: ${pdfDateTime(signedAt)}`, 65, 695);
    doc.text("Padrão: PAdES — certificado ICP-Brasil", 65, 709);
    doc.image(qrBuffer, 465, 633, { width: 60, height: 60 });
    doc.fillColor(wine).font("Helvetica-Bold").fontSize(6.5).text("Documento assinado digitalmente conforme MP 2.200-2/2001", 65, 730);
    doc.fillColor(gray).font("Helvetica").fontSize(6.5).text("Validação: validar.iti.gov.br", 65, 744);
    doc.fillColor("#8d8189").fontSize(6.5).text("QR code direciona ao validador do ITI.", 447, 699, { width: 92, align: "center" });
    doc.fillColor("#8d8189").font("Helvetica").fontSize(7).text("Documento gerado pelo sistema Clínica Intimavie.", 195, 785, { width: 250, align: "center" });
    doc.end();
  });
  await signPdfWithActiveCertificate(pdfPath);
  return pdfPath;
}

async function generateExamRequestPdf(data: any) {
  const pdfPath = path.join(examRequestPdfRoot, `${data.id}.pdf`);
  const signedAt = new Date();
  const certificate = await getActiveCertificateDetails();
  const doctor = data.medicalRecord?.appointment?.doctor;
  const qrBuffer = await QRCode.toBuffer(
    `https://validar.iti.gov.br/?documento=${encodeURIComponent(data.code || `RX-${String(data.id).padStart(6, "0")}`)}`,
    { errorCorrectionLevel: "M", margin: 1, width: 82 },
  );
  const selectedExamTypeIds: number[] | null = Array.isArray(data.examTypeIds)
    ? data.examTypeIds.map((id: unknown) => Number(id))
    : null;
  const groupItems = data.examGroup?.items || [];
  const groupItemsById = new Map(
    groupItems.map((item: any) => [Number(item.examType?.id), item]),
  );
  const missingIds =
    selectedExamTypeIds?.filter((id) => !groupItemsById.has(id)) || [];
  const missingExams = missingIds.length
    ? await prisma.examType.findMany({
        where: { id: { in: missingIds }, active: true },
        select: { id: true, code: true, name: true, value: true },
      })
    : [];
  const items = selectedExamTypeIds
    ? selectedExamTypeIds
        .map(
          (id) =>
            groupItemsById.get(id) || {
              examType: missingExams.find((exam) => exam.id === id),
            },
        )
        .filter((item: any) => item?.examType)
    : groupItems;
  await new Promise<void>((resolve, reject) => {
    const doc = new PDFDocument({
      size: "A4",
      margin: 48,
      autoFirstPage: true,
    });
    const stream = fs.createWriteStream(pdfPath);
    stream.on("finish", resolve);
    stream.on("error", reject);
    doc.on("error", reject);
    doc.pipe(stream);
    const wine = "#741447";
    const pale = "#f8edf3";
    const ink = "#29242a";
    const gray = "#706970";
    const pageWidth = 499;
    const bottomLimit = 710;
    const drawBrand = (continuation = false) => {
      doc.rect(0, 0, 595, 70).fill(pale);
      doc.rect(0, 0, 595, 5).fill(wine);
      doc
        .fillColor(wine)
        .font("Helvetica-Bold")
        .fontSize(23)
        .text("intimavie", 48, 25);
      doc
        .fillColor("#76566b")
        .font("Helvetica")
        .fontSize(9)
        .text("MEDICINA ÍNTIMA", 51, 50);
      doc
        .fillColor(wine)
        .font("Helvetica-Bold")
        .fontSize(8)
        .text(
          "PEDIDO DE EXAMES " +
            `Código: ${data.code || `RX-${String(data.id).padStart(6, "0")}`}`,
          418,
          29,
          { width: 90, align: "right" },
        );
    };
    const drawTableHeader = (top: number) => {
      doc.rect(48, top, pageWidth, 25).fill(wine);
      doc
        .fillColor("#fff")
        .font("Helvetica-Bold")
        .fontSize(8)
        .text("CÓDIGO", 64, top + 8)
        .text("EXAME", 142, top + 8)
        .text("VALOR", 480, top + 8, { width: 50, align: "right" });
      return top + 25;
    };
    drawBrand();

    doc
      .fillColor(wine)
      .font("Helvetica-Bold")
      .fontSize(8)
      .text("PACIENTE", 65, 90);
    doc
      .fillColor(ink)
      .font("Helvetica-Bold")
      .fontSize(16)
      .text(String(data.patient?.fullName || "").toUpperCase(), 65, 103, {
        width: 465,
      });

    let y = drawTableHeader(140);
    let total = 0;
    items.forEach((item: any, index: number) => {
      const exam = item.examType || {};
      const value = Number(exam.value || 0);
      total += value;
      const rowHeight = 20;
      if (y + rowHeight > bottomLimit) {
        doc.addPage();
        drawBrand(true);
        y = drawTableHeader(112);
      }
      if (index % 2 === 0)
        doc.rect(48, y, pageWidth, rowHeight).fill("#fff8fc");
      doc
        .fillColor(wine)
        .font("Helvetica-Bold")
        .fontSize(8)
        .text(String(exam.code || "—"), 64, y + 7, { width: 68 });
      doc
        .fillColor(ink)
        .font("Helvetica")
        .fontSize(8)
        .text(String(exam.name || "Exame"), 142, y + 7, {
          width: 315,
          ellipsis: true,
        });
      doc.text(pdfMoney(value), 480, y + 7, { width: 50, align: "right" });
      doc
        .strokeColor("#eadde2")
        .moveTo(48, y + rowHeight)
        .lineTo(547, y + rowHeight)
        .stroke();
      y += rowHeight;
    });
    if (y + 96 > bottomLimit) {
      doc.addPage();
      drawBrand(true);
      y = 112;
    }
    doc.roundedRect(336, y + 18, 211, 45, 8).fillAndStroke(pale, "#d9b2c7");
    doc
      .fillColor(wine)
      .font("Helvetica-Bold")
      .fontSize(8)
      .text("VALOR TOTAL", 355, y + 30);
    doc
      .fontSize(18)
      .text(pdfMoney(total), 355, y + 40, { width: 172, align: "right" });
    const requiredHeight = 145;
    const finalStampY = 620;
    if (y + 96 > finalStampY) {
      doc.addPage();
      drawBrand(true);
    }
    doc
      .roundedRect(48, finalStampY, pageWidth, requiredHeight, 8)
      .fillAndStroke("#fff9fc", "#d9b2c7");
    doc
      .fillColor(wine)
      .font("Helvetica-Bold")
      .fontSize(8)
      .text("ASSINATURA DIGITAL", 65, finalStampY + 12, { width: 330 });
    doc
      .fillColor(ink)
      .font("Helvetica-Bold")
      .fontSize(8)
      .text(
        `Assinado digitalmente por ${certificate?.name || data.requestedBy?.fullName || "Médico"}`,
        65,
        finalStampY + 30,
        { width: 350, ellipsis: true },
      );
    doc
      .fillColor(gray)
      .font("Helvetica")
      .fontSize(7)
      .text(
        `CPF: ${certificate?.cpf || "Não disponível"}`,
        65,
        finalStampY + 46,
      );
    doc.text(`CRM/UF: ${doctor?.crm || "Não informado"}`, 65, finalStampY + 60);
    doc.text(`Data e hora: ${pdfDateTime(signedAt)}`, 65, finalStampY + 74);
    doc.text("Padrão: PAdES — certificado ICP-Brasil", 65, finalStampY + 88);
    doc.image(qrBuffer, 463, finalStampY + 12, { width: 64, height: 64 });
    doc
      .fillColor(wine)
      .font("Helvetica-Bold")
      .fontSize(7)
      .text(
        "Documento assinado digitalmente conforme MP 2.200-2/2001",
        65,
        finalStampY + 111,
      );
    doc
      .fillColor(gray)
      .font("Helvetica")
      .fontSize(7)
      .text(
        "Validação: validar.iti.gov.br",
        65,
        finalStampY + 126,
      );
    doc
      .fillColor("#8d8189")
      .fontSize(7)
      .text("QR code direciona ao validador do ITI.", 447, finalStampY + 80, {
        width: 92,
        align: "center",
      });
    doc
      .fillColor("#8d8189")
      .font("Helvetica")
      .fontSize(7)
      .text("Documento gerado pelo sistema Clínica Intimavie.", 195, 785, {
        width: 250,
        align: "center",
      });
    doc.end();
  });
  await signPdfWithActiveCertificate(pdfPath);
  return pdfPath;
}

async function validateAppointmentInsurance(
  data: z.infer<typeof appointmentSchema>,
) {
  if (data.itemType === AppointmentItemType.ATENDIMENTO && data.attendanceId) {
    const attendance = await prisma.attendance.findUnique({
      where: { id: data.attendanceId },
      select: { insuranceId: true },
    });
    if (!attendance || attendance.insuranceId !== data.insuranceId)
      throw new Error(
        "O atendimento selecionado não pertence ao convênio informado.",
      );
  }
}

function appointmentData(data: z.infer<typeof appointmentSchema>) {
  const isAttendance = data.itemType === AppointmentItemType.ATENDIMENTO;
  if (isAttendance && !data.attendanceId)
    throw new Error("Selecione um atendimento.");
  if (!isAttendance && !data.procedureId)
    throw new Error("Selecione um procedimento.");
  return {
    ...data,
    appointmentDate: new Date(`${data.appointmentDate}T00:00:00.000Z`),
    attendanceId: isAttendance ? data.attendanceId : null,
    procedureId: isAttendance ? null : data.procedureId,
  };
}
async function clinicalRequestRecord(id: number) {
  const record = await prisma.medicalRecord.findUnique({
    where: { id },
    select: {
      id: true,
      patientId: true,
      appointmentId: true,
      recordDate: true,
    },
  });
  const todayDate = clinicTodayDate();
  if (
    !record ||
    !record.appointmentId ||
    record.recordDate.toISOString().slice(0, 10) !== todayDate
  )
    return null;
  const appointment = await prisma.appointment.findFirst({
    where: {
      id: record.appointmentId,
      patientId: record.patientId,
      appointmentDate: new Date(`${todayDate}T00:00:00.000Z`),
      status: AppointmentStatus.EM_ATENDIMENTO,
    },
    select: { id: true },
  });
  return appointment ? record : null;
}
app.get("/api/health", (_req, res) =>
  res.json({ status: "ok", service: "MedClinic API" }),
);
app.post("/api/auth/login", async (req, res) => {
  const parsed = loginSchema.safeParse(req.body);
  if (!parsed.success)
    return res.status(400).json({ message: "Informe login e senha." });
  const user = await prisma.user.findUnique({
    where: { login: parsed.data.login },
  });
  if (!user || !(await bcrypt.compare(parsed.data.password, user.passwordHash)))
    return res.status(401).json({ message: "Login ou senha inválidos." });
  const token = signToken({
    id: user.id,
    profile: user.profile,
    login: user.login,
  });
  res.json({
    token,
    user: {
      id: user.id,
      fullName: user.fullName,
      login: user.login,
      profile: user.profile,
    },
  });
});
app.get("/api/auth/me", auth, async (req: AuthRequest, res) => {
  const user = await prisma.user.findUnique({
    where: { id: req.user!.id },
    select: { id: true, fullName: true, login: true, profile: true },
  });
  res.json(user);
});

const patientSchema = z.object({
  sourceCode: z.preprocess(
    (value) =>
      value === "" || value === null || value === undefined ? null : value,
    z.coerce.number().int().positive().nullable().optional(),
  ),
  recordNumber: z.preprocess(
    (value) => (value === "" ? null : value),
    z.string().trim().optional().nullable(),
  ),
  fullName: requiredText,
  sex: z.coerce.number().int().optional().nullable(),
  maritalStatus: z.coerce.number().int().optional().nullable(),
  cpf: z.string().trim().optional().nullable(),
  email: z.string().trim().email().optional().nullable().or(z.literal("")),
  phone: z.string().trim().optional().nullable(),
  birthDate: z.coerce.date().optional().nullable(),
  insuranceCode: z.coerce.number().int().optional().nullable(),
  notes: z.string().optional().nullable(),
  allergies: z.string().trim().optional().nullable(),
  comorbidities: z.string().trim().optional().nullable(),
  medicationsInUse: z.string().trim().optional().nullable(),
  removePhoto: z.preprocess(
    (value) => value === true || value === "true" || value === "1",
    z.boolean(),
  ).optional(),
});

// Pacientes são acessíveis a qualquer perfil autenticado.
app.get("/api/patients", auth, async (_req, res) => {
  const [patients, insurances] = await Promise.all([
    prisma.patient.findMany({ orderBy: { fullName: "asc" } }),
    prisma.insurance.findMany({ select: { id: true, name: true } }),
  ]);
  const insuranceNames = new Map(
    insurances.map((insurance) => [insurance.id, insurance.name]),
  );
  res.json(
    patients.map((patient) => ({
      ...patient,
      insuranceName: patient.insuranceCode
        ? insuranceNames.get(patient.insuranceCode) || null
        : null,
      photoUrl: patient.photoStorageKey
        ? `/patients/${patient.id}/photo`
        : null,
    })),
  );
});
app.get("/api/insurances", auth, async (_req, res) => {
  res.json(
    await prisma.insurance.findMany({
      where: { active: true },
      select: { id: true, name: true, active: true },
      orderBy: { name: "asc" },
    }),
  );
});
app.get("/api/patients/:id/photo", auth, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  const patient = await prisma.patient.findUnique({
    where: { id },
    select: { photoStorageKey: true },
  });
  if (!patient?.photoStorageKey) return res.status(404).json({ message: "Foto não encontrada." });
  const filePath = path.resolve(patientPhotoRoot, patient.photoStorageKey);
  if (!filePath.startsWith(`${patientPhotoRoot}${path.sep}`))
    return res.status(404).json({ message: "Foto não encontrada." });
  if (!fs.existsSync(filePath)) return res.status(404).json({ message: "Foto não encontrada." });
  res.sendFile(filePath);
});
app.post("/api/patients", auth, patientPhotoUpload.single("photo"), async (req, res) => {
  const parsed = patientSchema.safeParse(req.body);
  if (!parsed.success)
    return res
      .status(400)
      .json({ message: "Preencha nome e código do paciente corretamente." });
  if (
    parsed.data.insuranceCode !== null &&
    parsed.data.insuranceCode !== undefined
  ) {
    const insurance = await prisma.insurance.findUnique({
      where: { id: parsed.data.insuranceCode },
      select: { id: true },
    });
    if (!insurance)
      return res.status(400).json({
        message: "O convênio selecionado não está cadastrado no sistema.",
      });
  }
  const { removePhoto: _removePhoto, ...patientData } = parsed.data;
  const patient = await prisma.patient.create({ data: patientData });
  if (req.file) {
    const extension = req.file.mimetype === "image/png" ? ".png" : ".jpg";
    const storageKey = `${patient.id}/${crypto.randomUUID()}${extension}`;
    await fs.promises.mkdir(path.join(patientPhotoRoot, String(patient.id)), { recursive: true });
    await fs.promises.writeFile(path.join(patientPhotoRoot, storageKey), req.file.buffer);
    return res.status(201).json(await prisma.patient.update({
      where: { id: patient.id },
      data: { photoStorageKey: storageKey },
    }));
  }
  res.status(201).json(patient);
});
app.put("/api/patients/:id", auth, patientPhotoUpload.single("photo"), async (req, res) => {
  const parsed = patientSchema.safeParse(req.body);
  if (!parsed.success)
    return res.status(400).json({ message: "Dados do paciente inválidos." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  if (
    parsed.data.insuranceCode !== null &&
    parsed.data.insuranceCode !== undefined
  ) {
    const insurance = await prisma.insurance.findUnique({
      where: { id: parsed.data.insuranceCode },
      select: { id: true },
    });
    if (!insurance)
      return res.status(400).json({
        message: "O convênio selecionado não está cadastrado no sistema.",
      });
  }
  const current = await prisma.patient.findUnique({
    where: { id },
    select: { photoStorageKey: true },
  });
  const { removePhoto, ...patientData } = parsed.data;
  const data: typeof patientData & { photoStorageKey?: string | null } = { ...patientData };
  let oldPhoto: string | null = null;
  if (req.file) {
    const extension = req.file.mimetype === "image/png" ? ".png" : ".jpg";
    data.photoStorageKey = `${id}/${crypto.randomUUID()}${extension}`;
    oldPhoto = current?.photoStorageKey || null;
    await fs.promises.mkdir(path.join(patientPhotoRoot, String(id)), { recursive: true });
    await fs.promises.writeFile(path.join(patientPhotoRoot, data.photoStorageKey), req.file.buffer);
  } else if (removePhoto) {
    data.photoStorageKey = null;
    oldPhoto = current?.photoStorageKey || null;
  }
  const patient = await prisma.patient.update({ where: { id }, data });
  if (oldPhoto) {
    await fs.promises.unlink(path.resolve(patientPhotoRoot, oldPhoto)).catch(() => undefined);
  }
  res.json(patient);
});
app.delete("/api/patients/:id", auth, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  const patient = await prisma.patient.findUnique({ where: { id }, select: { photoStorageKey: true } });
  await prisma.patient.delete({ where: { id } });
  if (patient?.photoStorageKey)
    await fs.promises.unlink(path.resolve(patientPhotoRoot, patient.photoStorageKey)).catch(() => undefined);
  res.status(204).send();
});

app.get(
  "/api/medical-records",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const rawPatientId = req.query.patientId;
    const patientId = rawPatientId ? Number(rawPatientId) : undefined;
    if (
      patientId !== undefined &&
      (!Number.isInteger(patientId) || patientId <= 0)
    )
      return res.status(400).json({ message: "Paciente inválido." });
    res.json(
      await prisma.medicalRecord.findMany({
        where: patientId ? { patientId } : undefined,
        orderBy: [{ recordDate: "desc" }, { createdAt: "desc" }],
        include: medicalRecordInclude,
      }),
    );
  },
);
app.post(
  "/api/medical-records",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const parsed = medicalRecordSchema.safeParse(req.body);
    if (!parsed.success)
      return res.status(400).json({
        message: "Preencha a data, o título e o paciente do prontuário.",
      });
    if (parsed.data.appointmentId) {
      const appointment = await prisma.appointment.findUnique({
        where: { id: parsed.data.appointmentId },
        select: { id: true, patientId: true, status: true },
      });
      if (!appointment)
        return res.status(404).json({ message: "Agendamento não encontrado." });
      if (appointment.patientId !== parsed.data.patientId)
        return res.status(400).json({ message: "O agendamento não pertence a este paciente." });
      if (appointment.status === AppointmentStatus.ATENDIDO)
        return res.status(409).json({ message: "Este agendamento já foi finalizado e não aceita um novo atendimento." });
    }
    const data = {
      ...parsed.data,
      recordDate: new Date(`${parsed.data.recordDate}T00:00:00.000Z`),
      authorId: req.user!.id,
    };
    res.status(201).json(
      await prisma.medicalRecord.create({
        data,
        include: medicalRecordInclude,
      }),
    );
  },
);
app.put(
  "/api/medical-records/:id",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const parsed = medicalRecordSchema.safeParse(req.body);
    if (!parsed.success)
      return res.status(400).json({
        message: "Preencha a data, o título e o paciente do prontuário.",
      });
    const id = routeId(req, res, req.body?.id);
    if (id === null) return;
    const data = {
      ...parsed.data,
      recordDate: new Date(`${parsed.data.recordDate}T00:00:00.000Z`),
    };
    res.json(
      await prisma.medicalRecord.update({
        where: { id },
        data,
        include: medicalRecordInclude,
      }),
    );
  },
);
app.post(
  "/api/medical-records/:id/finalize",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const id = routeId(req, res);
    if (id === null) return;
    const record = await prisma.medicalRecord.findUnique({
      where: { id },
      select: { appointmentId: true },
    });
    if (!record?.appointmentId)
      return res.status(400).json({
        message: "Este prontuário não está vinculado a um agendamento.",
      });
    const appointment = await prisma.appointment.update({
      where: { id: record.appointmentId },
      data: { status: AppointmentStatus.ATENDIDO },
      select: { id: true, status: true },
    });
    res.json(appointment);
  },
);
app.delete("/api/medical-records/:id", auth, doctorOnly, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.medicalRecord.delete({ where: { id } });
  res.status(204).send();
});

app.post(
  "/api/medical-records/:id/attachments",
  auth,
  doctorOnly,
  attachmentUpload.single("file"),
  async (req: AuthRequest, res) => {
    const id = routeId(req, res);
    if (id === null) return;
    if (!req.file)
      return res
        .status(400)
        .json({ message: "Selecione um arquivo PDF, JPG ou PNG." });
    const record = await prisma.medicalRecord.findUnique({
      where: { id },
      select: { id: true, patientId: true },
    });
    if (!record) {
      return res.status(404).json({ message: "Prontuário não encontrado." });
    }
    const patientDirectory = path.join(
      attachmentRoot,
      String(record.patientId),
    );
    await fs.promises.mkdir(patientDirectory, { recursive: true });
    const storageKey = `${record.patientId}/${crypto.randomUUID()}${allowedAttachments[req.file.mimetype]}`;
    const filePath = path.resolve(attachmentRoot, storageKey);
    await fs.promises.writeFile(filePath, req.file.buffer);
    const attachment = await prisma.medicalRecordAttachment.create({
      data: {
        medicalRecordId: record.id,
        patientId: record.patientId,
        fileName: req.file.originalname,
        mimeType: req.file.mimetype,
        sizeBytes: req.file.size,
        storageKey,
        url: `/medical-record-attachments/file?key=${encodeURIComponent(storageKey)}`,
        uploadedById: req.user!.id,
      },
      include: { uploadedBy: { select: { id: true, fullName: true } } },
    });
    res.status(201).json(attachment);
  },
);

app.get(
  "/api/medical-record-attachments/file",
  auth,
  doctorOnly,
  async (req, res) => {
    const storageKey = String(req.query.key || "");
    const attachment = await prisma.medicalRecordAttachment.findFirst({
      where: { storageKey },
      select: { storageKey: true, fileName: true, mimeType: true },
    });
    if (!attachment)
      return res.status(404).json({ message: "Anexo não encontrado." });
    const filePath = path.resolve(attachmentRoot, attachment.storageKey);
    if (!filePath.startsWith(`${attachmentRoot}${path.sep}`))
      return res.status(400).json({ message: "Arquivo inválido." });
    res.type(attachment.mimeType).download(filePath, attachment.fileName);
  },
);

app.get(
  "/api/medical-record-attachments/:storageKey/file",
  auth,
  doctorOnly,
  async (req, res) => {
    const attachment = await prisma.medicalRecordAttachment.findFirst({
      where: { storageKey: String(req.params.storageKey) },
      select: { storageKey: true, fileName: true, mimeType: true },
    });
    if (!attachment)
      return res.status(404).json({ message: "Anexo não encontrado." });
    const filePath = path.resolve(attachmentRoot, attachment.storageKey);
    if (!filePath.startsWith(`${attachmentRoot}${path.sep}`))
      return res.status(400).json({ message: "Arquivo inválido." });
    res.type(attachment.mimeType).download(filePath, attachment.fileName);
  },
);

app.delete(
  "/api/medical-record-attachments/:id",
  auth,
  doctorOnly,
  async (req, res) => {
    const id = routeId(req, res);
    if (id === null) return;
    const attachment = await prisma.medicalRecordAttachment.findUnique({
      where: { id },
      select: { storageKey: true },
    });
    if (!attachment)
      return res.status(404).json({ message: "Anexo não encontrado." });
    await prisma.medicalRecordAttachment.delete({ where: { id } });
    await fs.promises
      .unlink(path.resolve(attachmentRoot, attachment.storageKey))
      .catch(() => undefined);
    res.status(204).send();
  },
);

app.get("/api/exam-types/catalog", auth, doctorOnly, async (_req, res) => {
  res.json(
    await prisma.examType.findMany({
      where: { active: true },
      orderBy: [{ name: "asc" }, { code: "asc" }],
      select: { id: true, code: true, name: true, value: true, active: true },
    }),
  );
});
app.get("/api/injectables/catalog", auth, doctorOnly, async (_req, res) => {
  res.json(
    await prisma.injectable.findMany({
      orderBy: [{ type: "asc" }, { name: "asc" }],
      select: { id: true, name: true, type: true },
    }),
  );
});
app.get("/api/procedures/catalog", auth, doctorOnly, async (_req, res) => {
  res.json(
    await prisma.procedure.findMany({
      where: { active: true },
      orderBy: { name: "asc" },
      select: { id: true, name: true, type: true, value: true },
    }),
  );
});
app.get("/api/exam-groups", auth, doctorOnly, async (req: AuthRequest, res) => {
  res.json(
    await prisma.examGroup.findMany({
      where: { createdById: req.user!.id },
      orderBy: { name: "asc" },
      include: examGroupInclude,
    }),
  );
});
app.post(
  "/api/exam-groups",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const parsed = examGroupSchema.safeParse(req.body);
    if (!parsed.success)
      return res
        .status(400)
        .json({ message: "Informe o nome e selecione pelo menos um exame." });
    const exams = await prisma.examType.findMany({
      where: { id: { in: parsed.data.examTypeIds }, active: true },
      select: { id: true },
    });
    if (exams.length !== parsed.data.examTypeIds.length)
      return res.status(400).json({
        message: "Um ou mais exames selecionados não estão disponíveis.",
      });
    const group = await prisma.examGroup.create({
      data: {
        name: parsed.data.name,
        createdById: req.user!.id,
        items: {
          create: parsed.data.examTypeIds.map((examTypeId) => ({ examTypeId })),
        },
      },
      include: examGroupInclude,
    });
    res.status(201).json(group);
  },
);
app.put(
  "/api/exam-groups/:id",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const parsed = examGroupSchema.safeParse(req.body);
    if (!parsed.success)
      return res
        .status(400)
        .json({ message: "Informe o nome e selecione pelo menos um exame." });
    const id = routeId(req, res);
    if (id === null) return;
    const existing = await prisma.examGroup.findFirst({
      where: { id, createdById: req.user!.id },
    });
    if (!existing)
      return res
        .status(404)
        .json({ message: "Grupo de exames não encontrado." });
    const exams = await prisma.examType.findMany({
      where: { id: { in: parsed.data.examTypeIds }, active: true },
      select: { id: true },
    });
    if (exams.length !== parsed.data.examTypeIds.length)
      return res.status(400).json({
        message: "Um ou mais exames selecionados não estão disponíveis.",
      });
    const group = await prisma.$transaction(async (tx) => {
      await tx.examGroupItem.deleteMany({ where: { groupId: id } });
      return tx.examGroup.update({
        where: { id },
        data: {
          name: parsed.data.name,
          items: {
            create: parsed.data.examTypeIds.map((examTypeId) => ({
              examTypeId,
            })),
          },
        },
        include: examGroupInclude,
      });
    });
    res.json(group);
  },
);
app.delete(
  "/api/exam-groups/:id",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const id = routeId(req, res);
    if (id === null) return;
    const existing = await prisma.examGroup.findFirst({
      where: { id, createdById: req.user!.id },
      select: { id: true },
    });
    if (!existing)
      return res
        .status(404)
        .json({ message: "Grupo de exames não encontrado." });
    await prisma.examGroup.delete({ where: { id } });
    res.status(204).send();
  },
);

app.post(
  "/api/medical-records/:id/exam-requests",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const parsed = examRequestSchema.safeParse(req.body);
    if (!parsed.success)
      return res
        .status(400)
        .json({ message: "Selecione pelo menos um grupo de exames." });
    const medicalRecordId = routeId(req, res);
    if (medicalRecordId === null) return;
    const record = await clinicalRequestRecord(medicalRecordId);
    if (!record)
      return res.status(404).json({ message: "Prontuário não encontrado." });
    const requestedGroups = parsed.data.groups.map((group) => ({
      examGroupId: group.examGroupId,
      examTypeIds: [...new Set(group.examTypeIds)],
    }));
    const groupIds = [
      ...new Set(requestedGroups.map((group) => group.examGroupId)),
    ];
    const groups = await prisma.examGroup.findMany({
      where: { id: { in: groupIds }, createdById: req.user!.id },
      select: { id: true, name: true },
    });
    if (groups.length !== groupIds.length)
      return res.status(400).json({
        message: "Um ou mais grupos não estão disponíveis para este médico.",
      });
    const groupMap = new Map(groups.map((group) => [group.id, group]));
    const selectedExamTypeIds = [
      ...new Set(requestedGroups.flatMap((group) => group.examTypeIds)),
    ];
    const activeExams = await prisma.examType.findMany({
      where: { id: { in: selectedExamTypeIds }, active: true },
      select: { id: true },
    });
    if (activeExams.length !== selectedExamTypeIds.length)
      return res.status(400).json({
        message:
          "Um ou mais exames selecionados não estão ativos ou disponíveis.",
      });
    const existing = await prisma.examRequest.findMany({
      where: { medicalRecordId, examGroupId: { in: groupIds } },
      select: { examGroupId: true },
    });
    const existingIds = new Set(existing.map((item) => item.examGroupId));
    const pending = requestedGroups.filter(
      (group) => !existingIds.has(group.examGroupId),
    );
    const createdIds: number[] = [];
    if (pending.length > 0) {
      await prisma.$transaction(async (tx) => {
        for (const group of pending) {
          const created = await tx.examRequest.create({
            data: {
              medicalRecordId,
              patientId: record.patientId,
              examGroupId: group.examGroupId,
              examTypeIds: group.examTypeIds,
              groupName: groupMap.get(group.examGroupId)!.name,
              code: `TMP-${crypto.randomBytes(6).toString("hex")}`,
              requestedById: req.user!.id,
            },
          });
          const code = `RX-${String(created.id).padStart(6, "0")}`;
          await tx.examRequest.update({
            where: { id: created.id },
            data: {
              code,
              pdfUrl: `/medical-record-exam-requests/${created.id}/pdf`,
            },
          });
          createdIds.push(created.id);
        }
      });
      for (const id of createdIds) {
        const created = await prisma.examRequest.findUnique({
          where: { id },
          include: {
            patient: {
              select: {
                fullName: true,
                cpf: true,
                phone: true,
                birthDate: true,
              },
            },
            examGroup: {
              select: {
                name: true,
                items: {
                  orderBy: { id: "asc" },
                  include: {
                    examType: {
                      select: { id: true, code: true, name: true, value: true },
                    },
                  },
                },
              },
            },
            requestedBy: { select: { fullName: true } },
            medicalRecord: {
              select: {
                appointment: {
                  select: { doctor: { select: { fullName: true, crm: true } } },
                },
              },
            },
          },
        });
        if (created) await generateExamRequestPdf(created);
      }
    }
    res.status(201).json(
      await prisma.examRequest.findMany({
        where: { medicalRecordId },
        orderBy: { requestedAt: "asc" },
        include: examRequestInclude,
      }),
    );
  },
);

app.get(
  "/api/medical-record-exam-requests/:id/pdf",
  auth,
  clinicalRequestReadAccess,
  async (req: AuthRequest, res) => {
    const id = routeId(req, res);
    if (id === null) return;
    const examRequest = await prisma.examRequest.findUnique({
      where: { id },
      include: {
        patient: {
          select: { fullName: true, cpf: true, phone: true, birthDate: true },
        },
        examGroup: {
          select: {
            name: true,
            items: {
              orderBy: { id: "asc" },
              include: {
                examType: {
                  select: { id: true, code: true, name: true, value: true },
                },
              },
            },
          },
        },
        requestedBy: { select: { fullName: true } },
        medicalRecord: {
          select: {
            appointment: {
              select: { doctor: { select: { fullName: true, crm: true } } },
            },
          },
        },
      },
    });
    if (!examRequest)
      return res
        .status(404)
        .json({ message: "Pedido de exames não encontrado." });
    const pdfPath = path.join(examRequestPdfRoot, `${examRequest.id}.pdf`);
    await generateExamRequestPdf(examRequest);
    res.type("application/pdf").sendFile(pdfPath, {
      headers: {
        "Content-Disposition": `inline; filename="${examRequest.code || `RX-${String(examRequest.id).padStart(6, "0")}`}.pdf"`,
      },
    });
  },
);

app.post(
  "/api/medical-records/:id/ultrasound-requests",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const parsed = ultrasoundRequestSchema.safeParse(req.body);
    if (!parsed.success) return res.status(400).json({ message: "Selecione pelo menos um exame de ultrassonografia." });
    const medicalRecordId = routeId(req, res);
    if (medicalRecordId === null) return;
    const record = await clinicalRequestRecord(medicalRecordId);
    if (!record) return res.status(404).json({ message: "Prontuário não encontrado ou atendimento não iniciado hoje." });
    const uniqueRequests = [...new Map(parsed.data.requests.map((item) => [item.type, item])).values()];
    const existing = await prisma.ultrasoundRequest.findMany({ where: { medicalRecordId, type: { in: uniqueRequests.map((item) => item.type) } }, select: { type: true } });
    const existingTypes = new Set(existing.map((item) => item.type));
    const pending = uniqueRequests.filter((item) => !existingTypes.has(item.type));
    const createdIds: number[] = [];
    await prisma.$transaction(async (tx) => {
      for (const item of pending) {
        const created = await tx.ultrasoundRequest.create({ data: { medicalRecordId, patientId: record.patientId, type: item.type, description: item.description || null, code: `TMP-USG-${crypto.randomBytes(4).toString("hex")}`, requestedById: req.user!.id } });
        const code = `USG-${String(created.id).padStart(6, "0")}`;
        await tx.ultrasoundRequest.update({ where: { id: created.id }, data: { code, pdfUrl: `/medical-record-ultrasound-requests/${created.id}/pdf` } });
        createdIds.push(created.id);
      }
    });
    for (const id of createdIds) {
      const created = await prisma.ultrasoundRequest.findUnique({ where: { id }, include: { patient: { select: { fullName: true, cpf: true, birthDate: true } }, requestedBy: { select: { fullName: true } }, medicalRecord: { select: { appointment: { select: { doctor: { select: { fullName: true, crm: true } } } } } } } });
      if (created) await generateUltrasoundRequestPdf(created);
    }
    res.status(201).json(await prisma.ultrasoundRequest.findMany({ where: { medicalRecordId }, orderBy: { requestedAt: "asc" }, include: ultrasoundRequestInclude }));
  },
);

app.get(
  "/api/medical-record-ultrasound-requests/:id/pdf",
  auth,
  clinicalRequestReadAccess,
  async (req: AuthRequest, res) => {
    const id = routeId(req, res);
    if (id === null) return;
    const ultrasoundRequest = await prisma.ultrasoundRequest.findUnique({ where: { id }, include: { patient: { select: { fullName: true, cpf: true, birthDate: true } }, requestedBy: { select: { fullName: true } }, medicalRecord: { select: { appointment: { select: { doctor: { select: { fullName: true, crm: true } } } } } } } });
    if (!ultrasoundRequest) return res.status(404).json({ message: "Solicitação de USG não encontrada." });
    const pdfPath = await generateUltrasoundRequestPdf(ultrasoundRequest);
    res.type("application/pdf").sendFile(pdfPath, { headers: { "Content-Disposition": `inline; filename="${ultrasoundRequest.code}.pdf"` } });
  },
);

app.post(
  "/api/medical-records/:id/injectable-requests",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const parsed = injectableRequestSchema.safeParse(req.body);
    if (!parsed.success)
      return res.status(400).json({
        message: "Selecione pelo menos um injetável e informe via e sessões.",
      });
    const medicalRecordId = routeId(req, res);
    if (medicalRecordId === null) return;
    const record = await clinicalRequestRecord(medicalRecordId);
    if (!record)
      return res.status(403).json({
        message:
          "As solicitações de injetáveis estão disponíveis somente no novo registro do atendimento iniciado hoje.",
      });
    const items = parsed.data.items.filter(
      (item, index, all) =>
        all.findIndex((other) => other.injectableId === item.injectableId) ===
        index,
    );
    const ids = items.map((item) => item.injectableId);
    const injectables = await prisma.injectable.findMany({
      where: { id: { in: ids } },
      select: { id: true, name: true, type: true },
    });
    if (injectables.length !== ids.length)
      return res
        .status(400)
        .json({ message: "Um ou mais injetáveis não estão cadastrados." });
    const existing = await prisma.injectableRequest.findMany({
      where: { medicalRecordId, injectableId: { in: ids } },
      select: { injectableId: true },
    });
    const existingIds = new Set(existing.map((item) => item.injectableId));
    const data = items
      .filter((item) => !existingIds.has(item.injectableId))
      .map((item) => {
        const injectable = injectables.find(
          (row) => row.id === item.injectableId,
        )!;
        return {
          medicalRecordId,
          patientId: record.patientId,
          injectableId: item.injectableId,
          name: injectable.name,
          category: injectable.type,
          route: item.route as any,
          sessions: item.sessions,
          observation: item.observation || null,
          requestedById: req.user!.id,
        };
      });
    if (data.length) await prisma.injectableRequest.createMany({ data });
    res.status(201).json(
      await prisma.injectableRequest.findMany({
        where: { medicalRecordId },
        orderBy: { requestedAt: "asc" },
        include: injectableRequestInclude,
      }),
    );
  },
);

app.post(
  "/api/medical-records/:id/procedure-requests",
  auth,
  doctorOnly,
  async (req: AuthRequest, res) => {
    const rawIds = Array.isArray(req.body?.procedureIds)
      ? req.body.procedureIds
      : [];
    const procedureIds = Array.from(
      new Set(
        rawIds
          .map((raw: unknown) => Number(raw))
          .filter(
            (id: unknown): id is number =>
              typeof id === "number" && Number.isInteger(id) && id > 0,
          ),
      ),
    ) as number[];
    if (!procedureIds.length)
      return res
        .status(400)
        .json({ message: "Selecione pelo menos um procedimento." });
    const medicalRecordId = routeId(req, res);
    if (medicalRecordId === null) return;
    const record = await clinicalRequestRecord(medicalRecordId);
    if (!record)
      return res.status(403).json({
        message:
          "As solicitações de procedimentos estão disponíveis somente no novo registro do atendimento iniciado hoje.",
      });
    const procedures = await prisma.procedure.findMany({
      where: { id: { in: procedureIds }, active: true },
      select: { id: true, name: true, value: true },
    });
    if (procedures.length !== procedureIds.length)
      return res
        .status(400)
        .json({ message: "Um ou mais procedimentos não estão disponíveis." });
    const existing = await prisma.procedureRequest.findMany({
      where: { medicalRecordId, procedureId: { in: procedureIds } },
      select: { procedureId: true },
    });
    const existingIds = new Set(existing.map((item) => item.procedureId));
    const data = procedures
      .filter((item) => !existingIds.has(item.id))
      .map((item) => ({
        medicalRecordId,
        patientId: record.patientId,
        procedureId: item.id,
        name: item.name,
        value: item.value,
        requestedById: req.user!.id,
      }));
    if (data.length) await prisma.procedureRequest.createMany({ data });
    res.status(201).json(
      await prisma.procedureRequest.findMany({
        where: { medicalRecordId },
        orderBy: { requestedAt: "asc" },
        include: procedureRequestInclude,
      }),
    );
  },
);

app.get(
  "/api/appointments/meta",
  auth,
  appointmentAccess,
  async (_req, res) => {
    const [patients, doctors, activeInsurances, attendances, procedures] =
      await Promise.all([
        prisma.patient.findMany({
          orderBy: { fullName: "asc" },
          select: { id: true, fullName: true, phone: true, insuranceCode: true },
        }),
        prisma.doctor.findMany({
          orderBy: { fullName: "asc" },
          select: { id: true, fullName: true, specialty: true },
        }),
        prisma.insurance.findMany({
          where: { active: true },
          orderBy: { name: "asc" },
          select: { id: true, name: true, active: true },
        }),
        prisma.attendance.findMany({
          where: { active: true },
          orderBy: { name: "asc" },
          select: {
            id: true,
            name: true,
            insuranceId: true,
            insurance: { select: { name: true } },
          },
        }),
        prisma.procedure.findMany({
          where: { active: true },
          orderBy: { name: "asc" },
          select: { id: true, name: true, value: true },
        }),
      ]);
    const patientInsuranceIds = [...new Set(
      patients
        .map((patient) => patient.insuranceCode)
        .filter((insuranceId): insuranceId is number => insuranceId !== null),
    )];
    const patientInsurances = patientInsuranceIds.length
      ? await prisma.insurance.findMany({
          where: { id: { in: patientInsuranceIds } },
          select: { id: true, name: true, active: true },
        })
      : [];
    const insurancesById = new Map(
      [...activeInsurances, ...patientInsurances].map((insurance) => [
        insurance.id,
        insurance,
      ]),
    );
    const insurances = [...insurancesById.values()].sort((left, right) =>
      left.name.localeCompare(right.name, "pt-BR"),
    );
    res.json({ patients, doctors, insurances, attendances, procedures });
  },
);
app.get("/api/appointments/:id/anamnesis", auth, appointmentAccess, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  setAnamnesisNoStoreHeaders(res);
  const appointment = await prisma.appointment.findUnique({
    where: { id },
    include: {
      patient: { select: { id: true, insuranceCode: true } },
      insurance: { select: { name: true } },
    },
  });
  if (!appointment) return res.status(404).json({ message: "Agendamento não encontrado." });
  if (!(await isEligibleForAnamnesis(appointment)))
    return res.status(403).json({ message: "A ficha de anamnese está disponível apenas para pacientes do convênio SINDICATO." });
  const form = await prisma.patientAnamnesis.findUnique({ where: { appointmentId: id } });
  if (!form || form.patientId !== appointment.patientId || form.revokedAt)
    return res.json({ state: "not_created" });
  if (form.submittedAt)
    return res.json({ state: "submitted", answers: form.answers, submittedAt: form.submittedAt, consentAcceptedAt: form.consentAcceptedAt });
  return res.json({ state: "pending", expiresAt: form.expiresAt });
});

app.post("/api/appointments/:id/anamnesis-link", auth, appointmentAccess, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  setAnamnesisNoStoreHeaders(res);
  const appointment = await prisma.appointment.findUnique({
    where: { id },
    include: {
      patient: { select: { id: true, insuranceCode: true } },
      insurance: { select: { name: true } },
    },
  });
  if (!appointment) return res.status(404).json({ message: "Agendamento não encontrado." });
  if (!(await isEligibleForAnamnesis(appointment)))
    return res.status(403).json({ message: "A ficha de anamnese está disponível apenas para pacientes do convênio SINDICATO." });
  const existing = await prisma.patientAnamnesis.findUnique({ where: { appointmentId: id } });
  if (existing?.submittedAt)
    return res.status(409).json({ message: "A ficha deste agendamento já foi enviada." });

  const token = crypto.randomBytes(32).toString("base64url");
  const expiresAt = new Date(Date.now() + anamnesisTokenLifetimeMs);
  await prisma.patientAnamnesis.upsert({
    where: { appointmentId: id },
    create: {
      appointmentId: id,
      patientId: appointment.patientId,
      tokenHash: hashAnamnesisToken(token),
      expiresAt,
    },
    update: {
      patientId: appointment.patientId,
      tokenHash: hashAnamnesisToken(token),
      expiresAt,
      revokedAt: null,
    },
  });
  res.status(201).json({ token, expiresAt });
});

app.get("/api/medical-records/patients/:patientId/anamnesis", auth, doctorOnly, async (req, res) => {
  const patientId = Number(req.params.patientId);
  if (!Number.isInteger(patientId) || patientId <= 0)
    return res.status(400).json({ message: "Paciente inválido." });
  const appointments = await prisma.appointment.findMany({
    where: { patientId },
    orderBy: [{ appointmentDate: "desc" }, { createdAt: "desc" }],
    take: 30,
    include: {
      patient: { select: { id: true, fullName: true, phone: true, insuranceCode: true } },
      insurance: { select: { name: true } },
    },
  });
  const eligibleAppointments: typeof appointments = [];
  for (const appointment of appointments) {
    if (await isEligibleForAnamnesis(appointment)) eligibleAppointments.push(appointment);
  }
  const forms = await prisma.patientAnamnesis.findMany({
    where: { patientId, revokedAt: null, submittedAt: { not: null } },
    orderBy: { submittedAt: "desc" },
  });
  const submittedForm = forms.find(form => eligibleAppointments.some(appointment => appointment.id === form.appointmentId));
  const appointment = submittedForm
    ? eligibleAppointments.find(item => item.id === submittedForm.appointmentId)
    : eligibleAppointments[0];
  if (!appointment) return res.json({ state: "not_created" });
  if (submittedForm) {
    return res.json({
      state: "submitted",
      appointmentId: appointment.id,
      appointmentDate: appointment.appointmentDate,
      scheduledTime: appointment.scheduledTime,
      insuranceName: appointment.insurance.name,
      submittedAt: submittedForm.submittedAt,
      answers: submittedForm.answers,
    });
  }
  const pendingForm = await prisma.patientAnamnesis.findUnique({ where: { appointmentId: appointment.id } });
  res.json({
    state: pendingForm && !pendingForm.revokedAt ? "pending" : "not_created",
    appointmentId: appointment.id,
    appointmentDate: appointment.appointmentDate,
    scheduledTime: appointment.scheduledTime,
    insuranceName: appointment.insurance.name,
    expiresAt: pendingForm?.expiresAt || null,
  });
});

app.post("/api/medical-records/patients/:patientId/anamnesis-link", auth, doctorOnly, async (req, res) => {
  const patientId = Number(req.params.patientId);
  if (!Number.isInteger(patientId) || patientId <= 0)
    return res.status(400).json({ message: "Paciente inválido." });
  const appointments = await prisma.appointment.findMany({
    where: { patientId },
    orderBy: [{ appointmentDate: "desc" }, { createdAt: "desc" }],
    take: 30,
    include: {
      patient: { select: { id: true, insuranceCode: true } },
      insurance: { select: { name: true } },
    },
  });
  const appointment = appointments.find(item => isSindicatoInsurance(item.insurance.name));
  if (!appointment || !(await isEligibleForAnamnesis(appointment)))
    return res.status(404).json({ message: "Nenhum agendamento elegível para anamnese foi encontrado." });
  const existing = await prisma.patientAnamnesis.findUnique({ where: { appointmentId: appointment.id } });
  if (existing?.submittedAt)
    return res.status(409).json({ message: "A anamnese deste paciente já foi preenchida." });
  const token = crypto.randomBytes(32).toString("base64url");
  const expiresAt = new Date(Date.now() + anamnesisTokenLifetimeMs);
  await prisma.patientAnamnesis.upsert({
    where: { appointmentId: appointment.id },
    create: { appointmentId: appointment.id, patientId, tokenHash: hashAnamnesisToken(token), expiresAt },
    update: { patientId, tokenHash: hashAnamnesisToken(token), expiresAt, revokedAt: null },
  });
  res.status(201).json({ token, expiresAt, appointmentId: appointment.id });
});

app.get("/api/public/anamnesis/:token", async (req, res) => {
  setAnamnesisNoStoreHeaders(res);
  const form = await findPublicAnamnesis(String(req.params.token || ""));
  if (!form)
    return res.status(404).json({ message: "Este link é inválido ou não está mais disponível. Solicite um novo QR Code à clínica." });
  res.json({
    orderNumber: String(form.appointment.id).padStart(6, "0"),
    appointmentDate: form.appointment.appointmentDate.toISOString().slice(0, 10),
    patient: {
      fullName: form.appointment.patient.fullName,
      cpf: form.appointment.patient.cpf,
      phone: form.appointment.patient.phone,
      birthDate: form.appointment.patient.birthDate?.toISOString().slice(0, 10) || "",
    },
  });
});

app.post("/api/public/anamnesis/:token", async (req, res) => {
  setAnamnesisNoStoreHeaders(res);
  const form = await findPublicAnamnesis(String(req.params.token || ""));
  if (!form)
    return res.status(404).json({ message: "Este link é inválido ou não está mais disponível. Solicite um novo QR Code à clínica." });
  const parsed = anamnesisSubmissionSchema.safeParse(req.body);
  if (!parsed.success)
    return res.status(400).json({ message: "Confira os campos preenchidos e tente enviar novamente." });
  if (!parsed.data.consentAccepted)
    return res.status(400).json({ message: "É necessário aceitar o uso dos dados conforme a LGPD para enviar a ficha." });

  const answers = parsed.data.answers;
  const today = clinicTodayDate();
  const isValidDate = (value: string) => {
    if (!value) return true;
    if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) return false;
    const date = new Date(`${value}T00:00:00.000Z`);
    return !Number.isNaN(date.getTime()) && date.toISOString().slice(0, 10) === value && value <= today;
  };
  if (
    answers.appointmentDate !== form.appointment.appointmentDate.toISOString().slice(0, 10) ||
    !isValidDate(answers.birthDate) ||
    !isValidDate(answers.lastMenstruationDate) ||
    (answers.lastPreventiveExam && (!/^\d{4}-(0[1-9]|1[0-2])$/.test(answers.lastPreventiveExam) || answers.lastPreventiveExam > today.slice(0, 7)))
  ) return res.status(400).json({ message: "Revise as datas: elas devem ser válidas e não podem estar no futuro." });

  let age = "";
  if (answers.birthDate) {
    const [birthYear, birthMonth, birthDay] = answers.birthDate.split("-").map(Number);
    const [todayYear, todayMonth, todayDay] = today.split("-").map(Number);
    const years = todayYear - birthYear - (todayMonth < birthMonth || (todayMonth === birthMonth && todayDay < birthDay) ? 1 : 0);
    if (years >= 0 && years < 130) age = String(years);
  }
  const savedAnswers = {
    ...answers,
    age,
    orderNumber: String(form.appointment.id).padStart(6, "0"),
    appointmentDate: form.appointment.appointmentDate.toISOString().slice(0, 10),
  };
  const submittedAt = new Date();
  const result = await prisma.patientAnamnesis.updateMany({
    where: { id: form.id, submittedAt: null, revokedAt: null, expiresAt: { gt: submittedAt } },
    data: {
      answers: savedAnswers as Prisma.InputJsonValue,
      consentAcceptedAt: submittedAt,
      consentVersion: anamnesisConsentVersion,
      submittedAt,
    },
  });
  if (result.count !== 1)
    return res.status(409).json({ message: "Esta ficha já foi enviada ou o link expirou." });
  res.status(201).json({ message: "Ficha enviada com sucesso." });
});

app.get(
  "/api/secretary/dashboard/attended-patients",
  auth,
  secretaryOnly,
  async (_req, res) => {
    const [appointments, imagingProcedures] = await Promise.all([
      prisma.appointment.findMany({
        where: { status: AppointmentStatus.ATENDIDO },
        orderBy: [
          { appointmentDate: "desc" },
          { scheduledTime: "desc" },
        ],
        include: {
          patient: { select: { id: true, fullName: true } },
          doctor: { select: { fullName: true } },
          medicalRecords: {
            orderBy: { recordDate: "desc" },
            include: {
              examRequests: {
                orderBy: { requestedAt: "desc" },
                include: {
                  examGroup: {
                    include: {
                      items: {
                        orderBy: { id: "asc" },
                        include: {
                          examType: { select: { name: true, value: true } },
                        },
                      },
                    },
                  },
                },
              },
              ultrasoundRequests: { orderBy: { requestedAt: "desc" } },
              injectableRequests: {
                orderBy: { requestedAt: "desc" },
                include: {
                  injectable: { select: { value: true } },
                },
              },
              procedureRequests: { orderBy: { requestedAt: "desc" } },
            },
          },
        },
      }),
      prisma.procedure.findMany({
        where: {
          type: ProcedureType.DIAGNOSTICO_POR_IMAGEM,
        },
        orderBy: [{ active: "desc" }, { updatedAt: "desc" }],
        select: { name: true, value: true },
      }),
    ]);

    const normalizeName = (value: string) =>
      value
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .toLocaleLowerCase("pt-BR")
        .replace(/[^a-z0-9]+/g, " ")
        .trim();
    const ultrasoundProcedure = (type: string) => {
      const procedure = imagingProcedures.find(({ name }) => {
        const normalized = normalizeName(name);
        if (type === "MAMAS")
          return normalized.includes("mama") && !normalized.includes("transvaginal") && !/\btv\b/.test(normalized);
        if (!normalized.includes("transvaginal") && !/\btv\b/.test(normalized)) return false;
        const hasPreparation = /\b(preparo|preparacao)\b/.test(normalized);
        return type === "TRANSVAGINAL_PREPARO"
          ? hasPreparation
          : !hasPreparation;
      });
      return procedure ? Number(procedure.value) : null;
    };
    const isPreventive = (value: string) =>
      /prevent|papanicolau|citopat|colpocit/.test(normalizeName(value));

    res.json(
      appointments.map((appointment) => ({
        id: appointment.id,
        date: appointment.appointmentDate,
        time: appointment.scheduledTime,
        patient: appointment.patient,
        doctor: appointment.doctor,
        requests: appointment.medicalRecords.flatMap((record) => [
          ...record.examRequests.map((item) => {
            const examItems = item.examGroup.items.map((groupItem) => ({
              label: groupItem.examType.name,
              value: Number(groupItem.examType.value),
            }));
            return {
              id: item.id,
              kind: "EXAME",
              category: isPreventive(`${item.groupName} ${examItems.map((exam) => exam.label).join(" ")}`)
                ? "Preventivo"
                : "Exames de sangue",
              title: item.groupName,
              code: item.code,
              requestedAt: item.requestedAt,
              amount: examItems.length
                ? examItems.reduce((sum, exam) => sum + exam.value, 0)
                : null,
              items: examItems,
              pdfPath: `/medical-record-exam-requests/${item.id}/pdf`,
            };
          }),
          ...record.ultrasoundRequests.map((item) => {
            const amount = ultrasoundProcedure(item.type);
            const names: Record<string, string> = {
              MAMAS: "Ultrassom de mamas",
              TRANSVAGINAL_ROTINA: "Ultrassom transvaginal de rotina",
              TRANSVAGINAL_PREPARO: "Ultrassom transvaginal com preparo",
            };
            return {
              id: item.id,
              kind: "ULTRASSOM",
              category: "Ultrassom",
              title: names[item.type] || item.type,
              code: item.code,
              requestedAt: item.requestedAt,
              amount,
              items: [{ label: item.description || names[item.type] || item.type, value: amount }],
              pdfPath: `/medical-record-ultrasound-requests/${item.id}/pdf`,
            };
          }),
          ...record.injectableRequests.map((item) => {
            const unitValue = Number(item.injectable.value);
            return {
              id: item.id,
              kind: "INJETAVEL",
              category: "Injetável",
              title: item.name,
              code: null,
              requestedAt: item.requestedAt,
              amount: unitValue * item.sessions,
              items: [{
                label: `${item.name} · ${item.sessions} sessão(ões)`,
                value: unitValue * item.sessions,
              }],
              pdfPath: null,
            };
          }),
          ...record.procedureRequests.map((item) => ({
            id: item.id,
            kind: "PROCEDIMENTO",
            category: "Procedimento",
            title: item.name,
            code: null,
            requestedAt: item.requestedAt,
            amount: Number(item.value),
            items: [{ label: item.name, value: Number(item.value) }],
            pdfPath: null,
          })),
        ]),
      })),
    );
  },
);

app.get("/api/appointments", auth, appointmentAccess, async (req, res) => {
  const date = String(req.query.date || "");
  if (!/^\d{4}-\d{2}-\d{2}$/.test(date))
    return res
      .status(400)
      .json({ message: "Informe a data no formato AAAA-MM-DD." });
  const appointments = await prisma.appointment.findMany({
    where: { appointmentDate: new Date(`${date}T00:00:00.000Z`) },
    orderBy: [{ scheduledTime: "asc" }, { doctor: { fullName: "asc" } }],
    include: appointmentInclude,
  });
  const insuranceCodes = [...new Set(appointments
    .map((appointment) => appointment.patient.insuranceCode)
    .filter((insuranceCode): insuranceCode is number => insuranceCode !== null))];
  const patientInsurances = insuranceCodes.length
    ? await prisma.insurance.findMany({
        where: { id: { in: insuranceCodes } },
        select: { id: true, name: true },
      })
    : [];
  const insuranceNames = new Map(patientInsurances.map((insurance) => [insurance.id, insurance.name]));
  res.json(appointments.map((appointment) => ({
    ...appointment,
    patient: {
      ...appointment.patient,
      insuranceName: appointment.patient.insuranceCode === null
        ? null
        : insuranceNames.get(appointment.patient.insuranceCode) || null,
    },
  })));
});
app.patch("/api/appointments/:id/start", auth, doctorOnly, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  const appointment = await prisma.appointment.findUnique({
    where: { id },
    select: { id: true },
  });
  if (!appointment)
    return res.status(404).json({ message: "Agendamento não encontrado." });
  res.json(
    await prisma.appointment.update({
      where: { id },
      data: { status: AppointmentStatus.EM_ATENDIMENTO },
      include: appointmentInclude,
    }),
  );
});
app.post("/api/appointments", auth, appointmentManage, appointmentFormUpload.fields([{ name: "files", maxCount: 10 }, { name: "examFiles", maxCount: 10 }]), async (req: AuthRequest, res) => {
  const parsed = appointmentSchema.safeParse(req.body);
  if (!parsed.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do agendamento." });
  try {
    await validateAppointmentInsurance(parsed.data);
    const data = appointmentData(parsed.data);
    const examUploads = parseAppointmentExamUploads(req);
    const appointment = await prisma.appointment.create({ data, include: appointmentInclude });
    await ensureAppointmentMedicalRecord(
      appointment.id,
      appointment.patientId,
      appointment.appointmentDate,
      req.user!.id,
    );
    await persistAppointmentAttachments(
      appointment.id,
      appointment.patientId,
      (req.files as Express.Multer.File[]) || [],
      req.user!.id,
    );
    await persistAppointmentExamAttachments(appointment.id, appointment.patientId, examUploads.files, examUploads.metadata, req.user!.id);
    res.status(201).json(await prisma.appointment.findUnique({ where: { id: appointment.id }, include: appointmentInclude }));
  } catch (err: any) {
    if (err?.code === "P2002")
      return res
        .status(409)
        .json({ message: "Este médico já possui agendamento nesse horário." });
    if (err?.message) return res.status(400).json({ message: err.message });
    throw err;
  }
});
app.put("/api/appointments/:id", auth, appointmentManage, appointmentFormUpload.fields([{ name: "files", maxCount: 10 }, { name: "examFiles", maxCount: 10 }]), async (req: AuthRequest, res) => {
  const parsed = appointmentSchema.safeParse(req.body);
  if (!parsed.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do agendamento." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  try {
    const previousAppointment = await prisma.appointment.findUnique({
      where: { id },
      select: { patientId: true, insuranceId: true },
    });
    if (!previousAppointment)
      return res.status(404).json({ message: "Agendamento não encontrado." });
    await validateAppointmentInsurance(parsed.data);
    const data = appointmentData(parsed.data);
    const examUploads = parseAppointmentExamUploads(req);
    const appointment = await prisma.appointment.update({ where: { id }, data, include: appointmentInclude });
    if (
      previousAppointment.patientId !== appointment.patientId ||
      previousAppointment.insuranceId !== appointment.insuranceId
    ) {
      await prisma.patientAnamnesis.updateMany({
        where: { appointmentId: id, submittedAt: null },
        data: { revokedAt: new Date() },
      });
    }
    await ensureAppointmentMedicalRecord(
      appointment.id,
      appointment.patientId,
      appointment.appointmentDate,
      req.user!.id,
    );
    await persistAppointmentAttachments(
      appointment.id,
      appointment.patientId,
      (req.files as Express.Multer.File[]) || [],
      req.user!.id,
    );
    await persistAppointmentExamAttachments(appointment.id, appointment.patientId, examUploads.files, examUploads.metadata, req.user!.id);
    res.json(await prisma.appointment.findUnique({ where: { id }, include: appointmentInclude }));
  } catch (err: any) {
    if (err?.code === "P2002")
      return res
        .status(409)
        .json({ message: "Este médico já possui agendamento nesse horário." });
    if (err?.message) return res.status(400).json({ message: err.message });
    throw err;
  }
});
app.delete(
  "/api/appointments/:id",
  auth,
  appointmentManage,
  async (req, res) => {
    const id = routeId(req, res);
    if (id === null) return;
    await prisma.appointment.delete({ where: { id } });
    res.status(204).send();
  },
);
app.get("/api/medical-records/patients/:patientId/exam-attachments", auth, doctorOnly, async (req, res) => {
  const patientId = Number(req.params.patientId);
  if (!Number.isInteger(patientId) || patientId <= 0)
    return res.status(400).json({ message: "Paciente inválido." });
  const acceptedTypes = [...appointmentExamTypes, ...Object.keys(legacyAppointmentExamTypes)];
  const attachments = await prisma.appointmentAttachment.findMany({
    where: { patientId, OR: [{ examType: { in: acceptedTypes } }, { examType: null, examDate: null }] },
    orderBy: [{ examDate: "desc" }, { uploadedAt: "desc" }],
  });
  res.json(attachments.map(attachment => ({
    ...attachment,
    examType: attachment.examType ? legacyAppointmentExamTypes[attachment.examType] || attachment.examType : null,
  })));
});
app.patch("/api/appointment-attachments/:id/classification", auth, doctorOnly, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  const parsed = z.object({
    examType: z.enum(appointmentExamTypes),
    examDate: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  }).safeParse(req.body);
  if (!parsed.success) return res.status(400).json({ message: "Informe a classificação e uma data de exame válida." });
  const date = new Date(`${parsed.data.examDate}T00:00:00.000Z`);
  if (Number.isNaN(date.getTime()) || date.toISOString().slice(0, 10) !== parsed.data.examDate)
    return res.status(400).json({ message: "A data do exame é inválida." });
  if (parsed.data.examDate > clinicTodayDate())
    return res.status(400).json({ message: "A data do exame não pode ser futura." });
  const existing = await prisma.appointmentAttachment.findUnique({ where: { id }, select: { id: true } });
  if (!existing) return res.status(404).json({ message: "Anexo não encontrado." });
  const attachment = await prisma.appointmentAttachment.update({
    where: { id },
    data: { examType: parsed.data.examType, examDate: date },
  });
  res.json(attachment);
});
app.get("/api/appointment-attachments/file", auth, appointmentAccess, async (req, res) => {
  const storageKey = String(req.query.key || "");
  const attachment = await prisma.appointmentAttachment.findUnique({ where: { storageKey } });
  if (!attachment) return res.status(404).json({ message: "Anexo não encontrado." });
  const filePath = path.resolve(attachmentRoot, storageKey);
  if (!filePath.startsWith(`${attachmentRoot}${path.sep}`) || !fs.existsSync(filePath))
    return res.status(404).json({ message: "Anexo não encontrado." });
  res.type(attachment.mimeType).download(filePath, attachment.fileName);
});
app.delete("/api/appointment-attachments/:id", auth, appointmentAttachmentManage, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  const attachment = await prisma.appointmentAttachment.findUnique({ where: { id } });
  if (!attachment) return res.status(404).json({ message: "Anexo não encontrado." });
  await prisma.appointmentAttachment.delete({ where: { id } });
  await fs.promises.unlink(path.resolve(attachmentRoot, attachment.storageKey)).catch(() => undefined);
  res.status(204).send();
});
app.patch("/api/appointments/:id/clinical", auth, doctorOnly, async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  const notes = typeof req.body?.notes === "string" ? req.body.notes : null;
  if (notes === null) return res.status(400).json({ message: "Observação inválida." });
  res.json(await prisma.appointment.update({ where: { id }, data: { notes }, include: appointmentInclude }));
});
app.post("/api/appointments/:id/attachments", auth, doctorOnly, appointmentAttachmentUpload.array("files", 10), async (req: AuthRequest, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  const appointment = await prisma.appointment.findUnique({ where: { id }, select: { id: true, patientId: true } });
  if (!appointment) return res.status(404).json({ message: "Agendamento não encontrado." });
  await persistAppointmentAttachments(appointment.id, appointment.patientId, (req.files as Express.Multer.File[]) || [], req.user!.id);
  res.json(await prisma.appointment.findUnique({ where: { id }, include: appointmentInclude }));
});

app.use("/api/admin", auth, adminOnly);

app.get("/api/admin/digital-certificates", async (_req, res) => {
  res.json(
    await prisma.digitalCertificate.findMany({
      orderBy: { createdAt: "desc" },
      select: {
        id: true,
        name: true,
        fileName: true,
        subject: true,
        issuer: true,
        serialNumber: true,
        validFrom: true,
        validTo: true,
        active: true,
        createdAt: true,
        uploadedBy: { select: { fullName: true } },
      },
    }),
  );
});
app.post(
  "/api/admin/digital-certificates",
  certificateUpload.single("certificate"),
  async (req: AuthRequest, res) => {
    const name = String(req.body?.name || "").trim();
    const password = String(req.body?.password || "");
    if (!req.file || !name || !password)
      return res.status(400).json({
        message: "Informe o nome, a senha e o arquivo PFX/P12 do certificado.",
      });
    try {
      new P12Signer(req.file.buffer, { passphrase: password });
      await prisma.digitalCertificate.updateMany({ data: { active: false } });
      const certificate = await prisma.digitalCertificate.create({
        data: {
          name,
          fileName: req.file.originalname,
          pfxEncrypted: encryptSecret(req.file.buffer),
          passwordEncrypted: encryptSecret(password),
          active: true,
          uploadedById: req.user!.id,
        },
        select: {
          id: true,
          name: true,
          fileName: true,
          active: true,
          createdAt: true,
        },
      });
      res.status(201).json(certificate);
    } catch (error: any) {
      res.status(400).json({
        message: error?.message || "Não foi possível salvar o certificado.",
      });
    }
  },
);
app.delete("/api/admin/digital-certificates/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.digitalCertificate.update({
    where: { id },
    data: { active: false },
  });
  res.status(204).send();
});

app.get("/api/admin/users", async (_req, res) =>
  res.json(
    await prisma.user.findMany({
      orderBy: { id: "desc" },
      select: {
        id: true,
        fullName: true,
        login: true,
        profile: true,
        createdAt: true,
      },
    }),
  ),
);
app.post("/api/admin/users", async (req, res) => {
  const parsed = userSchema.safeParse(req.body);
  if (!parsed.success || !parsed.data.password)
    return res
      .status(400)
      .json({ message: "Nome, login, senha e perfil são obrigatórios." });
  const data = parsed.data;
  const password = data.password as string;
  const user = await prisma.user.create({
    data: {
      fullName: data.fullName,
      login: data.login,
      passwordHash: await bcrypt.hash(password, 10),
      profile: data.profile,
    },
    select: { id: true, fullName: true, login: true, profile: true },
  });
  res.status(201).json(user);
});
app.put("/api/admin/users/:id", async (req, res) => {
  const parsed = userSchema.safeParse(req.body);
  if (!parsed.success)
    return res.status(400).json({ message: "Dados de usuário inválidos." });
  const data = parsed.data;
  let id = routeId(req, res, req.body?.id, false);
  if (id === null) {
    const existing = await prisma.user.findUnique({
      where: { login: data.login },
      select: { id: true },
    });
    if (!existing)
      return res.status(400).json({
        message:
          "ID do cadastro inválido e login não localizado. Atualize a lista e tente novamente.",
      });
    id = existing.id;
  }
  const user = await prisma.user.update({
    where: { id },
    data: {
      fullName: data.fullName,
      login: data.login,
      profile: data.profile,
      ...(data.password
        ? { passwordHash: await bcrypt.hash(data.password, 10) }
        : {}),
    },
    select: { id: true, fullName: true, login: true, profile: true },
  });
  res.json(user);
});
app.delete("/api/admin/users/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.user.delete({ where: { id } });
  res.status(204).send();
});

app.get("/api/admin/clinic", async (_req, res) =>
  res.json(await prisma.clinic.findMany({ orderBy: { id: "desc" } })),
);
app.post("/api/admin/clinic", async (req, res) => {
  const parsed = clinicSchema.safeParse(req.body);
  if (!parsed.success)
    return res
      .status(400)
      .json({ message: "Preencha todos os campos da clínica." });
  res.status(201).json(await prisma.clinic.create({ data: parsed.data }));
});
app.put("/api/admin/clinic/:id", async (req, res) => {
  const parsed = clinicSchema.safeParse(req.body);
  if (!parsed.success)
    return res
      .status(400)
      .json({ message: "Preencha todos os campos da clínica." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.clinic.update({ where: { id }, data: parsed.data }));
});
app.delete("/api/admin/clinic/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.clinic.delete({ where: { id } });
  res.status(204).send();
});

async function crud<T extends { id: number }>(
  res: Response,
  model: any,
  method: "findMany" | "create" | "update" | "delete",
  args?: any,
) {
  return res.json(await model[method](args));
}
app.get("/api/admin/doctors", async (_req, res) =>
  crud(res, prisma.doctor, "findMany", { orderBy: { id: "desc" } }),
);
app.post("/api/admin/doctors", async (req, res) => {
  const p = doctorSchema.safeParse(req.body);
  if (!p.success)
    return res.status(400).json({ message: "Preencha os dados do médico." });
  res.status(201).json(await prisma.doctor.create({ data: p.data }));
});
app.put("/api/admin/doctors/:id", async (req, res) => {
  const p = doctorSchema.safeParse(req.body);
  if (!p.success)
    return res.status(400).json({ message: "Preencha os dados do médico." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.doctor.update({ where: { id }, data: p.data }));
});
app.delete("/api/admin/doctors/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.doctor.delete({ where: { id } });
  res.status(204).send();
});

app.get("/api/admin/insurances", async (_req, res) =>
  crud(res, prisma.insurance, "findMany", { orderBy: { id: "desc" } }),
);
app.post("/api/admin/insurances", async (req, res) => {
  const p = insuranceSchema.safeParse(req.body);
  if (!p.success)
    return res.status(400).json({ message: "Preencha os dados do convênio." });
  res.status(201).json(await prisma.insurance.create({ data: p.data }));
});
app.put("/api/admin/insurances/:id", async (req, res) => {
  const p = insuranceSchema.safeParse(req.body);
  if (!p.success)
    return res.status(400).json({ message: "Preencha os dados do convênio." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.insurance.update({ where: { id }, data: p.data }));
});
app.delete("/api/admin/insurances/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.insurance.delete({ where: { id } });
  res.status(204).send();
});

app.get("/api/admin/attendances", async (_req, res) =>
  res.json(
    await prisma.attendance.findMany({
      orderBy: { id: "desc" },
      include: { insurance: { select: { id: true, name: true } } },
    }),
  ),
);
app.post("/api/admin/attendances", async (req, res) => {
  const p = attendanceSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha nome, valor e convênio do atendimento." });
  res.status(201).json(
    await prisma.attendance.create({
      data: p.data,
      include: { insurance: { select: { id: true, name: true } } },
    }),
  );
});
app.put("/api/admin/attendances/:id", async (req, res) => {
  const p = attendanceSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha nome, valor e convênio do atendimento." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(
    await prisma.attendance.update({
      where: { id },
      data: p.data,
      include: { insurance: { select: { id: true, name: true } } },
    }),
  );
});
app.delete("/api/admin/attendances/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.attendance.delete({ where: { id } });
  res.status(204).send();
});

app.get("/api/admin/procedures", async (_req, res) =>
  crud(res, prisma.procedure, "findMany", { orderBy: { id: "desc" } }),
);
app.post("/api/admin/procedures", async (req, res) => {
  const p = procedureSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha os dados do procedimento." });
  res.status(201).json(await prisma.procedure.create({ data: p.data }));
});
app.put("/api/admin/procedures/:id", async (req, res) => {
  const p = procedureSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha os dados do procedimento." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.procedure.update({ where: { id }, data: p.data }));
});
app.delete("/api/admin/procedures/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.procedure.delete({ where: { id } });
  res.status(204).send();
});

app.get("/api/admin/injectables", async (_req, res) =>
  crud(res, prisma.injectable, "findMany", { orderBy: { id: "desc" } }),
);
app.post("/api/admin/injectables", async (req, res) => {
  const p = injectableSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do injetável." });
  res.status(201).json(await prisma.injectable.create({ data: p.data }));
});
app.put("/api/admin/injectables/:id", async (req, res) => {
  const p = injectableSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do injetável." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.injectable.update({ where: { id }, data: p.data }));
});
app.delete("/api/admin/injectables/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.injectable.delete({ where: { id } });
  res.status(204).send();
});

app.get("/api/admin/suppliers", async (_req, res) =>
  crud(res, prisma.supplier, "findMany", { orderBy: { name: "asc" } }),
);
app.post("/api/admin/suppliers", async (req, res) => {
  const p = supplierSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do fornecedor." });
  res.status(201).json(await prisma.supplier.create({ data: p.data }));
});
app.put("/api/admin/suppliers/:id", async (req, res) => {
  const p = supplierSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do fornecedor." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.supplier.update({ where: { id }, data: p.data }));
});
app.delete("/api/admin/suppliers/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.supplier.delete({ where: { id } });
  res.status(204).send();
});

app.get("/api/admin/exam-types", async (_req, res) =>
  crud(res, prisma.examType, "findMany", { orderBy: { id: "desc" } }),
);
app.post("/api/admin/exam-types", async (req, res) => {
  const p = examTypeSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do tipo de exame." });
  res.status(201).json(await prisma.examType.create({ data: p.data }));
});
app.put("/api/admin/exam-types/:id", async (req, res) => {
  const p = examTypeSchema.safeParse(req.body);
  if (!p.success)
    return res
      .status(400)
      .json({ message: "Preencha corretamente os dados do tipo de exame." });
  const id = routeId(req, res, req.body?.id);
  if (id === null) return;
  res.json(await prisma.examType.update({ where: { id }, data: p.data }));
});
app.delete("/api/admin/exam-types/:id", async (req, res) => {
  const id = routeId(req, res);
  if (id === null) return;
  await prisma.examType.delete({ where: { id } });
  res.status(204).send();
});

app.use((err: any, _req: Request, res: Response, _next: NextFunction) => {
  console.error(err);
  const message =
    err?.code === "LIMIT_FILE_SIZE"
      ? "O arquivo excede o limite de 10 MB."
      : err?.message || "Erro interno do servidor.";
  res
    .status(
      err?.code === "LIMIT_FILE_SIZE" ||
        err?.status === 400 ||
        message.startsWith("Tipo de arquivo")
        ? 400
        : 500,
    )
    .json({ message });
});

app.listen(port, "0.0.0.0", () => {
  console.log("MedClinic API iniciada com sucesso!");
  console.log(`Localhost: http://localhost:${port}`);
  console.log(`IP fixo:   http://100.101.191.54:${port}`);
  console.log(`IP fixo:   http://192.168.0.200:${port}`);
  console.log(`API Local: http://localhost:${port}/api`);
  console.log(`API Rede:  http://100.101.191.54:${port}/api`);
  console.log(`API Rede:  http://192.168.0.200:${port}/api`);
});
