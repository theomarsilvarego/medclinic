-- O prontuário médico passa a armazenar apenas Condutas entre os campos clínicos.
ALTER TABLE `medical_records`
  DROP COLUMN `chief_complaint`,
  DROP COLUMN `medical_history`,
  DROP COLUMN `physical_exam`,
  DROP COLUMN `diagnosis`,
  DROP COLUMN `prescription`;
