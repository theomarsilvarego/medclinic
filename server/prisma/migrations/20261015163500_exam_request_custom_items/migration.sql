-- Permite ajustar os tipos de exames do grupo no momento da solicitação.
ALTER TABLE `exam_requests` ADD COLUMN `exam_type_ids` JSON NULL;
