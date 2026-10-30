import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { insurancesConfig } from "./config";
import { useInsurances } from "./hooks";
import "./InsurancesPage.css";

export function InsurancesPage() {
  const state = useInsurances();
  return <ResourceCatalogView config={insurancesConfig} state={state} className="insurances-resource-page" />;
}
