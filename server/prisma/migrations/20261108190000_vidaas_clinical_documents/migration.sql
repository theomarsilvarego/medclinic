-- AlterTable
ALTER TABLE `clinical_documents` ADD COLUMN `signature_metadata` JSON NULL,
    ADD COLUMN `signature_provider` ENUM('LOCAL_P12', 'VIDAAS') NOT NULL DEFAULT 'LOCAL_P12',
    MODIFY `status` ENUM('AGUARDANDO_ASSINATURA', 'EMITIDO', 'CANCELADO') NOT NULL DEFAULT 'EMITIDO',
    MODIFY `signature_certificate_id` INTEGER NULL;

-- CreateTable
CREATE TABLE `clinical_signing_sessions` (
    `id` CHAR(36) NOT NULL,
    `status` ENUM('AUTHORIZING', 'READY', 'SIGNING', 'USED', 'FAILED', 'EXPIRED') NOT NULL DEFAULT 'AUTHORIZING',
    `user_id` INTEGER NOT NULL,
    `doctor_id` INTEGER NOT NULL,
    `medical_record_id` INTEGER NOT NULL,
    `authentication_request_id` VARCHAR(120) NULL,
    `credential_id` VARCHAR(120) NULL,
    `verifier_encrypted` TEXT NULL,
    `certificate_metadata` JSON NULL,
    `failure_reason` VARCHAR(255) NULL,
    `expires_at` DATETIME(3) NOT NULL,
    `used_at` DATETIME(3) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    INDEX `clinical_signing_sessions_user_id_medical_record_id_status_e_idx`(`user_id`, `medical_record_id`, `status`, `expires_at`),
    INDEX `clinical_signing_sessions_doctor_id_created_at_idx`(`doctor_id`, `created_at`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `clinical_signing_sessions` ADD CONSTRAINT `clinical_signing_sessions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `clinical_signing_sessions` ADD CONSTRAINT `clinical_signing_sessions_doctor_id_fkey` FOREIGN KEY (`doctor_id`) REFERENCES `doctors`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `clinical_signing_sessions` ADD CONSTRAINT `clinical_signing_sessions_medical_record_id_fkey` FOREIGN KEY (`medical_record_id`) REFERENCES `medical_records`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
