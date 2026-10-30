import { createResourceService } from "../../components/resource-catalog/service";
import { suppliersConfig } from "./config";
import type { SupplierRow } from "./types";

export const suppliersService = createResourceService<SupplierRow>(suppliersConfig);
