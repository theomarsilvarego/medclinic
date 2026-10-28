import { useMemo, useState } from "react";
import { Download, FileSpreadsheet, FileText, LoaderCircle, RefreshCw } from "lucide-react";
import { getStateFromPhone } from "../lib/brazilian-ddd";
import { money, request, type Row } from "../lib/app";

type ReportColumn = { key: string; label: string; value: (row: Row) => unknown };
type ReportDefinition = { id: string; title: string; description: string; endpoint: (date: string) => string; columns: ReportColumn[]; dateFilter?: boolean };

const formatDate = (value: unknown) => value ? new Date(String(value)).toLocaleDateString("pt-BR", { timeZone: "UTC" }) : "—";
const activeLabel = (value: unknown) => value ? "Ativo" : "Inativo";
const procedureTypeLabels: Record<string, string> = {
  DIAGNOSTICO_POR_IMAGEM: "Diagnóstico por Imagem",
  ESTETICO: "Estético",
  CIRURGICO: "Cirúrgico",
  CONTRACEPTIVO: "Contraceptivo",
};
const appointmentStatusLabels: Record<string, string> = {
  AGENDADO: "Agendado",
  CONFIRMADO: "Confirmado",
  EM_ATENDIMENTO: "Em atendimento",
  ATENDIDO: "Atendido",
  CANCELADO: "Cancelado",
  FALTOU: "Faltou",
};
const reportDefinitions: ReportDefinition[] = [
  {
    id: "patients", title: "Pacientes", description: "Relação de pacientes, contato, estado pelo DDD e convênio.", endpoint: () => "/patients",
    columns: [
      { key: "recordNumber", label: "Prontuário", value: row => row.recordNumber || "—" },
      { key: "fullName", label: "Paciente", value: row => row.fullName },
      { key: "phone", label: "Celular", value: row => row.phone || "—" },
      { key: "state", label: "Estado (DDD)", value: row => getStateFromPhone(row.phone)?.uf || "Não identificado" },
      { key: "insurance", label: "Convênio", value: row => row.insuranceName || "Sem convênio" },
      { key: "birthDate", label: "Nascimento", value: row => formatDate(row.birthDate) },
    ],
  },
  {
    id: "appointments", title: "Agenda do dia", description: "Agendamentos de uma data, com paciente, médico e situação.", endpoint: date => `/appointments?date=${encodeURIComponent(date)}`, dateFilter: true,
    columns: [
      { key: "time", label: "Horário", value: row => String(row.scheduledTime || "").slice(0, 5) || "—" },
      { key: "patient", label: "Paciente", value: row => row.patient?.fullName || "—" },
      { key: "doctor", label: "Médico", value: row => row.doctor?.fullName || "—" },
      { key: "service", label: "Serviço", value: row => row.procedure?.name || row.injectable?.name || row.attendance?.name || (row.itemType === "COLETA" ? "Exame de sangue" : "—") },
      { key: "insurance", label: "Convênio", value: row => row.insurance?.name || "—" },
      { key: "status", label: "Situação", value: row => appointmentStatusLabels[String(row.status)] || row.status || "—" },
    ],
  },
  {
    id: "doctors", title: "Médicos", description: "Cadastro de médicos e especialidades.", endpoint: () => "/admin/doctors",
    columns: [
      { key: "fullName", label: "Médico", value: row => row.fullName },
      { key: "crm", label: "CRM", value: row => row.crm || "—" },
      { key: "rqe", label: "RQE", value: row => row.rqe || "—" },
      { key: "specialty", label: "Especialidade", value: row => row.specialty || "—" },
    ],
  },
  {
    id: "insurances", title: "Convênios", description: "Convênios cadastrados, valor e situação.", endpoint: () => "/admin/insurances",
    columns: [
      { key: "name", label: "Convênio", value: row => row.name },
      { key: "ans", label: "ANS", value: row => row.ans || "—" },
      { key: "value", label: "Valor", value: row => money(row.value) },
      { key: "active", label: "Situação", value: row => activeLabel(row.active) },
    ],
  },
  {
    id: "attendances", title: "Atendimentos", description: "Serviços cadastrados e seus convênios vinculados.", endpoint: () => "/admin/attendances",
    columns: [
      { key: "name", label: "Atendimento", value: row => row.name },
      { key: "insurance", label: "Convênio", value: row => row.insurance?.name || "—" },
      { key: "value", label: "Valor", value: row => money(row.value) },
      { key: "active", label: "Situação", value: row => activeLabel(row.active) },
    ],
  },
  {
    id: "procedures", title: "Procedimentos", description: "Procedimentos cadastrados por tipo e valor.", endpoint: () => "/admin/procedures",
    columns: [
      { key: "name", label: "Procedimento", value: row => row.name },
      { key: "type", label: "Tipo", value: row => procedureTypeLabels[String(row.type)] || "Não definido" },
      { key: "value", label: "Valor", value: row => money(row.value) },
      { key: "active", label: "Situação", value: row => activeLabel(row.active) },
    ],
  },
  {
    id: "injectables", title: "Estoque de injetáveis", description: "Quantidades atuais, mínimo e sinalização de reposição.", endpoint: () => "/admin/injectables",
    columns: [
      { key: "name", label: "Injetável", value: row => row.name },
      { key: "type", label: "Categoria", value: row => row.type || "—" },
      { key: "supplier", label: "Fornecedor", value: row => row.supplier || "—" },
      { key: "quantity", label: "Estoque", value: row => Number(row.quantity || 0) },
      { key: "minimum", label: "Mínimo", value: row => Number(row.minimum || 0) },
      { key: "stockStatus", label: "Reposição", value: row => Number(row.quantity || 0) <= Number(row.minimum || 0) ? "Repor" : "Adequado" },
    ],
  },
  {
    id: "suppliers", title: "Fornecedores", description: "Cadastro e contatos dos fornecedores.", endpoint: () => "/admin/suppliers",
    columns: [
      { key: "name", label: "Fornecedor", value: row => row.name },
      { key: "legalName", label: "Razão social", value: row => row.legalName || "—" },
      { key: "cnpj", label: "CNPJ", value: row => row.cnpj || "—" },
      { key: "email", label: "E-mail", value: row => row.email || "—" },
      { key: "contact", label: "Contato", value: row => row.contact || "—" },
    ],
  },
  {
    id: "exam-types", title: "Tipos de exames", description: "Catálogo de exames, códigos e valores.", endpoint: () => "/admin/exam-types",
    columns: [
      { key: "code", label: "Código", value: row => row.code },
      { key: "name", label: "Exame", value: row => row.name },
      { key: "invoiceValue", label: "Valor da nota", value: row => money(row.invoiceValue) },
      { key: "value", label: "Valor", value: row => money(row.value) },
      { key: "active", label: "Situação", value: row => activeLabel(row.active) },
    ],
  },
];

function fileSlug(value: string) {
  return value.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
}
function downloadBlob(blob: Blob, filename: string) {
  const url = URL.createObjectURL(blob);
  const link = document.createElement("a");
  link.href = url;
  link.download = filename;
  document.body.appendChild(link);
  link.click();
  link.remove();
  window.setTimeout(() => URL.revokeObjectURL(url), 1000);
}
function escapeTsvCell(value: unknown) {
  return String(value ?? "").replace(/\t/g, " ").replace(/\r?\n/g, " ").replace(/"/g, '""');
}
function formatReportDate(value: string) {
  const [year, month, day] = value.split("-");
  return year && month && day ? `${day}/${month}/${year}` : "—";
}
function patientAge(birthDate: unknown, referenceDate: string) {
  if (!birthDate) return "—";
  const birth = new Date(`${String(birthDate).slice(0, 10)}T12:00:00`);
  const reference = new Date(`${referenceDate}T12:00:00`);
  if (Number.isNaN(birth.getTime()) || Number.isNaN(reference.getTime())) return "—";
  let age = reference.getFullYear() - birth.getFullYear();
  const birthdayNotReached = reference.getMonth() < birth.getMonth()
    || (reference.getMonth() === birth.getMonth() && reference.getDate() < birth.getDate());
  if (birthdayNotReached) age -= 1;
  return String(Math.max(0, age));
}
function cleanTxtValue(value: unknown) {
  return String(value ?? "—").replace(/\r?\n/g, " ").trim() || "—";
}
function escapeXml(value: unknown) {
  return String(value ?? "").replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&apos;");
}
function spreadsheetCell(value: unknown) {
  if (typeof value === "number" && Number.isFinite(value))
    return `<Cell><Data ss:Type="Number">${value}</Data></Cell>`;
  return `<Cell><Data ss:Type="String">${escapeXml(value)}</Data></Cell>`;
}

export function ReportsPage() {
  const [reportId, setReportId] = useState(reportDefinitions[0].id);
  const [appointmentDate, setAppointmentDate] = useState(() => {
    const now = new Date();
    return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
  });
  const [rows, setRows] = useState<Row[]>([]);
  const [generatedFor, setGeneratedFor] = useState("");
  const [hasGenerated, setHasGenerated] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const selectedReport = reportDefinitions.find(report => report.id === reportId) || reportDefinitions[0];
  const tableValues = useMemo(() => rows.map(row => selectedReport.columns.map(column => column.value(row))), [rows, selectedReport]);

  async function generateReport() {
    setLoading(true);
    setError("");
    try {
      const result = await request(selectedReport.endpoint(appointmentDate));
      if (!Array.isArray(result)) throw new Error("A resposta do relatório veio em um formato inesperado.");
      setRows(result);
      setGeneratedFor(selectedReport.dateFilter ? appointmentDate : "");
      setHasGenerated(true);
    } catch (cause: any) {
      setRows([]);
      setGeneratedFor("");
      setHasGenerated(false);
      setError(cause.message || "Não foi possível gerar o relatório.");
    } finally {
      setLoading(false);
    }
  }

  const reportFilename = `${fileSlug(selectedReport.title)}${generatedFor ? `-${generatedFor}` : ""}`;
  function exportXls() {
    const columns = selectedReport.columns.map(column => `<Column ss:Width="${Math.min(260, Math.max(90, column.label.length * 8))}"/>`).join("");
    const header = `<Row ss:StyleID="Header">${selectedReport.columns.map(column => spreadsheetCell(column.label)).join("")}</Row>`;
    const body = tableValues.map(row => `<Row>${row.map(spreadsheetCell).join("")}</Row>`).join("");
    const workbook = `<?xml version="1.0" encoding="UTF-8"?><?mso-application progid="Excel.Sheet"?><Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40"><Styles><Style ss:ID="Header"><Alignment ss:Vertical="Center"/><Font ss:Bold="1" ss:Color="#FFFFFF"/><Interior ss:Color="#741447" ss:Pattern="Solid"/></Style></Styles><Worksheet ss:Name="Relatorio"><Table>${columns}${header}${body}</Table><WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel"><FreezePanes/><FrozenNoSplit/><SplitHorizontal>1</SplitHorizontal><TopRowBottomPane>1</TopRowBottomPane><ActivePane>2</ActivePane></WorksheetOptions></Worksheet></Workbook>`;
    downloadBlob(new Blob([workbook], { type: "application/vnd.ms-excel;charset=utf-8" }), `${reportFilename}.xls`);
  }
  function exportTxt() {
    if (selectedReport.id === "appointments") {
      const referenceDate = generatedFor || appointmentDate;
      const lines = [
        `Agenda de pacientes - Dia ${formatReportDate(referenceDate)}`,
        "",
        ...rows.map(row => {
          const time = String(row.scheduledTime || "").slice(0, 5) || "—";
          const patient = cleanTxtValue(row.patient?.fullName);
          const age = patientAge(row.patient?.birthDate, referenceDate);
          const service = cleanTxtValue(row.itemType === "PROCEDIMENTO" ? row.procedure?.name : row.itemType === "INJETAVEL" ? row.injectable?.name : row.itemType === "COLETA" ? "Exame de sangue" : row.attendance?.name);
          const notes = cleanTxtValue(row.notes);
          return `${time} - Paciente: ${patient} - Idade ${age} - (${service}) - ${notes}`;
        }),
      ];
      downloadBlob(new Blob(["\uFEFF", lines.join("\r\n")], { type: "text/plain;charset=utf-8" }), `${reportFilename}.txt`);
      return;
    }
    const lines = [selectedReport.columns.map(column => escapeTsvCell(column.label)).join("\t"), ...tableValues.map(row => row.map(escapeTsvCell).join("\t"))];
    downloadBlob(new Blob(["\uFEFF", lines.join("\r\n")], { type: "text/plain;charset=utf-8" }), `${reportFilename}.txt`);
  }
  async function exportPdf() {
    const [{ jsPDF }, autoTableModule] = await Promise.all([import("jspdf"), import("jspdf-autotable")]);
    const autoTable = autoTableModule.default;
    const documentPdf = new jsPDF({ orientation: selectedReport.columns.length > 5 ? "landscape" : "portrait", unit: "mm", format: "a4" });
    documentPdf.setFont("helvetica", "bold");
    documentPdf.setFontSize(16);
    documentPdf.text(selectedReport.title, 14, 16);
    documentPdf.setFont("helvetica", "normal");
    documentPdf.setFontSize(9);
    documentPdf.text(`Gerado em ${new Date().toLocaleString("pt-BR")}${generatedFor ? ` · Data: ${generatedFor}` : ""} · ${rows.length} registro(s)`, 14, 23);
    autoTable(documentPdf, {
      startY: 29,
      head: [selectedReport.columns.map(column => column.label)],
      body: tableValues.map(row => row.map(value => String(value ?? "—"))),
      styles: { font: "helvetica", fontSize: selectedReport.columns.length > 5 ? 7 : 8, cellPadding: 2.2, overflow: "linebreak" },
      headStyles: { fillColor: [116, 20, 71], textColor: 255 },
      alternateRowStyles: { fillColor: [250, 245, 247] },
      margin: { left: 14, right: 14, bottom: 16 },
      didDrawPage: () => {
        const pageCount = documentPdf.getNumberOfPages();
        documentPdf.setFontSize(8);
        documentPdf.setTextColor(120);
        documentPdf.text(`Página ${pageCount}`, documentPdf.internal.pageSize.getWidth() - 14, documentPdf.internal.pageSize.getHeight() - 7, { align: "right" });
      },
    });
    documentPdf.save(`${reportFilename}.pdf`);
  }

  return (
    <div className="reports-page">
      <div className="page-heading">
        <div>
          <p className="eyebrow">GESTÃO CLÍNICA</p>
          <h1>Relatórios</h1>
          <p className="muted">Selecione um relatório para visualizar em tabela e exportar.</p>
        </div>
      </div>
      <section className="reports-controls table-card">
        <label>
          Relatório
          <select value={reportId} onChange={event => { setReportId(event.target.value); setRows([]); setGeneratedFor(""); setHasGenerated(false); setError(""); }}>
            {reportDefinitions.map(report => <option key={report.id} value={report.id}>{report.title}</option>)}
          </select>
        </label>
        {selectedReport.dateFilter && <label>
          Data da agenda
          <input type="date" value={appointmentDate} onChange={event => { setAppointmentDate(event.target.value); setRows([]); setGeneratedFor(""); setHasGenerated(false); }} />
        </label>}
        <button className="primary" onClick={() => void generateReport()} disabled={loading || (selectedReport.dateFilter && !appointmentDate)}>
          {loading ? <LoaderCircle size={17} className="reports-spinner" /> : <RefreshCw size={17} />}
          {loading ? "Gerando…" : "Gerar relatório"}
        </button>
        {rows.length > 0 && <div className="reports-export-actions">
          <button className="secondary" onClick={() => void exportPdf()}><FileText size={16} /> PDF</button>
          <button className="secondary" onClick={exportXls}><FileSpreadsheet size={16} /> Excel (.xls)</button>
          <button className="secondary" onClick={exportTxt}><Download size={16} /> TXT</button>
        </div>}
      </section>
      {error && <div className="error page-error">{error}</div>}
      {!hasGenerated && !loading && !error && <div className="reports-empty">
        <FileText size={24} />
        <strong>Escolha e gere um relatório</strong>
        <span>{selectedReport.description}</span>
      </div>}
      {hasGenerated && <section className="table-card reports-results">
        <div className="table-head">
          <strong>{selectedReport.title} · {rows.length} registro(s)</strong>
          <span className="muted">{generatedFor ? `Data: ${formatDate(`${generatedFor}T00:00:00.000Z`)}` : "Dados atuais do sistema"}</span>
        </div>
        {rows.length === 0 ? <div className="empty">Nenhum registro encontrado para os critérios selecionados.</div> : <div className="table-scroll"><table><thead><tr>{selectedReport.columns.map(column => <th key={column.key}>{column.label}</th>)}</tr></thead><tbody>{tableValues.map((values, rowIndex) => <tr key={String(rows[rowIndex].id ?? rowIndex)}>{values.map((value, columnIndex) => <td key={selectedReport.columns[columnIndex].key}>{String(value ?? "—")}</td>)}</tr>)}</tbody></table></div>}
      </section>}
    </div>
  );
}
