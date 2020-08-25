/* Formatted on 2005/06/16 15:36 (Formatter Plus v4.7.0) */
SELECT   concurrent_queue_name, user_concurrent_queue_name,
         target_node, max_processes, application_id, concurrent_queue_id,
         control_code, manager_type
    FROM fnd_concurrent_queues_vl
   WHERE enabled_flag = 'Y' AND (user_concurrent_queue_name = 'Purchasing and RI Manager')
ORDER BY DECODE (application_id, 0, DECODE (concurrent_queue_id, 1, 1, 4, 2)),
         SIGN (max_processes) DESC,
         concurrent_queue_name,
         application_id

