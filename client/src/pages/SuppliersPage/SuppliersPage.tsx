import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { suppliersConfig } from "./config";
import { useSuppliers } from "./hooks";
import "./SuppliersPage.css";

export function SuppliersPage() {
  const state = useSuppliers();
  return <ResourceCatalogView config={suppliersConfig} state={state} className="suppliers-resource-page" />;
}
