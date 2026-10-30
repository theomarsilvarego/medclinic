import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { attendancesConfig } from "./config";
import { useAttendances } from "./hooks";
import "./AttendancesPage.css";

export function AttendancesPage() {
  const state = useAttendances();
  return <ResourceCatalogView config={attendancesConfig} state={state} className="attendances-resource-page" />;
}
