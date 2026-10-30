import { createResourceService } from "../../components/resource-catalog/service";
import { examTypesConfig } from "./config";
import type { ExamTypeRow } from "./types";

export const examtypesService = createResourceService<ExamTypeRow>(examTypesConfig);
