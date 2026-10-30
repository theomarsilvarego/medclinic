import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const clinicConfig: ResourceConfig = {
    path: "clinic",
    title: "Clínica",
    singular: "cadastro",
    fields: [
      { key: "legalName", label: "Razão social" },
      { key: "tradeName", label: "Nome fantasia" },
      { key: "cnpj", label: "CNPJ" },
      { key: "cnae", label: "CNAE" },
      { key: "address", label: "Endereço" },
    ],
    columns: [
      { key: "tradeName", label: "Nome fantasia" },
      { key: "legalName", label: "Razão social" },
      { key: "cnpj", label: "CNPJ" },
      { key: "cnae", label: "CNAE" },
    ],
  };
