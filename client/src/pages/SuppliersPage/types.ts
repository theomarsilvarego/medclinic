import type { Row } from "../../lib/app";

export type SupplierRow = Row & { id: number; name: string; cnpj: string; email: string };
