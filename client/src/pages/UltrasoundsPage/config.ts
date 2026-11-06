import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const ultrasoundsConfig: ResourceConfig = {
  path: "ultrasounds",
  title: "Ultrassom",
  singular: "ultrassom",
  fields: [
    {
      key: "name",
      label: "Nome",
      required: true,
      placeholder: "Ex.: Ultrassom transvaginal",
    },
    {
      key: "description",
      label: "Descrição",
      type: "textarea",
      fullWidth: true,
      placeholder: "Descreva o exame de ultrassom.",
    },
    {
      key: "observation",
      label: "Observação",
      type: "textarea",
      fullWidth: true,
      placeholder: "Observações adicionais (opcional).",
    },
    {
      key: "performedInClinic",
      label: "Realiza na clínica",
      type: "checkbox",
      defaultValue: false,
    },
    {
      key: "value",
      label: "Valor",
      type: "number",
      min: 0,
      step: 0.01,
      required: true,
      placeholder: "0,00",
      visibleWhen: { key: "performedInClinic", value: true },
      clearWhenHidden: true,
    },
    {
      key: "active",
      label: "Ativo (Status)",
      type: "checkbox",
      defaultValue: true,
    },
  ],
  columns: [
    { key: "name", label: "Nome" },
    {
      key: "description",
      label: "Descrição",
      format: (value) => {
        const text = String(value || "").trim();
        return text.length > 90 ? `${text.slice(0, 87)}…` : text || "—";
      },
    },
    {
      key: "performedInClinic",
      label: "Realiza na clínica",
      badge: true,
      format: (value) => (value ? "Sim" : "Não"),
    },
    {
      key: "value",
      label: "Valor",
      format: (value) =>
        value === null || value === undefined ? "—" : money(Number(value)),
    },
    {
      key: "active",
      label: "Status",
      format: (value) => (value ? "Ativo" : "Inativo"),
    },
  ],
};
