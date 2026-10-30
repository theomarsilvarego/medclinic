import type { Row } from "../../lib/app";

export type UserRow = Row & { id: number; fullName: string; login: string; profile: string };
