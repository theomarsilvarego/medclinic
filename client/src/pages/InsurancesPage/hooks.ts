import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { insurancesConfig } from "./config";
import { insurancesService } from "./service";

export function useInsurances() {
  return useResourceCrud(insurancesConfig, insurancesService);
}
