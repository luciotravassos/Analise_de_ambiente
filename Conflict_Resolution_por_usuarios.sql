SELECT  count(1) QUANTIDADE,
--REQUEST_ID,
    --PHASE_CODE,
    --STATUS_CODE,
    --ARGUMENT_TEXT,
    USER_CONCURRENT_PROGRAM_NAME,
    fu.user_name
    --DESCRIPTION
    --CONCURRENT_PROGRAM_ID,
    --PROGRAM_APPLICATION_ID,
    --CONCURRENT_QUEUE_ID
    --QUEUE_APPLICATION_ID
  FROM fnd_concurrent_worker_requests FCWR,
	apps.fnd_user fu
 WHERE (phase_code = 'P' OR phase_code = 'R')
   and FCWR.requested_by = fu.user_id
   AND hold_flag != 'Y'
   AND requested_start_date <= SYSDATE
   AND ('' IS NULL OR
       ('' = 'B' AND phase_code = 'R' AND status_code IN ('I', 'Q')))
   AND '4' IN (0, 1, 4)
   AND (concurrent_queue_id = 4)
   AND (queue_application_id = 0)
group by USER_CONCURRENT_PROGRAM_NAME,user_name
order by QUANTIDADE DESC,user_name,user_concurrent_program_name