import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { clinicConfig } from "./config";
import { clinicService } from "./service";

export function useClinic() {
  return useResourceCrud(clinicConfig, clinicService);
}
