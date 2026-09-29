CREATE TABLE `attendances` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(160) NOT NULL,
  `value` DECIMAL(10, 2) NOT NULL,
  `insurance_id` INTEGER NOT NULL,
  `active` BOOLEAN NOT NULL DEFAULT true,
  `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `attendances_insurance_id_idx` (`insurance_id`),
  CONSTRAINT `attendances_insurance_id_fkey` FOREIGN KEY (`insurance_id`) REFERENCES `insurances` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
