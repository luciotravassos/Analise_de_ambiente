/* Verifica o processo, o id e phase code */
SELECT   c.os_process_id, a.oracle_id, a.request_id, a.requested_by,
         b.user_name, a.phase_code, a.completion_text
    FROM applsys.fnd_concurrent_requests a,
         applsys.fnd_user b,
         applsys.fnd_concurrent_processes c
   WHERE a.requested_by = b.user_id
     AND c.concurrent_process_id = a.controlling_manager
     AND a.phase_code IN ('R', 'T')
ORDER BY c.os_process_id


