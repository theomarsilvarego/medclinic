import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { usersConfig } from "./config";
import { useUsers } from "./hooks";
import "./UsersPage.css";

export function UsersPage() {
  const state = useUsers();
  return <ResourceCatalogView config={usersConfig} state={state} className="users-resource-page" />;
}
