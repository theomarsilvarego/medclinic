import { useEffect, useMemo, useState } from "react";
import type { Row } from "../../lib/app";

const pageSizes = [25, 50, 75, 100];

const brazilianStates: Record<string, string> = {
  AC: "Acre",
  AL: "Alagoas",
  AP: "Amapá",
  AM: "Amazonas",
  BA: "Bahia",
  CE: "Ceará",
  DF: "Distrito Federal",
  ES: "Espírito Santo",
  GO: "Goiás",
  MA: "Maranhão",
  MT: "Mato Grosso",
  MS: "Mato Grosso do Sul",
  MG: "Minas Gerais",
  PA: "Pará",
  PB: "Paraíba",
  PR: "Paraná",
  PE: "Pernambuco",
  PI: "Piauí",
  RJ: "Rio de Janeiro",
  RN: "Rio Grande do Norte",
  RS: "Rio Grande do Sul",
  RO: "Rondônia",
  RR: "Roraima",
  SC: "Santa Catarina",
  SP: "São Paulo",
  SE: "Sergipe",
  TO: "Tocantins",
};

export function usePatientFilters(rows: Row[]) {
  const [search, setSearch] = useState("");
  const [insuranceFilter, setInsuranceFilter] = useState("");
  const [stateFilter, setStateFilter] = useState("");
  const [pageSize, setPageSize] = useState(pageSizes[0]);
  const [page, setPage] = useState(1);

  useEffect(() => {
    setPage(1);
  }, [search, pageSize, insuranceFilter, stateFilter]);

  const insuranceOptions = useMemo(
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

  const stateOptions = useMemo(() => {
    const states = new Map<string, { uf: string; name: string }>();

    rows.forEach((row) => {
      const uf = String(row.state || "")
        .trim()
        .toUpperCase();

      if (uf && brazilianStates[uf]) {
        states.set(uf, {
          uf,
          name: brazilianStates[uf],
        });
      }
    });

    return Array.from(states.values()).sort((a, b) =>
      a.name.localeCompare(b.name, "pt-BR"),
    );
  }, [rows]);

  const filteredRows = useMemo(() => {
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
        !stateFilter ||
        String(row.state || "")
          .trim()
          .toUpperCase() === stateFilter;

      return matchesSearch && matchesInsurance && matchesState;
    });
  }, [rows, search, insuranceFilter, stateFilter]);

  const totalPages = Math.max(1, Math.ceil(filteredRows.length / pageSize));

  const visibleRows = filteredRows.slice(
    (page - 1) * pageSize,
    page * pageSize,
  );

  return {
    search,
    setSearch,
    insuranceFilter,
    setInsuranceFilter,
    stateFilter,
    setStateFilter,
    pageSize,
    setPageSize,
    page,
    setPage,
    pageSizes,
    totalPages,
    insuranceNames: insuranceOptions,
    stateOptions,
    filteredRows,
    visibleRows,
  };
}
