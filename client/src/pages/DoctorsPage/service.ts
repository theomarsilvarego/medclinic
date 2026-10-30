import { createResourceService } from "../../components/resource-catalog/service";
import { doctorsConfig } from "./config";
import type { DoctorRow } from "./types";

export const doctorsService = createResourceService<DoctorRow>(doctorsConfig);
