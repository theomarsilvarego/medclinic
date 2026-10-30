import { useResourceCrud } from "../../components/resource-catalog/useResourceCrud";
import { usersConfig } from "./config";
import { usersService } from "./service";

export function useUsers() {
  return useResourceCrud(usersConfig, usersService);
}
