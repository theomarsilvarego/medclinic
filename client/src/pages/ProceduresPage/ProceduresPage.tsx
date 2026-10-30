import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { proceduresConfig } from "./config";
import { useProcedures } from "./hooks";
import "./ProceduresPage.css";

export function ProceduresPage() {
  const state = useProcedures();
  return <ResourceCatalogView config={proceduresConfig} state={state} className="procedures-resource-page" />;
}
