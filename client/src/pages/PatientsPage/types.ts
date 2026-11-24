import type { Row } from "../../lib/app";
export type PatientRow = Row & { id: number; fullName: string; cpf?: string; phone?: string; state?: string | null; insuranceName?: string; birthDate?: string; photoUrl?: string };
