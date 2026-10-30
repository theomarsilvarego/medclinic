import { createResourceService } from "../../components/resource-catalog/service";
import { clinicConfig } from "./config";
import type { ClinicRow } from "./types";

export const clinicService = createResourceService<ClinicRow>(clinicConfig);
