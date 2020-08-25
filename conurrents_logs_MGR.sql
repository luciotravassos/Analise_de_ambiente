/* IDENTIFICA O LOG DOS CONCURRENTS*/
SELECT   *
    FROM apps.fnd_concurrent_processes
   WHERE db_name = (SELECT NAME
                      FROM v$database)
/* Nas linhas acima identifica o todos os logs
abaixo identifica os especificos*/
    AND logfile_name LIKE '/pvisaicsf/log/PVISAI/PVISAI_%.mgr'
ORDER BY last_update_date DESC

