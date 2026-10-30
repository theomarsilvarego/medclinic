import type { Row } from "../../lib/app";

export type ProcedureRow = Row & { id: number; name: string; type: string; value: number };
