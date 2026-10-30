import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { examTypesConfig } from "./config";
import { useExamTypes } from "./hooks";
import "./ExamTypesPage.css";

export function ExamTypesPage() {
  const state = useExamTypes();
  return <ResourceCatalogView config={examTypesConfig} state={state} className="exam-types-resource-page" />;
}
