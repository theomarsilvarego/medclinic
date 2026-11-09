ALTER TABLE `medication_catalog_items`
  MODIFY `presentation` VARCHAR(180) NULL,
  ADD COLUMN `route` ENUM('ORAL', 'VAGINAL', 'TOPICO') NULL,
  ADD COLUMN `dose` VARCHAR(100) NULL,
  ADD COLUMN `posology` VARCHAR(300) NULL,
  DROP INDEX `medication_catalog_items_name_presentation_key`,
  ADD UNIQUE INDEX `medication_catalog_items_name_route_dose_key` (`name`, `route`, `dose`);
