SELECT fcp.user_concurrent_program_name "Program", count(1)
  FROM apps.fnd_concurrent_requests    fcr,
       apps.fnd_concurrent_programs_tl fcp,
       apps.FND_CONCURRENT_QUEUES_TL   mgr,
       apps.fnd_concurrent_processes   pro
 WHERE fcr.program_application_id = fcp.application_id
   AND fcr.concurrent_program_id = fcp.concurrent_program_id
   AND fcp.LANGUAGE = 'US'
   AND pro.CONCURRENT_PROCESS_ID = fcr.CONTROLLING_MANAGER
   AND pro.QUEUE_APPLICATION_ID = mgr.APPLICATION_ID
   and pro.CONCURRENT_QUEUE_ID = mgr.CONCURRENT_QUEUE_ID
   and mgr.SOURCE_LANG = 'PTB'
   and fcr.actual_start_date between to_date('01/11/05', 'DD/MM/YY') and
       to_date('30/11/05', 'DD/MM/YY')
 group by fcp.user_concurrent_program_name