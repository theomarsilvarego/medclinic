CREATE TABLE `injectables` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(160) NOT NULL,
    `type` ENUM('VITAMINAS', 'PROTOCOLOS', 'IMUNIDADES') NOT NULL,
    `supplier` VARCHAR(160) NOT NULL,
    `invoice_value` DECIMAL(10, 2) NOT NULL,
    `value` DECIMAL(10, 2) NOT NULL,
    `quantity` INTEGER NOT NULL DEFAULT 0,
    `minimum` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    INDEX `injectables_type_idx`(`type`),
    INDEX `injectables_name_idx`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
