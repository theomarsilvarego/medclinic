import React, { useEffect, useMemo, useRef, useState } from "react";
import { ImagePlus, Trash2, Upload, UserRound, X } from "lucide-react";
import { API } from "../../lib/app";
import type { Row } from "../../lib/app";

type FormField = {
  key: string;
  label: string;
  type?: string;
  fullWidth?: boolean;
  section?: string;
  placeholder?: string;
  options?: (string | { value: string; label: string })[];
};

const patientSectionOrder = ["Dados pessoais", "Contato", "Saúde"];

export function Modal({
  title,
  fields,
  initial,
  onClose,
  onSave,
}: {
  title: string;
  fields: FormField[];
  initial: Row;
  onClose: () => void;
  onSave: (data: Row) => void;
}) {
  const [data, setData] = useState<Row>(initial);
  const [preview, setPreview] = useState<string | null>(null);
  const [photoRemoved, setPhotoRemoved] = useState(false);
  const [offsetX, setOffsetX] = useState(50);
  const [offsetY, setOffsetY] = useState(50);
  const dragPoint = useRef<{ x: number; y: number } | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const isPatientForm = fields.some(
    (field) => field.key === "allergies" || field.key === "insuranceCode",
  );
  const isEditingPatient = isPatientForm && Boolean(initial.id);
  const photoField = fields.find((field) => field.key === "photo");
  const insuranceField = fields.find((field) => field.key === "insuranceCode");
  const patientSections = useMemo(
    () =>
      patientSectionOrder
        .map((section) => ({
          title: section,
          fields: fields.filter((field) => field.section === section),
        }))
        .filter((section) => section.fields.length > 0),
    [fields],
  );

  const update = (key: string, value: unknown) =>
    setData((current) => ({ ...current, [key]: value }));

  useEffect(() => {
    let objectUrl: string | null = null;
    let cancelled = false;
    setPreview(null);
    setPhotoRemoved(false);
    if (!initial.photoUrl)
      return () => {
        cancelled = true;
      };
    fetch(`${API}${initial.photoUrl}`, {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("medclinic_token") || ""}`,
      },
    })
      .then((response) => (response.ok ? response.blob() : null))
      .then((blob) => {
        if (blob && !cancelled) {
          objectUrl = URL.createObjectURL(blob);
          setPreview(objectUrl);
        }
      })
      .catch(() => undefined);
    return () => {
      cancelled = true;
      if (objectUrl) URL.revokeObjectURL(objectUrl);
    };
  }, [initial.photoUrl]);

  useEffect(
    () => () => {
      if (data.photo instanceof File && preview?.startsWith("blob:"))
        URL.revokeObjectURL(preview);
    },
    [data.photo, preview],
  );

  const handlePhoto = (file: File | undefined) => {
    if (!file) return;
    if (!["image/jpeg", "image/png"].includes(file.type)) {
      alert("A foto deve estar no formato JPG ou PNG.");
      if (fileInputRef.current) fileInputRef.current.value = "";
      return;
    }
    if (file.size > 10 * 1024 * 1024) {
      alert("A foto deve ter no máximo 10 MB.");
      if (fileInputRef.current) fileInputRef.current.value = "";
      return;
    }
    if (preview?.startsWith("blob:")) URL.revokeObjectURL(preview);
    setPreview(URL.createObjectURL(file));
    setOffsetX(50);
    setOffsetY(50);
    setPhotoRemoved(false);
    update("photo", file);
    update("removePhoto", false);
  };

  const removePhoto = () => {
    if (preview?.startsWith("blob:")) URL.revokeObjectURL(preview);
    setPreview(null);
    setPhotoRemoved(true);
    update("photo", null);
    update("removePhoto", true);
    if (fileInputRef.current) fileInputRef.current.value = "";
  };

  const startDragging = (event: React.PointerEvent<HTMLDivElement>) => {
    if (!preview) return;
    event.currentTarget.setPointerCapture(event.pointerId);
    dragPoint.current = { x: event.clientX, y: event.clientY };
  };
  const dragPhoto = (event: React.PointerEvent<HTMLDivElement>) => {
    if (!dragPoint.current) return;
    const dx = event.clientX - dragPoint.current.x;
    const dy = event.clientY - dragPoint.current.y;
    dragPoint.current = { x: event.clientX, y: event.clientY };
    setOffsetX((value) => Math.max(0, Math.min(100, value - dx * 0.7)));
    setOffsetY((value) => Math.max(0, Math.min(100, value - dy * 0.7)));
  };
  const stopDragging = () => {
    dragPoint.current = null;
  };

  const renderField = (field: FormField) => {
    const fieldId = `modal-${field.key}`;
    const fieldValue =
      field.type === "date" && data[field.key]
        ? String(data[field.key]).slice(0, 10)
        : (data[field.key] ?? "");
    if (field.type === "checkbox") {
      return (
        <label
          key={field.key}
          htmlFor={fieldId}
          data-field-key={field.key}
          className="check-label"
        >
          <input
            id={fieldId}
            type="checkbox"
            checked={data[field.key] ?? true}
            onChange={(event) => update(field.key, event.target.checked)}
          />
          {field.label}
        </label>
      );
    }
    return (
      <label
        key={field.key}
        htmlFor={fieldId}
        data-field-key={field.key}
        className={`modal-form-field${field.fullWidth ? " modal-field-full-width" : ""}`}
      >
        <span>{field.label}</span>
        {field.type === "select" ? (
          <select
            id={fieldId}
            value={String(fieldValue)}
            onChange={(event) => update(field.key, event.target.value)}
          >
            <option value="">Selecione…</option>
            {field.options?.map((option) => {
              const value = typeof option === "string" ? option : option.value;
              const label = typeof option === "string" ? option : option.label;
              return (
                <option key={value} value={value}>
                  {label}
                </option>
              );
            })}
          </select>
        ) : field.type === "textarea" ? (
          <textarea
            id={fieldId}
            rows={4}
            value={String(fieldValue)}
            placeholder={field.placeholder}
            onChange={(event) => update(field.key, event.target.value)}
          />
        ) : (
          <input
            id={fieldId}
            type={field.type || "text"}
            value={String(fieldValue)}
            placeholder={field.placeholder}
            onChange={(event) => update(field.key, event.target.value)}
          />
        )}
      </label>
    );
  };

  const save = async () => {
    let photoToSave = data.photo;
    if (data.photo instanceof File && preview) {
      const image = new Image();
      image.src = preview;
      await new Promise((resolve) => {
        image.onload = resolve;
        image.onerror = resolve;
      });
      if (image.naturalWidth) {
        const canvas = document.createElement("canvas");
        canvas.width = 800;
        canvas.height = 800;
        const context = canvas.getContext("2d");
        if (context) {
          const scale = Math.max(
            800 / image.naturalWidth,
            800 / image.naturalHeight,
          );
          const width = image.naturalWidth * scale;
          const height = image.naturalHeight * scale;
          const x = ((800 - width) * offsetX) / 100;
          const y = ((800 - height) * offsetY) / 100;
          context.drawImage(image, x, y, width, height);
          const blob = await new Promise<Blob | null>((resolve) =>
            canvas.toBlob(resolve, data.photo.type, 0.9),
          );
          if (blob)
            photoToSave = new File([blob], data.photo.name, {
              type: data.photo.type,
            });
        }
      }
    }
    onSave({ ...data, photo: photoToSave, removePhoto: photoRemoved });
  };

  return (
    <div
      className="modal-backdrop"
      onMouseDown={(event) => {
        if (event.target === event.currentTarget) onClose();
      }}
    >
      <div
        className={`modal${isPatientForm ? " patient-modal" : " appointment-modal crud-entry-modal"}`}
        role="dialog"
        aria-modal="true"
        aria-labelledby="modal-title"
      >
        <div className={`modal-header${isPatientForm ? "" : " appointment-modal-header"}`}>
          <div>
            <p className="eyebrow">CADASTRO</p>
            <h2 id="modal-title">{title}</h2>
            <span className="modal-identification-code" aria-label="Código do modal A003">A003</span>
          </div>
          <button
            className="icon-button"
            type="button"
            onClick={onClose}
            aria-label="Fechar cadastro"
          >
            <X size={19} />
          </button>
        </div>
        {isPatientForm ? (
          <div className="modal-fields patient-form-fields">
            {photoField && (
              <div className="patient-photo-toolbar">
                <div className="patient-photo-identity">
                  <div
                    className={`patient-photo-preview${!preview && !isEditingPatient ? " patient-photo-empty-new" : ""}`}
                    onPointerDown={startDragging}
                    onPointerMove={dragPhoto}
                    onPointerUp={stopDragging}
                    onPointerCancel={stopDragging}
                    aria-label={
                      preview
                        ? "Prévia da foto do paciente; arraste para ajustar o enquadramento"
                        : "Paciente sem foto"
                    }
                  >
                    {preview ? (
                      <img
                        src={preview}
                        alt="Prévia da foto do paciente"
                        style={{ objectPosition: `${offsetX}% ${offsetY}%` }}
                      />
                    ) : isEditingPatient ? (
                      <ImagePlus size={28} aria-hidden="true" />
                    ) : (
                      <UserRound size={34} aria-hidden="true" />
                    )}
                  </div>
                  <div className="patient-photo-controls">
                    <strong>Foto do paciente</strong>
                    <span>
                      {isEditingPatient
                        ? "JPG ou PNG, até 10 MB."
                        : "A foto é opcional."}
                    </span>
                    <input
                      ref={fileInputRef}
                      id="patient-photo-input"
                      className="patient-photo-native-input"
                      type="file"
                      accept="image/jpeg,image/png"
                      onChange={(event) => handlePhoto(event.target.files?.[0])}
                      tabIndex={-1}
                      aria-hidden="true"
                    />
                    {isEditingPatient ? (
                      <div className="patient-photo-buttons">
                        <button
                          className="patient-photo-button patient-photo-change"
                          type="button"
                          onClick={() => fileInputRef.current?.click()}
                        >
                          <Upload size={15} />
                          Trocar foto
                        </button>
                        <button
                          className="patient-photo-button patient-photo-remove"
                          type="button"
                          onClick={removePhoto}
                          disabled={
                            !preview &&
                            !initial.photoUrl &&
                            !(data.photo instanceof File)
                          }
                        >
                          <Trash2 size={15} />
                          Remover
                        </button>
                      </div>
                    ) : (
                      <button
                        className="patient-photo-button patient-photo-change patient-photo-choose"
                        type="button"
                        onClick={() => fileInputRef.current?.click()}
                      >
                        <Upload size={15} />
                        Escolher foto
                      </button>
                    )}
                    {isEditingPatient && preview && (
                      <small>
                        Arraste a foto para ajustar o enquadramento.
                      </small>
                    )}
                  </div>
                </div>
                <div className="patient-photo-divider" aria-hidden="true" />
                <div className="patient-photo-insurance">
                  {insuranceField ? (
                    renderField(insuranceField)
                  ) : (
                    <span className="patient-photo-insurance-empty">
                      Convênio não disponível
                    </span>
                  )}
                </div>
              </div>
            )}
            {patientSections.map((section) => (
              <section
                className={`patient-form-section patient-section-${section.title.toLocaleLowerCase("pt-BR").replace(/\s+/g, "-")}`}
                key={section.title}
                aria-labelledby={`patient-section-${section.title}`}
              >
                <div
                  className={`patient-section-grid${section.title === "Contato" ? " contact-grid" : ""}${section.title === "Convênio" ? " insurance-grid" : ""}`}
                >
                  {section.fields.map(renderField)}
                </div>
              </section>
            ))}
          </div>
        ) : (
          <div className="modal-fields appointment-modal-fields crud-entry-fields">
            <section className="appointment-section crud-entry-section">
              {fields.map((field) =>
                field.type === "file" ? (
                  <label
                    key={field.key}
                    data-field-key={field.key}
                    className={`modal-form-field${field.fullWidth ? " modal-field-full-width" : ""}`}
                  >
                    <span>{field.label}</span>
                    <div className="patient-photo-picker">
                      <div
                        className="patient-photo-preview"
                        onPointerDown={startDragging}
                        onPointerMove={dragPhoto}
                        onPointerUp={stopDragging}
                        onPointerCancel={stopDragging}
                      >
                        {preview ? (
                          <img
                            src={preview}
                            alt="Prévia enquadrada da foto do paciente"
                            style={{ objectPosition: `${offsetX}% ${offsetY}%` }}
                          />
                        ) : (
                          <ImagePlus size={28} />
                        )}
                      </div>
                      <div>
                        <input
                          ref={fileInputRef}
                          type="file"
                          accept="image/jpeg,image/png"
                          onChange={(event) => handlePhoto(event.target.files?.[0])}
                        />
                        <small>
                          {preview
                            ? "Arraste a foto dentro da thumb para enquadrar."
                            : "JPG ou PNG, até 10 MB."}
                        </small>
                      </div>
                    </div>
                  </label>
                ) : (
                  renderField(field)
                ),
              )}
            </section>
          </div>
        )}
        <div className={`modal-footer${isPatientForm ? "" : " appointment-modal-footer"}`}>
          <button className="secondary" type="button" onClick={onClose}>
            Cancelar
          </button>
          <button className="primary" type="button" onClick={() => void save()}>
            Salvar cadastro
          </button>
        </div>
      </div>
    </div>
  );
}
