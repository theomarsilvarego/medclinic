ALTER TABLE `patients`
  ADD COLUMN `allergies` TEXT NULL,
  ADD COLUMN `comorbidities` TEXT NULL,
  ADD COLUMN `medications_in_use` TEXT NULL;
