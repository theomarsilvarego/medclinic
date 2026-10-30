import type { Row } from "../../lib/app";

export type InjectableRow = Row & { id: number; name: string; type: string; supplier: string; quantity: number };
