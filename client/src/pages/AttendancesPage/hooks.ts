import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { attendancesConfig } from "./config";
import { attendancesService } from "./service";

export function useAttendances() {
  return useResourceCrud(attendancesConfig, attendancesService);
}
