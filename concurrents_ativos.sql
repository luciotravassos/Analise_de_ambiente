/* Esse script localiza o concurrent e o seu PID,SID,SERIAL# pega as LOGS e o OUTS*/
SELECT   sess.SID, sess.serial#, TO_NUMBER (proc.spid) "SO PID",
         fnd.os_process_id, sess.osuser, sess.username, sess.module,
         fnd.request_id,
         TO_CHAR (fnd.actual_start_date, 'dd-mon-yyyy hh24:mi:ss') "Started",
         fnd.logfile_name, fnd.outfile_name
    FROM v$session sess, apps.fnd_concurrent_requests fnd, v$process proc
   WHERE sess.module IS NOT NULL
     AND sess.audsid = fnd.oracle_session_id
     AND fnd.status_code = 'R'
     AND fnd.phase_code = 'R'
     AND proc.addr = sess.paddr(+)
     AND proc.spid IS NOT NULL
ORDER BY fnd.actual_start_date
/

