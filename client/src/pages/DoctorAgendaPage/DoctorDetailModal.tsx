import { X } from "lucide-react";
import type { Row } from "../../lib/app";

type Props = {
  appointment: Row;
  statusLabels: Record<string, string>;
  onClose: () => void;
};

export function DoctorDetailModal({ appointment, statusLabels, onClose }: Props) {
  return (
    <div className="modal-backdrop">
      <div className="doctor-detail-modal">
        <div className="modal-header">
          <div>
            <p className="eyebrow">DADOS DO PACIENTE</p>
            <h2>{appointment.patient?.fullName || "Paciente"}</h2>
            <span className="modal-identification-code" aria-label="Código do modal A004">A004</span>
          </div>
          <button className="icon-button" onClick={onClose}>
            <X size={19} />
          </button>
        </div>
        <div className="doctor-detail-grid">
          <div>
            <span>Horário</span>
            <strong>{appointment.scheduledTime}</strong>
          </div>
          <div>
            <span>Status</span>
            <strong>
              {statusLabels[appointment.status] || appointment.status}
            </strong>
          </div>
          <div>
            <span>Telefone</span>
            <strong>{appointment.patient?.phone || "Não informado"}</strong>
          </div>
          <div>
            <span>Médico</span>
            <strong>{appointment.doctor?.fullName || "Não informado"}</strong>
          </div>
          <div>
            <span>Convênio</span>
            <strong>{appointment.insurance?.name || "Não informado"}</strong>
          </div>
          <div>
            <span>Serviço</span>
            <strong>
              {appointment.itemType === "PROCEDIMENTO"
                ? appointment.procedure?.name
                : appointment.itemType === "INJETAVEL"
                  ? appointment.injectable?.name
                  : appointment.itemType === "COLETA"
                    ? "Exame de sangue"
                    : appointment.attendance?.name || "Não informado"}
            </strong>
          </div>
          <div className="doctor-detail-wide">
            <span>Observação</span>
            <strong>
              {appointment.notes || "Nenhuma observação registrada."}
            </strong>
          </div>
        </div>
        <div className="modal-footer">
          <button className="secondary" onClick={onClose}>
            Fechar
          </button>
        </div>
      </div>
    </div>
  );
}
