/* Script que identifica o processo no banco e no SO pelo PID DO UNIX*/
SELECT SUBSTR(a.spid, 1, 10) "PID UNIX",
       SUBSTR(b.SID, 1, 5) SID,
       SUBSTR(b.serial#, 1, 5) ser#,
       SUBSTR(b.username, 1, 15) username,
       SUBSTR(TO_CHAR(b.logon_time, 'DD/MM/YYYY HH24:MI'), 1, 16) data_hora,
       b.server,
       b.status,
       b.lockwait,
       SUBSTR(b.osuser, 1, 10) os_user,
       SUBSTR(b.machine, 1, 20) box,
       b.process "Processo",
       b.module,
       b.program program,
       b.action,
       round((b.LAST_CALL_ET) / 60 / 60, 2) "Last Call ET Horas"
  FROM v$session b, v$process a
 WHERE a.addr = b.paddr
   and a.spid in (&listpid)
      -- AND ROWNUM = 2
   AND b.paddr = a.addr
 ORDER BY b.status, b.username