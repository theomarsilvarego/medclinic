import type { Row } from "../../lib/app";

export type DoctorRow = Row & { id: number; fullName: string; crm: string; specialty: string };
