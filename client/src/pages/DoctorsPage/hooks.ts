import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { doctorsConfig } from "./config";
import { doctorsService } from "./service";

export function useDoctors() {
  return useResourceCrud(doctorsConfig, doctorsService);
}
