-- CreateTable
CREATE TABLE `financial_accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(120) NOT NULL,
    `type` ENUM('CASH', 'BANK', 'OTHER') NOT NULL,
    `opening_balance` DECIMAL(12, 2) NOT NULL DEFAULT 0,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    INDEX `financial_accounts_type_active_idx`(`type`, `active`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_sales` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(36) NOT NULL,
    `service_description` VARCHAR(255) NOT NULL,
    `patient_id` INTEGER NOT NULL,
    `professional_id` INTEGER NULL,
    `professional_name` VARCHAR(180) NOT NULL,
    `appointment_id` INTEGER NULL,
    `sale_date` DATE NOT NULL,
    `gross_amount` DECIMAL(12, 2) NOT NULL,
    `discount_amount` DECIMAL(12, 2) NOT NULL DEFAULT 0,
    `total_amount` DECIMAL(12, 2) NOT NULL,
    `status` ENUM('PENDING', 'PARTIAL', 'PAID', 'CANCELED') NOT NULL DEFAULT 'PENDING',
    `idempotency_key` VARCHAR(100) NOT NULL,
    `created_by_id` INTEGER NOT NULL,
    `canceled_at` DATETIME(3) NULL,
    `cancellation_reason` TEXT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `financial_sales_code_key`(`code`),
    UNIQUE INDEX `financial_sales_idempotency_key_key`(`idempotency_key`),
    INDEX `financial_sales_sale_date_status_idx`(`sale_date`, `status`),
    INDEX `financial_sales_patient_id_sale_date_idx`(`patient_id`, `sale_date`),
    INDEX `financial_sales_professional_id_sale_date_idx`(`professional_id`, `sale_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_sale_items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sale_id` INTEGER NOT NULL,
    `source_type` VARCHAR(32) NULL,
    `source_id` INTEGER NULL,
    `source_key` VARCHAR(80) NULL,
    `description` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(12, 2) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `financial_sale_items_source_key_key`(`source_key`),
    INDEX `financial_sale_items_sale_id_idx`(`sale_id`),
    INDEX `financial_sale_items_source_type_source_id_idx`(`source_type`, `source_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_receivables` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sale_id` INTEGER NOT NULL,
    `total_amount` DECIMAL(12, 2) NOT NULL,
    `paid_amount` DECIMAL(12, 2) NOT NULL DEFAULT 0,
    `due_date` DATE NOT NULL,
    `installment_count` INTEGER NOT NULL DEFAULT 1,
    `preferred_payment_method` ENUM('PIX', 'DEBIT_CARD', 'CREDIT_CARD', 'CASH', 'BANK_TRANSFER', 'OTHER') NULL,
    `status` ENUM('PENDING', 'PARTIAL', 'PAID', 'CANCELED') NOT NULL DEFAULT 'PENDING',

    UNIQUE INDEX `financial_receivables_sale_id_key`(`sale_id`),
    INDEX `financial_receivables_due_date_status_idx`(`due_date`, `status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_receivable_installments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `receivable_id` INTEGER NOT NULL,
    `number` INTEGER NOT NULL,
    `due_date` DATE NOT NULL,
    `amount` DECIMAL(12, 2) NOT NULL,
    `paid_amount` DECIMAL(12, 2) NOT NULL DEFAULT 0,
    `status` ENUM('PENDING', 'PARTIAL', 'PAID', 'CANCELED') NOT NULL DEFAULT 'PENDING',

    INDEX `financial_receivable_installments_due_date_status_idx`(`due_date`, `status`),
    UNIQUE INDEX `financial_receivable_installments_receivable_id_number_key`(`receivable_id`, `number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_receivable_payments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `receivable_id` INTEGER NOT NULL,
    `installment_id` INTEGER NULL,
    `account_id` INTEGER NOT NULL,
    `amount` DECIMAL(12, 2) NOT NULL,
    `reversed_amount` DECIMAL(12, 2) NOT NULL DEFAULT 0,
    `payment_date` DATE NOT NULL,
    `method` ENUM('PIX', 'DEBIT_CARD', 'CREDIT_CARD', 'CASH', 'BANK_TRANSFER', 'OTHER') NOT NULL,
    `idempotency_key` VARCHAR(100) NOT NULL,
    `created_by_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `financial_receivable_payments_idempotency_key_key`(`idempotency_key`),
    INDEX `financial_receivable_payments_receivable_id_payment_date_idx`(`receivable_id`, `payment_date`),
    INDEX `financial_receivable_payments_account_id_payment_date_idx`(`account_id`, `payment_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_receivable_allocations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `payment_id` INTEGER NOT NULL,
    `installment_id` INTEGER NOT NULL,
    `amount` DECIMAL(12, 2) NOT NULL,
    `reversed_amount` DECIMAL(12, 2) NOT NULL DEFAULT 0,

    INDEX `financial_receivable_allocations_installment_id_idx`(`installment_id`),
    UNIQUE INDEX `financial_receivable_allocations_payment_id_installment_id_key`(`payment_id`, `installment_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_payables` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(255) NOT NULL,
    `category` VARCHAR(100) NOT NULL,
    `supplier_id` INTEGER NOT NULL,
    `amount` DECIMAL(12, 2) NOT NULL,
    `paid_amount` DECIMAL(12, 2) NOT NULL DEFAULT 0,
    `due_date` DATE NOT NULL,
    `status` ENUM('PENDING', 'PARTIAL', 'PAID', 'CANCELED') NOT NULL DEFAULT 'PENDING',
    `idempotency_key` VARCHAR(100) NOT NULL,
    `created_by_id` INTEGER NOT NULL,
    `canceled_at` DATETIME(3) NULL,
    `cancellation_reason` TEXT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `financial_payables_idempotency_key_key`(`idempotency_key`),
    INDEX `financial_payables_due_date_status_idx`(`due_date`, `status`),
    INDEX `financial_payables_supplier_id_due_date_idx`(`supplier_id`, `due_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_payable_payments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `payable_id` INTEGER NOT NULL,
    `account_id` INTEGER NOT NULL,
    `amount` DECIMAL(12, 2) NOT NULL,
    `reversed_amount` DECIMAL(12, 2) NOT NULL DEFAULT 0,
    `payment_date` DATE NOT NULL,
    `method` ENUM('PIX', 'DEBIT_CARD', 'CREDIT_CARD', 'CASH', 'BANK_TRANSFER', 'OTHER') NOT NULL,
    `idempotency_key` VARCHAR(100) NOT NULL,
    `created_by_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `financial_payable_payments_idempotency_key_key`(`idempotency_key`),
    INDEX `financial_payable_payments_payable_id_payment_date_idx`(`payable_id`, `payment_date`),
    INDEX `financial_payable_payments_account_id_payment_date_idx`(`account_id`, `payment_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `financial_movements` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `type` ENUM('ENTRADA', 'SAIDA', 'TRANSFERENCIA_ENTRADA', 'TRANSFERENCIA_SAIDA', 'SUPRIMENTO', 'SANGRIA', 'ABERTURA', 'AJUSTE_ENTRADA', 'AJUSTE_SAIDA', 'ESTORNO_ENTRADA', 'ESTORNO_SAIDA') NOT NULL,
    `amount` DECIMAL(12, 2) NOT NULL,
    `movement_date` DATE NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `origin_type` VARCHAR(40) NOT NULL,
    `origin_id` INTEGER NULL,
    `transfer_group_id` VARCHAR(36) NULL,
    `idempotency_key` VARCHAR(120) NOT NULL,
    `receivable_payment_id` INTEGER NULL,
    `payable_payment_id` INTEGER NULL,
    `reversal_of_id` INTEGER NULL,
    `created_by_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `financial_movements_idempotency_key_key`(`idempotency_key`),
    UNIQUE INDEX `financial_movements_receivable_payment_id_key`(`receivable_payment_id`),
    UNIQUE INDEX `financial_movements_payable_payment_id_key`(`payable_payment_id`),
    INDEX `financial_movements_account_id_movement_date_idx`(`account_id`, `movement_date`),
    INDEX `financial_movements_origin_type_origin_id_idx`(`origin_type`, `origin_id`),
    INDEX `financial_movements_transfer_group_id_idx`(`transfer_group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cash_sessions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `status` ENUM('ABERTA', 'FECHADA') NOT NULL DEFAULT 'ABERTA',
    `opening_amount` DECIMAL(12, 2) NOT NULL,
    `closing_amount` DECIMAL(12, 2) NULL,
    `expected_closing_amount` DECIMAL(12, 2) NULL,
    `difference` DECIMAL(12, 2) NULL,
    `opened_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `closed_at` DATETIME(3) NULL,
    `open_session_key` VARCHAR(32) NULL,
    `opened_by_id` INTEGER NOT NULL,
    `closed_by_id` INTEGER NULL,

    UNIQUE INDEX `cash_sessions_open_session_key_key`(`open_session_key`),
    INDEX `cash_sessions_account_id_opened_at_idx`(`account_id`, `opened_at`),
    INDEX `cash_sessions_status_opened_at_idx`(`status`, `opened_at`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `financial_sales` ADD CONSTRAINT `financial_sales_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_sales` ADD CONSTRAINT `financial_sales_professional_id_fkey` FOREIGN KEY (`professional_id`) REFERENCES `doctors`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_sales` ADD CONSTRAINT `financial_sales_appointment_id_fkey` FOREIGN KEY (`appointment_id`) REFERENCES `appointments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_sales` ADD CONSTRAINT `financial_sales_created_by_id_fkey` FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_sale_items` ADD CONSTRAINT `financial_sale_items_sale_id_fkey` FOREIGN KEY (`sale_id`) REFERENCES `financial_sales`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivables` ADD CONSTRAINT `financial_receivables_sale_id_fkey` FOREIGN KEY (`sale_id`) REFERENCES `financial_sales`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivable_installments` ADD CONSTRAINT `financial_receivable_installments_receivable_id_fkey` FOREIGN KEY (`receivable_id`) REFERENCES `financial_receivables`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivable_payments` ADD CONSTRAINT `financial_receivable_payments_receivable_id_fkey` FOREIGN KEY (`receivable_id`) REFERENCES `financial_receivables`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivable_payments` ADD CONSTRAINT `financial_receivable_payments_installment_id_fkey` FOREIGN KEY (`installment_id`) REFERENCES `financial_receivable_installments`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivable_payments` ADD CONSTRAINT `financial_receivable_payments_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `financial_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivable_payments` ADD CONSTRAINT `financial_receivable_payments_created_by_id_fkey` FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivable_allocations` ADD CONSTRAINT `financial_receivable_allocations_payment_id_fkey` FOREIGN KEY (`payment_id`) REFERENCES `financial_receivable_payments`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_receivable_allocations` ADD CONSTRAINT `financial_receivable_allocations_installment_id_fkey` FOREIGN KEY (`installment_id`) REFERENCES `financial_receivable_installments`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_payables` ADD CONSTRAINT `financial_payables_supplier_id_fkey` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_payables` ADD CONSTRAINT `financial_payables_created_by_id_fkey` FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_payable_payments` ADD CONSTRAINT `financial_payable_payments_payable_id_fkey` FOREIGN KEY (`payable_id`) REFERENCES `financial_payables`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_payable_payments` ADD CONSTRAINT `financial_payable_payments_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `financial_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_payable_payments` ADD CONSTRAINT `financial_payable_payments_created_by_id_fkey` FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_movements` ADD CONSTRAINT `financial_movements_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `financial_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_movements` ADD CONSTRAINT `financial_movements_created_by_id_fkey` FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_movements` ADD CONSTRAINT `financial_movements_receivable_payment_id_fkey` FOREIGN KEY (`receivable_payment_id`) REFERENCES `financial_receivable_payments`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_movements` ADD CONSTRAINT `financial_movements_payable_payment_id_fkey` FOREIGN KEY (`payable_payment_id`) REFERENCES `financial_payable_payments`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `financial_movements` ADD CONSTRAINT `financial_movements_reversal_of_id_fkey` FOREIGN KEY (`reversal_of_id`) REFERENCES `financial_movements`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cash_sessions` ADD CONSTRAINT `cash_sessions_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `financial_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cash_sessions` ADD CONSTRAINT `cash_sessions_opened_by_id_fkey` FOREIGN KEY (`opened_by_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cash_sessions` ADD CONSTRAINT `cash_sessions_closed_by_id_fkey` FOREIGN KEY (`closed_by_id`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
