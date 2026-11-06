import type { Row } from "../../lib/app";

export type UltrasoundRow = Row & {
  id: number;
  name: string;
  description: string | null;
  observation: string | null;
  performedInClinic: boolean;
  value: number | string | null;
  active: boolean;
};
