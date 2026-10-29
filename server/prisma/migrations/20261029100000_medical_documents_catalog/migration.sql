ALTER TABLE `digital_certificates`
  ADD COLUMN `doctor_id` INTEGER NULL,
  ADD COLUMN `assigned_user_id` INTEGER NULL,
  ADD INDEX `digital_certificates_doctor_id_active_idx` (`doctor_id`, `active`),
  ADD INDEX `digital_certificates_assigned_user_id_active_idx` (`assigned_user_id`, `active`),
  ADD CONSTRAINT `digital_certificates_doctor_id_fkey`
    FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
    ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `digital_certificates_assigned_user_id_fkey`
    FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`)
    ON DELETE SET NULL ON UPDATE CASCADE;

CREATE TABLE `medication_catalog_items` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(180) NOT NULL,
  `presentation` VARCHAR(180) NOT NULL,
  `active` BOOLEAN NOT NULL DEFAULT true,
  `controlled` BOOLEAN NOT NULL DEFAULT false,
  `created_by_id` INTEGER NOT NULL,
  `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` DATETIME(3) NOT NULL,
  UNIQUE INDEX `medication_catalog_items_name_presentation_key` (`name`, `presentation`),
  INDEX `medication_catalog_items_active_controlled_name_idx` (`active`, `controlled`, `name`),
  PRIMARY KEY (`id`),
  CONSTRAINT `medication_catalog_items_created_by_id_fkey`
    FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `clinical_documents` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `document_number` VARCHAR(32) NULL,
  `validation_code` VARCHAR(64) NOT NULL,
  `type` ENUM('RECEITA', 'ATESTADO') NOT NULL,
  `subtype` VARCHAR(40) NOT NULL,
  `status` ENUM('EMITIDO', 'CANCELADO') NOT NULL DEFAULT 'EMITIDO',
  `content` JSON NOT NULL,
  `pdf_storage_key` VARCHAR(255) NOT NULL,
  `cid_authorized_at` DATETIME(3) NULL,
  `issued_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `medical_record_id` INTEGER NOT NULL,
  `appointment_id` INTEGER NOT NULL,
  `patient_id` INTEGER NOT NULL,
  `doctor_id` INTEGER NOT NULL,
  `issued_by_id` INTEGER NOT NULL,
  `signature_certificate_id` INTEGER NOT NULL,
  `cancelled_at` DATETIME(3) NULL,
  `cancelled_by_id` INTEGER NULL,
  `cancellation_reason` TEXT NULL,
  UNIQUE INDEX `clinical_documents_document_number_key` (`document_number`),
  UNIQUE INDEX `clinical_documents_validation_code_key` (`validation_code`),
  UNIQUE INDEX `clinical_documents_pdf_storage_key_key` (`pdf_storage_key`),
  INDEX `clinical_documents_medical_record_id_issued_at_idx` (`medical_record_id`, `issued_at`),
  INDEX `clinical_documents_appointment_id_issued_at_idx` (`appointment_id`, `issued_at`),
  INDEX `clinical_documents_patient_id_issued_at_idx` (`patient_id`, `issued_at`),
  INDEX `clinical_documents_doctor_id_issued_at_idx` (`doctor_id`, `issued_at`),
  PRIMARY KEY (`id`),
  CONSTRAINT `clinical_documents_medical_record_id_fkey`
    FOREIGN KEY (`medical_record_id`) REFERENCES `medical_records` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `clinical_documents_appointment_id_fkey`
    FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `clinical_documents_patient_id_fkey`
    FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `clinical_documents_doctor_id_fkey`
    FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `clinical_documents_issued_by_id_fkey`
    FOREIGN KEY (`issued_by_id`) REFERENCES `users` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `clinical_documents_cancelled_by_id_fkey`
    FOREIGN KEY (`cancelled_by_id`) REFERENCES `users` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `clinical_documents_signature_certificate_id_fkey`
    FOREIGN KEY (`signature_certificate_id`) REFERENCES `digital_certificates` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
