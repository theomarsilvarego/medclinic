import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const attendancesConfig: ResourceConfig = {
    path: "attendances",
    title: "Atendimentos",
    singular: "atendimento",
    fields: [
      { key: "name", label: "Nome" },
      { key: "value", label: "Valor", type: "number" },
      { key: "insuranceId", label: "Convênio", type: "select", options: [] },
      { key: "active", label: "Ativo", type: "checkbox" },
    ],
    columns: [
      { key: "name", label: "Nome" },
      { key: "value", label: "Valor", format: money },
      { key: "insurance", label: "Convênio", format: (v) => v?.name || "—" },
      {
        key: "active",
        label: "Status",
        format: (v) => (v ? "Ativo" : "Inativo"),
      },
    ],
  };
