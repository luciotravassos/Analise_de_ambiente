/* Internal Manager processes */
SELECT   concurrent_process_id, oracle_process_id,
         os_process_id, process_start_date, gsm_internal_info,
         process_status_code, concurrent_queue_id, queue_application_id
    FROM apps.fnd_concurrent_processes 
   WHERE (concurrent_queue_id = 1) AND (queue_application_id = 0)
   ORDER BY DECODE (process_status_code,
                 'R', 1,
                 'T', 1,
                 'A', 2,
                 'P', 2,
                 'Z', 3,
                 'K', 3,
                 'S', 3,
                 'X', 3,
                 4
                ),
         -TO_NUMBER (TO_CHAR (last_update_date, 'YYYYMMDDSSSSS'))

