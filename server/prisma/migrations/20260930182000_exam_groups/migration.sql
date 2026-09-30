CREATE TABLE `exam_groups` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(160) NOT NULL,
    `created_by_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    INDEX `exam_groups_created_by_id_idx`(`created_by_id`),
    INDEX `exam_groups_name_idx`(`name`),
    PRIMARY KEY (`id`),
    CONSTRAINT `exam_groups_created_by_id_fkey` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `exam_group_items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER NOT NULL,
    `exam_type_id` INTEGER NOT NULL,
    INDEX `exam_group_items_exam_type_id_idx`(`exam_type_id`),
    UNIQUE INDEX `exam_group_items_group_id_exam_type_id_key`(`group_id`, `exam_type_id`),
    PRIMARY KEY (`id`),
    CONSTRAINT `exam_group_items_group_id_fkey` FOREIGN KEY (`group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `exam_group_items_exam_type_id_fkey` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_types` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
