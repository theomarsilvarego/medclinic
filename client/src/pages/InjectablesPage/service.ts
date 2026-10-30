import { createResourceService } from "../../components/resource-catalog/service";
import { injectablesConfig } from "./config";
import type { InjectableRow } from "./types";

export const injectablesService = createResourceService<InjectableRow>(injectablesConfig, [{ field: "supplier", path: "/admin/suppliers", value: (row) => row.name, label: (row) => row.name }]);
