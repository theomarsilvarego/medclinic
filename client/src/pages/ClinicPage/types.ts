import type { Row } from "../../lib/app";

export type ClinicRow = Row & { id: number; legalName: string; tradeName: string; cnpj: string };
