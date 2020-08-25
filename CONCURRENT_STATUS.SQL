/* Formatted on 2004/10/21 04:19 (Formatter Plus v4.7.0) */
SELECT
--ROWID,ROW_ID,
         concurrent_queue_name, user_concurrent_queue_name, target_node,
         max_processes, application_id, concurrent_queue_id, control_code,
         manager_type
    FROM apps.fnd_concurrent_queues_vl
   WHERE enabled_flag = 'Y'
ORDER BY DECODE (application_id, 0, DECODE (concurrent_queue_id, 1, 1, 4, 2)),
         SIGN (max_processes) DESC,
         concurrent_queue_name,
         application_id;

