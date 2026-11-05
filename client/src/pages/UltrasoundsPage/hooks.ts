import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { ultrasoundsConfig } from "./config";
import { ultrasoundsService } from "./service";

export function useUltrasounds() {
  return useResourceCrud(ultrasoundsConfig, ultrasoundsService);
}
