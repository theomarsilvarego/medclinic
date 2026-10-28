ALTER TABLE `appointments`
  MODIFY COLUMN `item_type` ENUM('ATENDIMENTO', 'PROCEDIMENTO', 'INJETAVEL', 'COLETA') NOT NULL,
  ADD COLUMN `injectable_id` INTEGER NULL,
  ADD INDEX `appointments_injectable_id_fkey` (`injectable_id`);

ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_injectable_id_fkey`
  FOREIGN KEY (`injectable_id`) REFERENCES `injectables` (`id`)
  ON DELETE RESTRICT ON UPDATE CASCADE;
