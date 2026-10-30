import type { Row } from "../../lib/app";
export type PatientRow = Row & { id: number; fullName: string; cpf?: string; phone?: string; insuranceName?: string; birthDate?: string; photoUrl?: string };
