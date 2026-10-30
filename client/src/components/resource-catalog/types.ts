import type { Row } from "../../lib/app";

export type ResourceField = {
  key: string;
  label: string;
  type?: string;
  fullWidth?: boolean;
  section?: string;
  placeholder?: string;
  options?: (string | { value: string; label: string })[];
};

export type ResourceColumn = {
  key: string;
  label: string;
  format?: (value: any) => string;
};

export type ResourceConfig = {
  path: string;
  basePath?: string;
  title: string;
  singular?: string;
  fields: ResourceField[];
  columns: ResourceColumn[];
};

