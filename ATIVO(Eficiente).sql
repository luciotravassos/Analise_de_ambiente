select substr(a.spid, 1, 10) "Unix pid",
       substr(b.sid, 1, 5) sid,
       substr(b.serial#, 1, 5) ser#,
       substr(b.username, 1, 15) username,
       substr(to_char(b.LOGON_TIME, 'DD/MM/YYYY HH24:MI'), 1, 16) Data_Hora,
       b.server,
       b.status,
       b.lockwait,
       substr(b.osuser, 1, 10) os_user,
       substr(b.machine, 1, 20) box,
       b.process "Processo",
       b.module,
       b.program program,
       round((b.LAST_CALL_ET) / 60 / 60, 2) "Last Call ET Horas"
  from v$session b, v$process a
 Where 
  (b.status IN ('ACTIVE', 'KILLED') or b.lockwait is not null)
 --(b.status IN ('INACTIVE', 'KILLED') or b.lockwait is not null)
   AND 
   b.paddr = a.addr
   and type = 'USER'
   and b.username is not null
 order by  b.last_call_et desc--,b.status, b.MACHINE, b.username asc