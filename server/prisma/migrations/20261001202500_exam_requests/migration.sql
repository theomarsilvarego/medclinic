CREATE TABLE `exam_requests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `medical_record_id` INTEGER NOT NULL,
    `patient_id` INTEGER NOT NULL,
    `exam_group_id` INTEGER NOT NULL,
    `group_name` VARCHAR(160) NOT NULL,
    `status` ENUM('AGUARDANDO_RESULTADO') NOT NULL DEFAULT 'AGUARDANDO_RESULTADO',
    `requested_by_id` INTEGER NOT NULL,
    `requested_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    INDEX `exam_requests_patient_id_idx`(`patient_id`),
    INDEX `exam_requests_requested_by_id_idx`(`requested_by_id`),
    UNIQUE INDEX `exam_requests_medical_record_id_exam_group_id_key`(`medical_record_id`, `exam_group_id`),
    PRIMARY KEY (`id`),
    CONSTRAINT `exam_requests_medical_record_id_fkey` FOREIGN KEY (`medical_record_id`) REFERENCES `medical_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `exam_requests_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `exam_requests_exam_group_id_fkey` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `exam_requests_requested_by_id_fkey` FOREIGN KEY (`requested_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
