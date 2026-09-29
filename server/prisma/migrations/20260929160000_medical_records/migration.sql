CREATE TABLE `medical_records` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `patient_id` INTEGER NOT NULL,
    `author_id` INTEGER NOT NULL,
    `appointment_id` INTEGER NULL,
    `record_date` DATE NOT NULL,
    `title` VARCHAR(160) NOT NULL,
    `chief_complaint` TEXT NULL,
    `medical_history` TEXT NULL,
    `physical_exam` TEXT NULL,
    `diagnosis` TEXT NULL,
    `conduct` TEXT NULL,
    `prescription` TEXT NULL,
    `notes` TEXT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    INDEX `medical_records_patient_id_record_date_idx`(`patient_id`, `record_date`),
    INDEX `medical_records_author_id_record_date_idx`(`author_id`, `record_date`),
    INDEX `medical_records_appointment_id_idx`(`appointment_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE `medical_records` ADD CONSTRAINT `medical_records_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `medical_records` ADD CONSTRAINT `medical_records_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `medical_records` ADD CONSTRAINT `medical_records_appointment_id_fkey` FOREIGN KEY (`appointment_id`) REFERENCES `appointments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
