-- Atualiza a UF dos pacientes conforme o DDD do campo patients.phone.
-- Requer MySQL 8+ e a coluna patients.state já criada.
-- Execute primeiro em homologação e faça backup antes da execução em produção.

UPDATE `patients` AS p
JOIN (
  SELECT
    `id`,
    CASE
      WHEN REGEXP_REPLACE(COALESCE(`phone`, ''), '[^0-9]', '') LIKE '55%' THEN
        SUBSTRING(REGEXP_REPLACE(COALESCE(`phone`, ''), '[^0-9]', ''), 3, 2)
      ELSE
        SUBSTRING(REGEXP_REPLACE(COALESCE(`phone`, ''), '[^0-9]', ''), 1, 2)
    END AS `ddd`
  FROM `patients`
) AS normalized ON normalized.`id` = p.`id`
SET p.`state` = CASE
  WHEN normalized.`ddd` IN ('11','12','13','14','15','16','17','18','19') THEN 'SP'
  WHEN normalized.`ddd` IN ('21','22','24') THEN 'RJ'
  WHEN normalized.`ddd` IN ('27','28') THEN 'ES'
  WHEN normalized.`ddd` IN ('31','32','33','34','35','37','38') THEN 'MG'
  WHEN normalized.`ddd` IN ('41','42','43','44','45','46') THEN 'PR'
  WHEN normalized.`ddd` IN ('47','48','49') THEN 'SC'
  WHEN normalized.`ddd` IN ('51','53','54','55') THEN 'RS'
  WHEN normalized.`ddd` = '61' THEN 'DF'
  WHEN normalized.`ddd` IN ('62','64') THEN 'GO'
  WHEN normalized.`ddd` = '63' THEN 'TO'
  WHEN normalized.`ddd` IN ('65','66') THEN 'MT'
  WHEN normalized.`ddd` = '67' THEN 'MS'
  WHEN normalized.`ddd` = '68' THEN 'AC'
  WHEN normalized.`ddd` = '69' THEN 'RO'
  WHEN normalized.`ddd` IN ('71','73','74','75','77') THEN 'BA'
  WHEN normalized.`ddd` = '79' THEN 'SE'
  WHEN normalized.`ddd` IN ('81','87') THEN 'PE'
  WHEN normalized.`ddd` = '82' THEN 'AL'
  WHEN normalized.`ddd` = '83' THEN 'PB'
  WHEN normalized.`ddd` = '84' THEN 'RN'
  WHEN normalized.`ddd` IN ('85','88') THEN 'CE'
  WHEN normalized.`ddd` IN ('86','89') THEN 'PI'
  WHEN normalized.`ddd` IN ('91','93','94') THEN 'PA'
  WHEN normalized.`ddd` IN ('92','97') THEN 'AM'
  WHEN normalized.`ddd` = '95' THEN 'RR'
  WHEN normalized.`ddd` = '96' THEN 'AP'
  WHEN normalized.`ddd` IN ('98','99') THEN 'MA'
  ELSE NULL
END;

-- Conferência após o update:
-- SELECT id, full_name, phone, state
-- FROM patients
-- ORDER BY full_name;
