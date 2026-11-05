import { createResourceService } from "../../components/resource-catalog/service";
import { ultrasoundsConfig } from "./config";
import type { UltrasoundRow } from "./types";

export const ultrasoundsService =
  createResourceService<UltrasoundRow>(ultrasoundsConfig);
