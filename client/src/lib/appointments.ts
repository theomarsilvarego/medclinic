import type { Row } from "./app";
import { request } from "./app";

export async function submitAppointment(data: Row, appointmentId?: number) {
  const payload = {
    appointmentDate: String(data.appointmentDate || "").slice(0, 10),
    scheduledTime: data.scheduledTime,
    patientId: Number(data.patientId),
    doctorId: Number(data.doctorId),
    insuranceId: Number(data.insuranceId),
    itemType: data.itemType || "ATENDIMENTO",
    attendanceId:
      data.itemType === "ATENDIMENTO" ? Number(data.attendanceId) : null,
    procedureId:
      data.itemType === "PROCEDIMENTO" ? Number(data.procedureId) : null,
    injectableId:
      data.itemType === "INJETAVEL" ? Number(data.injectableId) : null,
    status: data.status || "AGENDADO",
    notes: data.notes || "",
    requestKind: data.requestKind || null,
    requestId: data.requestId ? Number(data.requestId) : null,
  };
  const form = new FormData();
  Object.entries(payload).forEach(([key, value]) => {
    if (value !== null && value !== undefined && value !== "")
      form.append(key, String(value));
  });
  if (appointmentId) form.append("id", String(appointmentId));

  const exams = (
    (data.examUploads || []) as {
      examType: string;
      examDate: string;
      file: File | null;
    }[]
  ).filter((exam) => exam.file);
  form.append(
    "examMetadata",
    JSON.stringify(
      exams.map(({ examType, examDate }) => ({ examType, examDate })),
    ),
  );
  exams.forEach(({ file }) => {
    if (file) form.append("examFiles", file);
  });

  return request(`/appointments${appointmentId ? `/${appointmentId}` : ""}`, {
    method: appointmentId ? "PUT" : "POST",
    body: form,
  });
}
