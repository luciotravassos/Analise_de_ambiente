/* Script que analisa o numero de processos das filas */
SELECT   SUBSTR (user_concurrent_queue_name, 1, 30) "CONCURRENT",
         concurrent_queue_name,
         running_processes,
         --target_processes,
         max_processes "PROCESSO"
    FROM apps.fnd_concurrent_queues_vl
   WHERE enabled_flag = 'Y'
   AND TARGET_NODE IS NOT NULL
   AND user_concurrent_queue_name in ('Standard Manager','Visa Exp3')
ORDER BY DECODE (application_id, 0, DECODE (concurrent_queue_id, 1, 1, 4, 2)),
         SIGN (max_processes) DESC,
         concurrent_queue_name,
         application_id;