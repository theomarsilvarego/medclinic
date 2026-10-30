import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const insurancesConfig: ResourceConfig = {
    path: "insurances",
    title: "Convênios",
    singular: "convênio",
    fields: [
      { key: "name", label: "Nome" },
      { key: "ans", label: "ANS" },
      { key: "value", label: "Valor", type: "number" },
      { key: "active", label: "Ativo", type: "checkbox" },
    ],
    columns: [
      { key: "name", label: "Nome" },
      { key: "ans", label: "ANS" },
      { key: "value", label: "Valor", format: money },
      {
        key: "active",
        label: "Status",
        format: (v) => (v ? "Ativo" : "Inativo"),
      },
    ],
  };
