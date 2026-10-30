import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const suppliersConfig: ResourceConfig = {
    path: "suppliers",
    title: "Fornecedores",
    singular: "fornecedor",
    fields: [
      { key: "name", label: "Nome" },
      { key: "cnpj", label: "CNPJ" },
      { key: "legalName", label: "Razão social" },
      { key: "email", label: "E-mail" },
      { key: "contact", label: "Contato" },
      { key: "address", label: "Endereço", type: "textarea" },
    ],
    columns: [
      { key: "name", label: "Nome" },
      { key: "cnpj", label: "CNPJ" },
      { key: "legalName", label: "Razão social" },
      { key: "email", label: "E-mail" },
      { key: "contact", label: "Contato" },
      { key: "address", label: "Endereço" },
    ],
  };
