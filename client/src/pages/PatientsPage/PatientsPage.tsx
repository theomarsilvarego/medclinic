import React, { useEffect, useMemo, useState } from "react";
import {
  ClipboardList,
  FileText,
  Pencil,
  Plus,
  Search,
  Trash2,
} from "lucide-react";
import type { Profile, Row } from "../../lib/app";
import { getRowId } from "../../lib/app";
import { getStateFromPhone } from "../../lib/brazilian-ddd";
import { patientsConfig } from "./config";
import { patientService } from "./service";
import { usePatientFilters } from "./hooks";
import type { PatientRow } from "./types";
import { PatientModal } from "./PatientModal";
import "./PatientsPage.css";

type PatientPageProps = {
  profile?: Profile;
  onOpenPatientRecords?: (patientId: number) => void;
};
function whatsappUrl(phone: unknown) {
  let digits = String(phone || "").replace(/\D/g, "");
  if (digits.length === 10 || digits.length === 11) digits = `55${digits}`;
  if (!/^55\d{10,11}$/.test(digits)) return null;
  return `https://wa.me/${digits}?text=${encodeURIComponent("Olá, tudo bem?")}`;
}

export function PatientsPage({
  profile,
  onOpenPatientRecords,
}: PatientPageProps) {
  const config = patientsConfig;
  const [rows, setRows] = useState<PatientRow[]>([]);
  const [editing, setEditing] = useState<Row | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [insuranceOptions, setInsuranceOptions] = useState<any[]>([]);
  const {
    search, setSearch, insuranceFilter, setInsuranceFilter, stateFilter, setStateFilter,
    pageSize, setPageSize, page, setPage, pageSizes, totalPages,
    insuranceNames, stateOptions, filteredRows, visibleRows,
  } = usePatientFilters(rows);
  const fields = config.fields.map((field) =>
    field.key === "insuranceCode" ? { ...field, options: insuranceOptions } : field,
  );

  async function load() {
    setLoading(true);
    try {
      const [patients, insurances] = await Promise.all([
        patientService.list(),
        patientService.loadInsuranceOptions(),
      ]);
      setRows(patients || []);
      setInsuranceOptions(
        (insurances || [])
          .filter((row: Row) => row.active)
          .map((row: Row) => ({ value: row.id, label: `${row.id} - ${row.name}` })),
      );
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : "Não foi possível carregar os pacientes.");
    } finally {
      setLoading(false);
    }
  }
  useEffect(() => {
    load();
  }, []);
  const doctorCanOpenRecords = profile === "MEDICO" && onOpenPatientRecords;
  const insuranceColors = useMemo(() => {
    const names = Array.from(
      new Set(
        rows
          .map((row) => String(row.insuranceName || "").trim())
          .filter(Boolean),
      ),
    ).sort((left, right) => left.localeCompare(right, "pt-BR"));
    return new Map(
      names.map((name, index) => [
        name.toLocaleLowerCase("pt-BR"),
        `hsl(${Math.round((index * 360) / names.length)} 68% 34%)`,
      ]),
    );
  }, [rows]);
  const renderCell = (row: Row, column: (typeof config.columns)[number]) => {
    if (column.key === "insuranceName") {
      const insuranceName = String(row.insuranceName || "").trim();
      const color = insuranceName
        ? insuranceColors.get(insuranceName.toLocaleLowerCase("pt-BR"))
        : undefined;
      return insuranceName ? (
        <span
          className="insurance-badge"
          style={{ backgroundColor: color }}
          title={`Convênio: ${insuranceName}`}
        >
          {insuranceName}
        </span>
      ) : (
        <span className="insurance-badge insurance-badge-unknown">
          Sem convênio
        </span>
      );
    }
    if (column.key === "state") {
      const state = getStateFromPhone(row.phone);
      return state ? (
        <span
          className="state-badge"
          style={{ backgroundColor: state.color }}
          title={`Identificado pelo DDD (${state.ddd})`}
        >
          {state.name} ({state.uf})
        </span>
      ) : (
        <span
          className="state-badge state-badge-unknown"
          title="O celular não contém um DDD reconhecido entre parênteses."
        >
          Não identificado
        </span>
      );
    }
    if (column.key === "fullName" && doctorCanOpenRecords)
      return (
        <button
          className="patient-name-link"
          onClick={() => onOpenPatientRecords?.(Number(row.id))}
        >
          {row.fullName}
        </button>
      );
    if (column.key === "active")
      return (
        <span className={row[column.key] ? "status active" : "status"}>
          {column.format?.(row[column.key])}
        </span>
      );
    return column.format ? column.format(row[column.key]) : row[column.key];
  };

  async function save(data: Row) {
    try {
      const editingId = getRowId(editing);
      if (editing && !editingId) {
        setError(
          "O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.",
        );
        return;
      }
      await patientService.save(data, editingId);
      setEditing(null);
      setModalOpen(false);
      load();
    } catch (e: any) {
      setError(e.message);
    }
  }
  async function remove(id: number) {
    const normalizedId = getRowId({ id });
    if (!normalizedId) {
      setError(
        "O cadastro selecionado não possui um ID válido. Atualize a lista e tente novamente.",
      );
      return;
    }
    if (!confirm("Excluir este cadastro?")) return;
    try {
      await patientService.remove(normalizedId);
      load();
    } catch (e: any) {
      setError(e.message);
    }
  }

  return (
    <>
      <div className="page-heading">
        <div>
          <p className="eyebrow">ADMINISTRAÇÃO</p>
          <h1>{config.title}</h1>
          <p className="muted">Cadastre e mantenha os dados atualizados.</p>
        </div>
        <button
          className="primary"
          onClick={() => {
            setEditing(null);
            setModalOpen(true);
          }}
        >
          <Plus size={17} /> Novo{" "}
          {config.title === "Clínica" ? "cadastro" : config.title.slice(0, -1)}
        </button>
      </div>
      {error && <div className="error page-error">{error}</div>}
      <div className="table-card">
        {(
          <div className="patient-list-toolbar">
            <div className="patient-list-controls">
              <label className="patient-search">
                <Search size={16} />
                <input
                  value={search}
                  onChange={(event) => setSearch(event.target.value)}
                  placeholder="Pesquisar por nome, CPF ou celular…"
                />
              </label>
              <label className="patient-filter">
                <select
                  value={insuranceFilter}
                  onChange={(event) => setInsuranceFilter(event.target.value)}
                >
                  <option value="">Todos os convênios</option>
                  {insuranceNames.map((name) => (
                    <option key={name} value={name}>
                      {name}
                    </option>
                  ))}
                </select>
              </label>
              <label className="patient-filter">
                <select
                  value={stateFilter}
                  onChange={(event) => setStateFilter(event.target.value)}
                >
                  <option value="">Todos os estados</option>
                  {stateOptions.map((state) => (
                    <option key={state.uf} value={state.uf}>
                      {state.name} ({state.uf})
                    </option>
                  ))}
                </select>
              </label>
            </div>
            <span>
              {filteredRows.length} paciente
              {filteredRows.length === 1 ? "" : "s"}
            </span>
          </div>
        )}
        <div className="table-head">
          <strong>
            {`${visibleRows.length} de ${filteredRows.length} paciente${filteredRows.length === 1 ? "" : "s"}`}
          </strong>
          <span className="muted">Última atualização agora</span>
        </div>
        {loading ? (
          <div className="empty">Carregando…</div>
        ) : visibleRows.length === 0 ? (
          <div className="empty">
            <ClipboardList size={28} />
            <strong>
              {search || insuranceFilter || stateFilter
                ? "Nenhum paciente encontrado"
                : "Nenhum cadastro ainda"}
            </strong>
            <span>
              {search || insuranceFilter || stateFilter
                ? "Ajuste a pesquisa ou os filtros e tente novamente."
                : "Adicione o primeiro registro usando o botão acima."}
            </span>
          </div>
        ) : (
          <div className="table-scroll">
            <table>
              <thead>
                <tr>
                  {config.columns.map((c) => (
                    <th key={c.key}>
                      {c.key === "fullName" && doctorCanOpenRecords
                        ? "Nome / prontuário"
                        : c.label}
                    </th>
                  ))}
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                {visibleRows.map((row) => (
                  <tr key={row.id}>
                    {config.columns.map((c) => (
                      <td key={c.key}>{renderCell(row, c)}</td>
                    ))}
                    <td className="row-actions">
                      {(() => {
                          const href = whatsappUrl(row.phone);
                          return href ? (
                            <a
                              className="whatsapp-link-button"
                              href={href}
                              target="_blank"
                              rel="noopener noreferrer"
                              title={`Abrir WhatsApp para ${row.fullName}`}
                              aria-label={`Abrir WhatsApp para ${row.fullName}`}
                            >
                              <img src="/icons/whatsapp-iconscout.png" alt="" />
                            </a>
                          ) : (
                            <button
                              className="whatsapp-link-button whatsapp-disabled"
                              type="button"
                              disabled
                              title="Celular ausente ou inválido"
                              aria-label="Celular ausente ou inválido"
                            >
                              <img src="/icons/whatsapp-iconscout.png" alt="" />
                            </button>
                          );
                        })()}
                      {doctorCanOpenRecords && (
                        <button
                          className="record-link-button"
                          onClick={() => onOpenPatientRecords?.(Number(row.id))}
                          title="Abrir prontuário"
                        >
                          <FileText size={16} />
                        </button>
                      )}
                      <button
                        onClick={() => {
                          setEditing(row);
                          setModalOpen(true);
                        }}
                        title="Editar"
                      >
                        <Pencil size={16} />
                      </button>
                      <button onClick={() => remove(row.id)} title="Excluir">
                        <Trash2 size={16} />
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
        {!loading && filteredRows.length > 0 && (
          <div className="pagination-bar">
            <span>Linhas por página</span>
            <select
              value={pageSize}
              onChange={(event) => setPageSize(Number(event.target.value))}
            >
              {pageSizes.map((size) => (
                <option value={size} key={size}>
                  {size}
                </option>
              ))}
            </select>
            <span>
              {(page - 1) * pageSize + 1}–
              {Math.min(page * pageSize, filteredRows.length)} de{" "}
              {filteredRows.length}
            </span>
            <button
              disabled={page <= 1}
              onClick={() => setPage((current) => current - 1)}
            >
              Anterior
            </button>
            <button
              disabled={page >= totalPages}
              onClick={() => setPage((current) => current + 1)}
            >
              Próxima
            </button>
          </div>
        )}
      </div>
      {modalOpen && (
        <PatientModal
          title={`${editing?.id ? "Editar" : "Novo"} ${config.title === "Clínica" ? "cadastro" : config.title.slice(0, -1)}`}
          fields={fields}
          initial={editing || { active: true }}
          onClose={() => {
            setModalOpen(false);
            setEditing(null);
          }}
          onSave={save}
        />
      )}
    </>
  );
}
