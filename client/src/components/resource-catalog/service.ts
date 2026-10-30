import { getRowId, request, type Row } from "../../lib/app";
import type { ResourceConfig } from "./types";

export type RelatedOptions = Record<string, { value: string; label: string }[]>;
export type ResourceService<T extends Row = Row> = {
  list: () => Promise<T[]>;
  relatedOptions?: () => Promise<RelatedOptions>;
  save: (data: Row, id: number | null) => Promise<void>;
  remove: (id: number) => Promise<void>;
};

export type RelatedLookup = {
  field: string;
  path: string;
  value: (row: Row) => string;
  label: (row: Row) => string;
  activeOnly?: boolean;
};

export function createResourceService<T extends Row = Row>(config: ResourceConfig, lookups: RelatedLookup[] = []): ResourceService<T> {
  const endpoint = `${config.basePath === "" ? "" : "/admin"}/${config.path}`;
  return {
    list: () => request(endpoint) as Promise<T[]>,
    relatedOptions: lookups.length ? async () => {
      const results = await Promise.all(lookups.map((lookup) => request(lookup.path)));
      return Object.fromEntries(lookups.map((lookup, index) => [
        lookup.field,
        (results[index] || [])
          .filter((row: Row) => !lookup.activeOnly || row.active)
          .map((row: Row) => ({ value: lookup.value(row), label: lookup.label(row) })),
      ]));
    } : undefined,
    save: async (data, id) => {
      const rowId = id ? getRowId({ id }) : null;
      if (id && !rowId) throw new Error("O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.");
      await request(`${endpoint}${rowId ? `/${rowId}` : ""}`, {
        method: rowId ? "PUT" : "POST",
        body: JSON.stringify(rowId ? { ...data, id: rowId } : data),
      });
    },
    remove: async (id) => {
      const rowId = getRowId({ id });
      if (!rowId) throw new Error("O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.");
      await request(`${endpoint}/${rowId}`, { method: "DELETE" });
    },
  };
}
