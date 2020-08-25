/* Capturando o SQL de um processo */
SELECT   s.SID, q.users_executing, q.sql_text,round((LAST_CALL_ET) /60/60,2) "Last Call ET Horas"
    FROM v$session s, v$sql q
   WHERE s.SID = 1197
    AND q.address = s.sql_address
ORDER BY s.SID

