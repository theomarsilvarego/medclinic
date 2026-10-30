import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const examTypesConfig: ResourceConfig = {
    path: "exam-types",
    title: "Tipos de Exames",
    singular: "tipo de exame",
    fields: [
      { key: "code", label: "Código" },
      { key: "name", label: "Nome" },
      { key: "invoiceValue", label: "Valor nota", type: "number" },
      { key: "value", label: "Valor", type: "number" },
      { key: "active", label: "Ativo", type: "checkbox" },
    ],
    columns: [
      { key: "code", label: "Código" },
      { key: "name", label: "Nome" },
      { key: "invoiceValue", label: "Valor nota", format: money },
      { key: "value", label: "Valor", format: money },
      {
        key: "active",
        label: "Status",
        format: (v) => (v ? "Ativo" : "Inativo"),
      },
    ],
  };
