CREATE TABLE `suppliers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(160) NOT NULL,
    `cnpj` VARCHAR(18) NOT NULL,
    `legal_name` VARCHAR(180) NOT NULL,
    `email` VARCHAR(180) NOT NULL,
    `contact` VARCHAR(80) NOT NULL,
    `address` TEXT NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    INDEX `suppliers_name_idx`(`name`),
    INDEX `suppliers_cnpj_idx`(`cnpj`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
