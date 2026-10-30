import type { Row } from "../../lib/app";

export type ExamTypeRow = Row & { id: number; code: string; name: string; value: number };
