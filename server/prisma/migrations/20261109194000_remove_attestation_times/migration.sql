-- Remove os horários estruturados e o intervalo automático do texto histórico dos atestados.
-- Os PDFs previamente assinados são mantidos inalterados para preservar suas assinaturas.
UPDATE `clinical_documents`
SET `content` = JSON_REMOVE(
  CASE
    WHEN JSON_CONTAINS_PATH(`content`, 'all', '$.template', '$.entryTime', '$.exitTime') THEN
      JSON_SET(
        `content`,
        '$.template',
        REPLACE(
          JSON_UNQUOTE(JSON_EXTRACT(`content`, '$.template')),
          CONCAT(
            ', no período de ',
            JSON_UNQUOTE(JSON_EXTRACT(`content`, '$.entryTime')),
            ' a ',
            JSON_UNQUOTE(JSON_EXTRACT(`content`, '$.exitTime'))
          ),
          ''
        )
      )
    ELSE `content`
  END,
  '$.entryTime',
  '$.exitTime'
)
WHERE `type` = 'ATESTADO';
