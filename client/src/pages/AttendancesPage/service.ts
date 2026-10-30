import { createResourceService } from "../../components/resource-catalog/service";
import { attendancesConfig } from "./config";
import type { AtendimentoRow } from "./types";

export const attendancesService = createResourceService<AtendimentoRow>(attendancesConfig, [{ field: "insuranceId", path: "/admin/insurances", value: (row) => String(row.id), label: (row) => row.name, activeOnly: true }]);
