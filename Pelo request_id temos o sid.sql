/* Com a mesma finalidade do ver concurrent, basta informar o request_id */
SELECT a.request_id, d.SID, d.serial#, d.osuser, d.process,c.SPID
  FROM apps.fnd_concurrent_requests a,
       apps.fnd_concurrent_processes b,
       v$process c,
       v$session d
 WHERE a.controlling_manager = b.concurrent_process_id
   AND c.pid = b.oracle_process_id
   AND b.session_id = d.audsid
   /*op��o vari�vel ou fixo */
   --AND a.request_id = 8132409
   --fixo - Descomente a linha abaixo
   AND a.request_id = &request
  -- AND a.phase_code = 'R'


