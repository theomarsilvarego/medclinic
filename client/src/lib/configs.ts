import type { ModuleKey } from "./app";
import { money } from "./app";
export const configs: Record<
  Exclude<
    ModuleKey,
    | "overview"
    | "doctor-day"
    | "medical-records"
    | "exam-groups"
    | "appointments"
    | "certificates"
    | "reports"
  >,
  {
    path: string;
    basePath?: string;
    title: string;
    fields: {
      key: string;
      label: string;
      type?: string;
      fullWidth?: boolean;
      options?: (string | { value: string; label: string })[];
    }[];
    columns: { key: string; label: string; format?: (v: any) => string }[];
  }
> = {
  attendances: {
    path: "attendances",
    title: "Atendimentos",
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
  },
  patients: {
    path: "patients",
    basePath: "",
    title: "Pacientes",
    fields: [
      { key: "photo", label: "Foto do paciente", type: "file", fullWidth: true },
      { key: "fullName", label: "Nome completo" },
      {
        key: "sex",
        label: "Sexo",
        type: "select",
        options: [
          { value: "1", label: "Masculino" },
          { value: "2", label: "Feminino" },
        ],
      },
      {
        key: "maritalStatus",
        label: "Estado civil",
        type: "select",
        options: [
          { value: "1", label: "Solteiro(a)" },
          { value: "2", label: "Casado(a)" },
          { value: "3", label: "Divorciado(a)" },
          { value: "4", label: "Viúvo(a)" },
          { value: "5", label: "União estável" },
        ],
      },
      { key: "cpf", label: "CPF" },
      { key: "email", label: "E-mail" },
      { key: "phone", label: "Celular" },
      { key: "birthDate", label: "Data de nascimento", type: "date" },
      {
        key: "insuranceCode",
        label: "Convênio",
        type: "select",
        options: [],
      },
      { key: "allergies", label: "Alergia", type: "textarea", fullWidth: true },
      { key: "comorbidities", label: "Comorbidade", type: "textarea", fullWidth: true },
      { key: "medicationsInUse", label: "Em uso de medicamento", type: "textarea", fullWidth: true },
      { key: "notes", label: "Observação", type: "textarea", fullWidth: true },
    ],
    columns: [
      { key: "sourceCode", label: "Código" },
      { key: "fullName", label: "Nome" },
      { key: "insuranceName", label: "Convênio" },
      { key: "phone", label: "Celular" },
      { key: "state", label: "Estado (DDD)" },
      {
        key: "birthDate",
        label: "Nascimento",
        format: (v) =>
          v
            ? new Date(v).toLocaleDateString("pt-BR", { timeZone: "UTC" })
            : "—",
      },
    ],
  },

  users: {
    path: "users",
    title: "Usuários",
    fields: [
      { key: "fullName", label: "Nome completo" },
      { key: "login", label: "Login" },
      { key: "password", label: "Senha", type: "password" },
      {
        key: "profile",
        label: "Perfil",
        type: "select",
        options: ["ADMINISTRADOR", "MEDICO", "SECRETARIA"],
      },
    ],
    columns: [
      { key: "fullName", label: "Nome completo" },
      { key: "login", label: "Login" },
      { key: "profile", label: "Perfil" },
    ],
  },
  clinic: {
    path: "clinic",
    title: "Clínica",
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
  },
  doctors: {
    path: "doctors",
    title: "Médicos",
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
  },
  insurances: {
    path: "insurances",
    title: "Convênios",
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
  },
  procedures: {
    path: "procedures",
    title: "Procedimentos",
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
  },
  injectables: {
    path: "injectables",
    title: "Injetáveis",
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
      { key: "invoiceValue", label: "Valor nota", format: money },
      { key: "value", label: "Valor", format: money },
      { key: "quantity", label: "Quantidade" },
      { key: "minimum", label: "Mínimo" },
    ],
  },
  suppliers: {
    path: "suppliers",
    title: "Fornecedores",
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
  },
  "exam-types": {
    path: "exam-types",
    title: "Tipos de Exames",
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
  },
};
