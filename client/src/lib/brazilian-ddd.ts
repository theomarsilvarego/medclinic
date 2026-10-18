export type BrazilianState = {
  ddd: string;
  uf: string;
  name: string;
  color: string;
};

type StateDefinition = Omit<BrazilianState, "ddd"> & { ddds: string[] };

const stateDefinitions: StateDefinition[] = [
  { uf: "AC", name: "Acre", color: "#7f1d1d", ddds: ["68"] },
  { uf: "AL", name: "Alagoas", color: "#9f1239", ddds: ["82"] },
  { uf: "AP", name: "Amapá", color: "#581c87", ddds: ["96"] },
  { uf: "AM", name: "Amazonas", color: "#1e3a8a", ddds: ["92", "97"] },
  { uf: "BA", name: "Bahia", color: "#9a3412", ddds: ["71", "73", "74", "75", "77"] },
  { uf: "CE", name: "Ceará", color: "#854d0e", ddds: ["85", "88"] },
  { uf: "DF/GO", name: "Distrito Federal / Goiás", color: "#0f766e", ddds: ["61"] },
  { uf: "ES", name: "Espírito Santo", color: "#166534", ddds: ["27", "28"] },
  { uf: "GO", name: "Goiás", color: "#3730a3", ddds: ["62", "64"] },
  { uf: "MA", name: "Maranhão", color: "#be123c", ddds: ["98", "99"] },
  { uf: "MT", name: "Mato Grosso", color: "#065f46", ddds: ["65", "66"] },
  { uf: "MS", name: "Mato Grosso do Sul", color: "#155e75", ddds: ["67"] },
  { uf: "MG", name: "Minas Gerais", color: "#5b21b6", ddds: ["31", "32", "33", "34", "35", "37", "38"] },
  { uf: "PA", name: "Pará", color: "#075985", ddds: ["91", "93", "94"] },
  { uf: "PB", name: "Paraíba", color: "#86198f", ddds: ["83"] },
  { uf: "PR", name: "Paraná", color: "#334155", ddds: ["41", "42", "43", "44", "45", "46"] },
  { uf: "PE", name: "Pernambuco", color: "#7c2d12", ddds: ["81", "87"] },
  { uf: "PI", name: "Piauí", color: "#a16207", ddds: ["86", "89"] },
  { uf: "RJ", name: "Rio de Janeiro", color: "#4c1d95", ddds: ["21", "22", "24"] },
  { uf: "RN", name: "Rio Grande do Norte", color: "#0e7490", ddds: ["84"] },
  { uf: "RS", name: "Rio Grande do Sul", color: "#1d4ed8", ddds: ["51", "53", "54", "55"] },
  { uf: "RO", name: "Rondônia", color: "#15803d", ddds: ["69"] },
  { uf: "RR", name: "Roraima", color: "#6d28d9", ddds: ["95"] },
  { uf: "SC", name: "Santa Catarina", color: "#047857", ddds: ["47", "48", "49"] },
  { uf: "SP", name: "São Paulo", color: "#b91c1c", ddds: ["11", "12", "13", "14", "15", "16", "17", "18", "19"] },
  { uf: "SE", name: "Sergipe", color: "#be185d", ddds: ["79"] },
  { uf: "TO", name: "Tocantins", color: "#0369a1", ddds: ["63"] },
];

const statesByDdd = new Map<string, BrazilianState>();
for (const state of stateDefinitions) {
  for (const ddd of state.ddds) {
    statesByDdd.set(ddd, { ddd, uf: state.uf, name: state.name, color: state.color });
  }
}

export function getStateFromPhone(phone: unknown): BrazilianState | null {
  const match = String(phone ?? "").match(/\(\s*(\d{2})\s*\)/);
  return match ? statesByDdd.get(match[1]) ?? null : null;
}
