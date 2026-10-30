import { createResourceService } from "../../components/resource-catalog/service";
import { insurancesConfig } from "./config";
import type { InsuranceRow } from "./types";

export const insurancesService = createResourceService<InsuranceRow>(insurancesConfig);
