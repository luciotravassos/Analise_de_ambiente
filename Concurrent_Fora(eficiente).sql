SELECT concurrent_queue_name
  FROM apps.fnd_concurrent_queues_vl
 WHERE enabled_flag = 'Y'
   and running_processes - max_processes <> 0
   
   
  /* SELECT concurrent_queue_name
FROM apps.fnd_concurrent_queues_vl
WHERE enabled_flag = 'Y'
and running_processes=0;*/
