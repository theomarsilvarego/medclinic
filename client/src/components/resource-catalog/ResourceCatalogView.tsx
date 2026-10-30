import React from "react";
import { ClipboardList, Pencil, Plus, Trash2 } from "lucide-react";
import type { Row } from "../../lib/app";
import { ResourceFormModal } from "./ResourceFormModal";
import type { ResourceConfig } from "./types";

export function ResourceCatalogView({
  config,
  state,
  className,
}: {
  config: ResourceConfig;
  state: ReturnType<typeof import("./useResourceCrud").useResourceCrud>;
  className: string;
}) {
  const singular = config.singular ?? config.title.slice(0, -1);
  return (
    <div className={`resource-catalog-page ${className}`}>
      <div className="page-heading">
        <div>
          <p className="eyebrow">ADMINISTRAÇÃO</p>
          <h1>{config.title}</h1>
          <p className="muted">Cadastre e mantenha os dados atualizados.</p>
        </div>
        <button className="primary" type="button" onClick={() => { state.setEditing(null); state.setModalOpen(true); }}>
          <Plus size={17} /> Novo {singular}
        </button>
      </div>
      {state.error && <div className="error page-error">{state.error}</div>}
      <div className="table-card">
        <div className="table-head">
          <strong>{state.rows.length} cadastro{state.rows.length === 1 ? "" : "s"}</strong>
          <span className="muted">Última atualização agora</span>
        </div>
        {state.loading ? <div className="empty">Carregando…</div> : state.rows.length === 0 ? (
          <div className="empty">
            <ClipboardList size={28} />
            <strong>Nenhum cadastro ainda</strong>
            <span>Adicione o primeiro registro usando o botão acima.</span>
          </div>
        ) : (
          <div className="table-scroll">
            <table>
              <thead><tr>{config.columns.map((column) => <th key={column.key}>{column.label}</th>)}<th>Ações</th></tr></thead>
              <tbody>
                {state.rows.map((row: Row) => (
                  <tr key={row.id}>
                    {config.columns.map((column) => (
                      <td key={column.key}>
                        {column.key === "active" ? (
                          <span className={row[column.key] ? "status active" : "status"}>{column.format?.(row[column.key])}</span>
                        ) : column.format ? column.format(row[column.key]) : row[column.key]}
                      </td>
                    ))}
                    <td className="row-actions">
                      <button type="button" onClick={() => { state.setEditing(row); state.setModalOpen(true); }} title="Editar" aria-label={`Editar ${config.title.slice(0, -1)}`}><Pencil size={16} /></button>
                      <button type="button" onClick={() => void state.remove(Number(row.id))} title="Excluir" aria-label={`Excluir ${config.title.slice(0, -1)}`}><Trash2 size={16} /></button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
      {state.modalOpen && (
        <ResourceFormModal
          title={`${state.editing?.id ? "Editar" : "Novo"} ${singular}`}
          fields={state.fields}
          initial={state.editing || { active: true }}
          onClose={() => { state.setModalOpen(false); state.setEditing(null); }}
          onSave={state.save}
        />
      )}
    </div>
  );
}
