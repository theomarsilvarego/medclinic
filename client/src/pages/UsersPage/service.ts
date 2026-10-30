import { createResourceService } from "../../components/resource-catalog/service";
import { usersConfig } from "./config";
import type { UserRow } from "./types";

export const usersService = createResourceService<UserRow>(usersConfig);
