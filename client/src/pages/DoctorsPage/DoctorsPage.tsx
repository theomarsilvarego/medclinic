import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { doctorsConfig } from "./config";
import { useDoctors } from "./hooks";
import "./DoctorsPage.css";

export function DoctorsPage() {
  const state = useDoctors();
  return <ResourceCatalogView config={doctorsConfig} state={state} className="doctors-resource-page" />;
}
