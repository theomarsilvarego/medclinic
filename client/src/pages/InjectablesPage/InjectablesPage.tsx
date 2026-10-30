import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { injectablesConfig } from "./config";
import { useInjectables } from "./hooks";
import "./InjectablesPage.css";

export function InjectablesPage() {
  const state = useInjectables();
  return <ResourceCatalogView config={injectablesConfig} state={state} className="injectables-resource-page" />;
}
