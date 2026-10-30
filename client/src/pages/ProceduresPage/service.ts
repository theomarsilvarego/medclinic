import { createResourceService } from "../../components/resource-catalog/service";
import { proceduresConfig } from "./config";
import type { ProcedureRow } from "./types";

export const proceduresService = createResourceService<ProcedureRow>(proceduresConfig);
