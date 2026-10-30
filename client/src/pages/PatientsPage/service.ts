import { patientsConfig } from "./config";
import { getRowId, request, type Row } from "../../lib/app";
import type { PatientRow } from "./types";
const endpoint = `${patientsConfig.basePath === "" ? "" : "/admin"}/${patientsConfig.path}`;
export const patientService = {
  list: () => request(endpoint) as Promise<PatientRow[]>,
  loadInsuranceOptions: () => request("/insurances"),
  save: async (data: Row, id: number | null) => {
    const normalizedId = id ? getRowId({ id }) : null;
    if (id && !normalizedId) throw new Error("O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.");
    const payload = normalizedId ? { ...data, id: normalizedId } : data;
    const body = new FormData();
    Object.entries(payload).forEach(([key, value]) => {
      if (key === "photoUrl" || key === "photo" || value === undefined || value === null) return;
      body.append(key, String(value));
    });
    if (payload.photo instanceof File) body.append("photo", payload.photo);
    await request(`${endpoint}${normalizedId ? `/${normalizedId}` : ""}`, {
      method: normalizedId ? "PUT" : "POST",
      body,
    });
  },
  remove: async (id: number) => {
    const normalizedId = getRowId({ id });
    if (!normalizedId) throw new Error("O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.");
    await request(`${endpoint}/${normalizedId}`, { method: "DELETE" });
  },
};
