import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { suppliersConfig } from "./config";
import { suppliersService } from "./service";

export function useSuppliers() {
  return useResourceCrud(suppliersConfig, suppliersService);
}
