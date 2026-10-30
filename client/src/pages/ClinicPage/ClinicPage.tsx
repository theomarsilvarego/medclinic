import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { clinicConfig } from "./config";
import { useClinic } from "./hooks";
import "./ClinicPage.css";

export function ClinicPage() {
  const state = useClinic();
  return <ResourceCatalogView config={clinicConfig} state={state} className="clinic-resource-page" />;
}
