import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const proceduresConfig: ResourceConfig = {
    path: "procedures",
    title: "Procedimentos",
    singular: "procedimento",
    fields: [
      { key: "name", label: "Nome" },
      {
        key: "type",
        label: "Tipo de procedimento",
        type: "select",
        options: [
          { value: "DIAGNOSTICO_POR_IMAGEM", label: "Diagnóstico por Imagem" },
          { value: "ESTETICO", label: "Estético" },
          { value: "CIRURGICO", label: "Cirúrgico" },
          { value: "CONTRACEPTIVO", label: "Contraceptivo" },
        ],
      },
      { key: "value", label: "Valor", type: "number" },
      { key: "active", label: "Ativo", type: "checkbox" },
    ],
    columns: [
      { key: "name", label: "Nome" },
      {
        key: "type",
        label: "Tipo",
        format: (v) =>
          (
            ({
              DIAGNOSTICO_POR_IMAGEM: "Diagnóstico por Imagem",
              ESTETICO: "Estético",
              CIRURGICO: "Cirúrgico",
              CONTRACEPTIVO: "Contraceptivo",
            }) as Record<string, string>
          )[String(v)] || "Não definido",
      },
      { key: "value", label: "Valor", format: money },
      {
        key: "active",
        label: "Status",
        format: (v) => (v ? "Ativo" : "Inativo"),
      },
    ],
  };
