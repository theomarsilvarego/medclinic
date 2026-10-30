import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const injectablesConfig: ResourceConfig = {
    path: "injectables",
    title: "Injetáveis",
    singular: "injetável",
    fields: [
      { key: "name", label: "Nome" },
      {
        key: "type",
        label: "Tipo",
        type: "select",
        options: [
          { value: "VITAMINAS", label: "Vitaminas" },
          { value: "PROTOCOLOS", label: "Protocolos" },
          { value: "IMUNIDADES", label: "Imunidades" },
        ],
      },
      { key: "supplier", label: "Fornecedor", type: "select", options: [] },
      { key: "expirationDate", label: "Data de validade", type: "date" },
      { key: "lot", label: "Lote" },
      { key: "unit", label: "Unidade" },
      { key: "invoiceValue", label: "Valor nota", type: "number" },
      { key: "value", label: "Valor", type: "number" },
      { key: "quantity", label: "Quantidade", type: "number" },
      { key: "minimum", label: "Mínimo", type: "number" },
    ],
    columns: [
      { key: "name", label: "Nome" },
      {
        key: "type",
        label: "Tipo",
        format: (v) =>
          (
            ({
              VITAMINAS: "Vitaminas",
              PROTOCOLOS: "Protocolos",
              IMUNIDADES: "Imunidades",
            }) as Record<string, string>
          )[String(v)] || v,
      },
      { key: "supplier", label: "Fornecedor" },
      {
        key: "expirationDate",
        label: "Validade",
        format: (value) =>
          value
            ? new Date(
                `${String(value).slice(0, 10)}T12:00:00`,
              ).toLocaleDateString("pt-BR")
            : "—",
      },
      { key: "lot", label: "Lote" },
      { key: "unit", label: "Unidade" },
      { key: "invoiceValue", label: "Valor nota", format: money },
      { key: "value", label: "Valor", format: money },
      { key: "quantity", label: "Quantidade" },
      { key: "minimum", label: "Mínimo" },
    ],
  };
