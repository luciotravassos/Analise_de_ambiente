select
 --      substr(a.spid,1,10) pid,
       substr(b.sid,1,5) sid,
       substr(b.serial#,1,5) ser#,
       substr(b.username,1,15) username,
       substr(to_char(b.LOGON_TIME,'DD/MM/YYYY HH24:MI'),1,16) Data_Hora,
       b.server,
       b.status,
       b.lockwait,
       substr(b.osuser,1,10) os_user,
       substr(b.machine,1,20) box,
       b.process "Processo",
       process,
       b.module,
       b.program program,
       round((b.LAST_CALL_ET) /60/60,2) "Last Call ET Horas"
from v$session b, v$process a
 where (b.status IN ('ACTIVE','KILLED','INACTIVE') or b.lockwait is not null)
AND b.paddr = a.addr
and type='USER' and b.username is not null
and sid = 4441
order by b.status,b.username
