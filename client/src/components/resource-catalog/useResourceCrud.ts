import { useCallback, useEffect, useState } from "react";
import { getRowId, type Row } from "../../lib/app";
import type { ResourceConfig } from "./types";
import type { ResourceService, RelatedOptions } from "./service";

export function useResourceCrud<T extends Row = Row>(config: ResourceConfig, service: ResourceService<T>) {
  const [rows, setRows] = useState<T[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [editing, setEditing] = useState<Row | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [related, setRelated] = useState<RelatedOptions>({});

  const reload = useCallback(async () => {
    setLoading(true);
    setError("");
    try {
      const [data, options] = await Promise.all([
        service.list(),
        service.relatedOptions ? service.relatedOptions() : Promise.resolve({}),
      ]);
      setRows(data || []);
      setRelated(options || {});
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Não foi possível carregar os dados.");
    } finally {
      setLoading(false);
    }
  }, [service]);

  useEffect(() => { void reload(); }, [reload]);

  const save = useCallback(async (data: Row) => {
    try {
      const editingId = editing ? getRowId(editing) : null;
      if (editing && !editingId) {
        setError("O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.");
        return;
      }
      await service.save(data, editingId);
      setEditing(null);
      setModalOpen(false);
      await reload();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Não foi possível salvar o cadastro.");
    }
  }, [editing, reload, service]);

  const remove = useCallback(async (id: number) => {
    const normalizedId = getRowId({ id });
    if (!normalizedId) {
      setError("O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.");
      return;
    }
    if (!window.confirm("Excluir este cadastro?")) return;
    try {
      await service.remove(normalizedId);
      await reload();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Não foi possível excluir o cadastro.");
    }
  }, [reload, service]);

  const fields = config.fields.map((field) => ({
    ...field,
    options: related[field.key] ?? field.options,
  }));

  return {
    rows, loading, error, editing, modalOpen, fields, setEditing, setModalOpen, reload, save, remove,
  };
}
