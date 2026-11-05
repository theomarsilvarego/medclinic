CREATE TABLE `ultrasound_catalog_items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(160) NOT NULL,
    `description` TEXT NULL,
    `observation` TEXT NULL,
    `performed_in_clinic` BOOLEAN NOT NULL DEFAULT false,
    `value` DECIMAL(10, 2) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    INDEX `ultrasound_catalog_items_name_idx`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
