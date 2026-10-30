import { useEffect, useMemo, useState } from "react";
import type { Row } from "../../lib/app";
import { getStateFromPhone } from "../../lib/brazilian-ddd";

const pageSizes = [25, 50, 75, 100];

export function usePatientFilters(rows: Row[]) {
  const [search, setSearch] = useState("");
  const [insuranceFilter, setInsuranceFilter] = useState("");
  const [stateFilter, setStateFilter] = useState("");
  const [pageSize, setPageSize] = useState(pageSizes[0]);
  const [page, setPage] = useState(1);

  useEffect(() => { setPage(1); }, [search, pageSize, insuranceFilter, stateFilter]);

  const insuranceOptions = useMemo(
    () => Array.from(new Set(rows.map((row) => String(row.insuranceName || "").trim()).filter(Boolean)))
      .sort((left, right) => left.localeCompare(right, "pt-BR")),
    [rows],
  );
  const stateOptions = useMemo(() => {
    const states = new Map<string, { uf: string; name: string }>();
    rows.forEach((row) => {
      const state = getStateFromPhone(row.phone);
      if (state) states.set(state.uf, { uf: state.uf, name: state.name });
    });
    return Array.from(states.values()).sort((left, right) => left.name.localeCompare(right.name, "pt-BR"));
  }, [rows]);
  const filteredRows = useMemo(() => {
    const term = search.trim().toLocaleLowerCase("pt-BR");
    return rows.filter((row) => {
      const matchesSearch = !term || [row.fullName, row.cpf, row.phone].some((value) =>
        String(value || "").toLocaleLowerCase("pt-BR").includes(term),
      );
      const matchesInsurance = !insuranceFilter ||
        String(row.insuranceName || "").toLocaleLowerCase("pt-BR") === insuranceFilter.toLocaleLowerCase("pt-BR");
      const matchesState = !stateFilter || getStateFromPhone(row.phone)?.uf === stateFilter;
      return matchesSearch && matchesInsurance && matchesState;
    });
  }, [rows, search, insuranceFilter, stateFilter]);
  const totalPages = Math.max(1, Math.ceil(filteredRows.length / pageSize));
  const visibleRows = filteredRows.slice((page - 1) * pageSize, page * pageSize);

  return {
    search, setSearch,
    insuranceFilter, setInsuranceFilter,
    stateFilter, setStateFilter,
    pageSize, setPageSize,
    page, setPage,
    pageSizes, totalPages,
    insuranceNames: insuranceOptions, stateOptions, filteredRows, visibleRows,
  };
}
