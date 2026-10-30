import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const doctorsConfig: ResourceConfig = {
    path: "doctors",
    title: "Médicos",
    singular: "médico",
    fields: [
      { key: "fullName", label: "Nome completo" },
      { key: "crm", label: "CRM" },
      { key: "rqe", label: "RQE" },
      { key: "specialty", label: "Especialidade" },
    ],
    columns: [
      { key: "fullName", label: "Nome completo" },
      { key: "crm", label: "CRM" },
      { key: "rqe", label: "RQE" },
      { key: "specialty", label: "Especialidade" },
    ],
  };
