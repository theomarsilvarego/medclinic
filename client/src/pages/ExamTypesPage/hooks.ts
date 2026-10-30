import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { examTypesConfig } from "./config";
import { examtypesService } from "./service";

export function useExamTypes() {
  return useResourceCrud(examTypesConfig, examtypesService);
}
