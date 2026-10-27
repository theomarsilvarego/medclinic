ALTER TABLE `injectables`
  ADD COLUMN `expiration_date` DATE NULL,
  ADD COLUMN `lot` VARCHAR(100) NULL,
  ADD COLUMN `unit` VARCHAR(40) NULL;
