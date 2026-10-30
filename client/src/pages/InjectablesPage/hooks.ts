import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { injectablesConfig } from "./config";
import { injectablesService } from "./service";

export function useInjectables() {
  return useResourceCrud(injectablesConfig, injectablesService);
}
