import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const patientsConfig: ResourceConfig = {
    path: "patients",
    basePath: "",
    title: "Pacientes",
    singular: "paciente",
    fields: [
      {
        key: "photo",
        label: "Foto do paciente",
        type: "file",
        fullWidth: true,
      },
      {
        key: "fullName",
        label: "Nome completo",
        fullWidth: true,
        section: "Dados pessoais",
      },
      {
        key: "sex",
        label: "Sexo",
        type: "select",
        section: "Dados pessoais",
        options: [
          { value: "1", label: "Masculino" },
          { value: "2", label: "Feminino" },
        ],
      },
      {
        key: "maritalStatus",
        label: "Estado civil",
        type: "select",
        section: "Dados pessoais",
        options: [
          { value: "1", label: "Solteiro(a)" },
          { value: "2", label: "Casado(a)" },
          { value: "3", label: "Divorciado(a)" },
          { value: "4", label: "Viúvo(a)" },
          { value: "5", label: "União estável" },
        ],
      },
      { key: "cpf", label: "CPF", section: "Dados pessoais" },
      {
        key: "birthDate",
        label: "Data de nascimento",
        type: "date",
        section: "Dados pessoais",
      },
      { key: "email", label: "E-mail", type: "email", section: "Contato" },
      {
        key: "phone",
        label: "WhatsApp",
        type: "tel",
        placeholder: "(69) 90000-0000",
        section: "Contato",
      },
      {
        key: "insuranceCode",
        label: "Convênio",
        type: "select",
        options: [],
      },
      { key: "allergies", label: "Alergia", type: "text", section: "Saúde" },
      {
        key: "comorbidities",
        label: "Comorbidade",
        type: "text",
        section: "Saúde",
      },
      {
        key: "medicationsInUse",
        label: "Em uso de medicamento",
        type: "text",
        section: "Saúde",
      },
      {
        key: "notes",
        label: "Observação",
        type: "textarea",
        fullWidth: true,
        section: "Saúde",
      },
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
  };
