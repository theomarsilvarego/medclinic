ALTER TABLE `appointment_attachments`
  ADD COLUMN `exam_type` VARCHAR(40) NULL,
  ADD COLUMN `exam_date` DATE NULL;
