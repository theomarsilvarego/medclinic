import React, { useEffect, useMemo, useState } from "react";
import {
  ClipboardList,
  FileText,
  Pencil,
  Plus,
  Search,
  Trash2,
} from "lucide-react";
import type { ModuleKey, Profile, Row } from "../lib/app";
import { getRowId, request } from "../lib/app";
import { getStateFromPhone } from "../lib/brazilian-ddd";
import { configs } from "../lib/configs";
import { Modal } from "./Modal";

type CrudPageProps = {
  module: ModuleKey;
  profile?: Profile;
  onOpenPatientRecords?: (patientId: number) => void;
};
const pageSizes = [25, 50, 75, 100];
function whatsappUrl(phone: unknown) {
  let digits = String(phone || "").replace(/\D/g, "");
  if (digits.length === 10 || digits.length === 11) digits = `55${digits}`;
  if (!/^55\d{10,11}$/.test(digits)) return null;
  return `https://wa.me/${digits}?text=${encodeURIComponent("Olá, tudo bem?")}`;
}

export function CrudPage({
  module,
  profile,
  onOpenPatientRecords,
}: CrudPageProps) {
  const config = configs[module as keyof typeof configs];
  const isPatients = module === "patients";
  const [rows, setRows] = useState<Row[]>([]);
  const [editing, setEditing] = useState<Row | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [insuranceOptions, setInsuranceOptions] = useState<any[]>([]);
  const [supplierOptions, setSupplierOptions] = useState<any[]>([]);
  const [search, setSearch] = useState("");
  const [insuranceFilter, setInsuranceFilter] = useState("");
  const [stateFilter, setStateFilter] = useState("");
  const [pageSize, setPageSize] = useState(25);
  const [page, setPage] = useState(1);
  const fields =
    module === "attendances"
      ? config.fields.map((f) =>
          f.key === "insuranceId" ? { ...f, options: insuranceOptions } : f,
        )
      : module === "patients"
        ? config.fields.map((f) =>
            f.key === "insuranceCode" ? { ...f, options: insuranceOptions } : f,
          )
        : module === "injectables"
          ? config.fields.map((f) =>
              f.key === "supplier" ? { ...f, options: supplierOptions } : f,
            )
          : config.fields;

  async function load() {
    setLoading(true);
    try {
      const result = await Promise.all([
        request(`${config.basePath === "" ? "" : "/admin"}/${config.path}`),
        module === "attendances"
          ? request("/admin/insurances")
          : module === "patients"
            ? request("/insurances")
            : module === "injectables"
              ? request("/admin/suppliers")
              : Promise.resolve([]),
      ]);
      setRows(result[0] || []);
      if (module === "attendances")
        setInsuranceOptions(
          (result[1] || [])
            .filter((x: Row) => x.active)
            .map((x: Row) => ({ value: x.id, label: x.name })),
        );
      if (module === "patients")
        setInsuranceOptions(
          (result[1] || [])
            .filter((x: Row) => x.active)
            .map((x: Row) => ({ value: x.id, label: `${x.id} - ${x.name}` })),
        );
      if (module === "injectables")
        setSupplierOptions(
          (result[1] || []).map((x: Row) => ({ value: x.name, label: x.name })),
        );
    } catch (e: any) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  }
  useEffect(() => {
    load();
  }, [module]);
  useEffect(() => {
    setPage(1);
  }, [search, pageSize, insuranceFilter, stateFilter]);

  const patientInsuranceFilters = useMemo(
    () =>
      Array.from(
        new Set(
          rows
            .map((row) => String(row.insuranceName || "").trim())
            .filter(Boolean),
        ),
      ).sort((left, right) => left.localeCompare(right, "pt-BR")),
    [rows],
  );
  const patientStateFilters = useMemo(() => {
    const states = new Map<string, { uf: string; name: string }>();
    rows.forEach((row) => {
      const state = getStateFromPhone(row.phone);
      if (state) states.set(state.uf, { uf: state.uf, name: state.name });
    });
    return Array.from(states.values()).sort((left, right) =>
      left.name.localeCompare(right.name, "pt-BR"),
    );
  }, [rows]);

  const filteredRows = useMemo(() => {
    if (!isPatients) return rows;
    const term = search.trim().toLocaleLowerCase("pt-BR");
    return rows.filter((row) => {
      const matchesSearch =
        !term ||
        [row.fullName, row.cpf, row.phone].some((value) =>
          String(value || "")
            .toLocaleLowerCase("pt-BR")
            .includes(term),
        );
      const matchesInsurance =
        !insuranceFilter ||
        String(row.insuranceName || "").toLocaleLowerCase("pt-BR") ===
          insuranceFilter.toLocaleLowerCase("pt-BR");
      const matchesState =
        !stateFilter || getStateFromPhone(row.phone)?.uf === stateFilter;
      return matchesSearch && matchesInsurance && matchesState;
    });
  }, [isPatients, rows, search, insuranceFilter, stateFilter]);
  const totalPages = Math.max(1, Math.ceil(filteredRows.length / pageSize));
  const visibleRows = isPatients
    ? filteredRows.slice((page - 1) * pageSize, page * pageSize)
    : rows;
  const doctorCanOpenRecords =
    isPatients && profile === "MEDICO" && onOpenPatientRecords;
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
    if (isPatients && column.key === "insuranceName") {
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
    if (isPatients && column.key === "state") {
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
      const payload = editingId ? { ...data, id: editingId } : data;
      const body = isPatients
        ? (() => {
            const form = new FormData();
            Object.entries(payload).forEach(([key, value]) => {
              if (
                key === "photoUrl" ||
                key === "photo" ||
                value === undefined ||
                value === null
              )
                return;
              form.append(key, String(value));
            });
            if (payload.photo instanceof File)
              form.append("photo", payload.photo);
            return form;
          })()
        : JSON.stringify(payload);
      await request(
        `${config.basePath === "" ? "" : "/admin"}/${config.path}${editingId ? `/${editingId}` : ""}`,
        { method: editingId ? "PUT" : "POST", body },
      );
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
      await request(
        `${config.basePath === "" ? "" : "/admin"}/${config.path}/${normalizedId}`,
        { method: "DELETE" },
      );
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
        {isPatients && (
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
                  {patientInsuranceFilters.map((name) => (
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
                  {patientStateFilters.map((state) => (
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
            {isPatients
              ? `${visibleRows.length} de ${filteredRows.length} paciente${filteredRows.length === 1 ? "" : "s"}`
              : `${rows.length} cadastro${rows.length === 1 ? "" : "s"}`}
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
                      {isPatients &&
                        (() => {
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
        {isPatients && !loading && filteredRows.length > 0 && (
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
        <Modal
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
