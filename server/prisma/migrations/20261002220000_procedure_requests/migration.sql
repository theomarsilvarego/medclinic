CREATE TABLE `procedure_requests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `medical_record_id` INTEGER NOT NULL,
    `patient_id` INTEGER NOT NULL,
    `procedure_id` INTEGER NOT NULL,
    `name` VARCHAR(160) NOT NULL,
    `value` DECIMAL(10, 2) NOT NULL,
    `status` ENUM('AGUARDANDO_AGENDAMENTO') NOT NULL DEFAULT 'AGUARDANDO_AGENDAMENTO',
    `requested_by_id` INTEGER NOT NULL,
    `requested_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    INDEX `procedure_requests_patient_id_idx`(`patient_id`),
    INDEX `procedure_requests_requested_by_id_idx`(`requested_by_id`),
    UNIQUE INDEX `procedure_requests_medical_record_id_procedure_id_key`(`medical_record_id`, `procedure_id`),
    PRIMARY KEY (`id`),
    CONSTRAINT `procedure_requests_medical_record_id_fkey` FOREIGN KEY (`medical_record_id`) REFERENCES `medical_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `procedure_requests_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `procedure_requests_procedure_id_fkey` FOREIGN KEY (`procedure_id`) REFERENCES `procedures` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `procedure_requests_requested_by_id_fkey` FOREIGN KEY (`requested_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
