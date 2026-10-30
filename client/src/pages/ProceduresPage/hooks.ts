import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { proceduresConfig } from "./config";
import { proceduresService } from "./service";

export function useProcedures() {
  return useResourceCrud(proceduresConfig, proceduresService);
}
