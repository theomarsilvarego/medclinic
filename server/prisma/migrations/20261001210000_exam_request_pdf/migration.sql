ALTER TABLE `exam_requests`
    ADD COLUMN `code` VARCHAR(20) NULL,
    ADD COLUMN `pdf_url` VARCHAR(255) NULL;

UPDATE `exam_requests`
SET `code` = CONCAT('RX-', LPAD(`id`, 6, '0'))
WHERE `code` IS NULL;

ALTER TABLE `exam_requests`
    MODIFY `code` VARCHAR(20) NOT NULL,
    ADD UNIQUE INDEX `exam_requests_code_key`(`code`);
