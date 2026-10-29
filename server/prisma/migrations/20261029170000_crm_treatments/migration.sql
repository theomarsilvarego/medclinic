CREATE TABLE `crm_treatments` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `patient_id` INTEGER NOT NULL,
  `product_type` ENUM('INJETAVEL', 'PROCEDIMENTO') NOT NULL,
  `product_id` INTEGER NOT NULL,
  `product_name` VARCHAR(160) NOT NULL,
  `category` ENUM('VACINAS', 'VITAMINAS', 'PROTOCOLOS', 'MEDICACOES', 'LASER_INTIMO', 'CLAREAMENTO_INTIMO', 'MANUTENCAO_LASER') NOT NULL,
  `status` ENUM('INICIADO', 'EM_ANDAMENTO', 'CONCLUIDO') NOT NULL DEFAULT 'INICIADO',
  `observation` TEXT NULL,
  `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `crm_treatments_patient_id_idx` (`patient_id`),
  INDEX `crm_treatments_status_idx` (`status`),
  CONSTRAINT `crm_treatments_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `crm_doses` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `treatment_id` INTEGER NOT NULL,
  `dose_date` DATE NOT NULL,
  `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  INDEX `crm_doses_treatment_id_dose_date_idx` (`treatment_id`, `dose_date`),
  CONSTRAINT `crm_doses_treatment_id_fkey` FOREIGN KEY (`treatment_id`) REFERENCES `crm_treatments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
