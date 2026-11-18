ALTER TABLE `financial_receivable_installments`
  ADD COLUMN `payment_method` ENUM('PIX', 'DEBIT_CARD', 'CREDIT_CARD', 'CASH', 'BANK_TRANSFER', 'OTHER') NULL;
