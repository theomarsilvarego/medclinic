import { money } from "../../lib/app";
import type { ResourceConfig } from "../../components/resource-catalog/types";

export const usersConfig: ResourceConfig = {
    path: "users",
    title: "Usuários",
    singular: "usuário",
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
  };
