-- Mantém os IDs existentes e define o próximo ID automático de paciente.
-- O MySQL preserva o maior valor atual caso ele já seja superior a 62333529.
ALTER TABLE `patients` AUTO_INCREMENT = 62333529;
