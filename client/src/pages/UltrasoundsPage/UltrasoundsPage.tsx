import { ResourceCatalogView } from "../../components/resource-catalog/ResourceCatalogView";
import { ultrasoundsConfig } from "./config";
import { useUltrasounds } from "./hooks";

export function UltrasoundsPage() {
  const state = useUltrasounds();
  return (
    <ResourceCatalogView
      config={ultrasoundsConfig}
      state={state}
      className="ultrasounds-resource-page"
    />
  );
}
