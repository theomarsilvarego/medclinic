CREATE TABLE `digital_certificates` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(160) NOT NULL,
    `file_name` VARCHAR(255) NOT NULL,
    `subject` VARCHAR(255) NULL,
    `issuer` VARCHAR(255) NULL,
    `serial_number` VARCHAR(255) NULL,
    `valid_from` DATETIME(3) NULL,
    `valid_to` DATETIME(3) NULL,
    `pfx_encrypted` LONGTEXT NOT NULL,
    `password_encrypted` TEXT NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `uploaded_by_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    INDEX `digital_certificates_active_idx`(`active`),
    PRIMARY KEY (`id`),
    CONSTRAINT `digital_certificates_uploaded_by_id_fkey` FOREIGN KEY (`uploaded_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
