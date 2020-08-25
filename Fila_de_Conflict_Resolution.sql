SELECT COUNT(*) Conflict_Manager
/* REQUEST_ID,
    PHASE_CODE,
    STATUS_CODE,
    ARGUMENT_TEXT,
    REQUESTED_BY,
    DESCRIPTION,
    CONCURRENT_PROGRAM_ID,
    PROGRAM_APPLICATION_ID,
    CONCURRENT_QUEUE_ID,
    QUEUE_APPLICATION_ID*/
  FROM fnd_concurrent_worker_requests
 WHERE (phase_code = 'P' OR phase_code = 'R')
   AND hold_flag != 'Y'
   AND requested_start_date <= SYSDATE
   AND ('' IS NULL OR
       ('' = 'B' AND phase_code = 'R' AND status_code IN ('I', 'Q')))
   AND '4' IN (0, 1, 4)
   AND (concurrent_queue_id = 4)
   AND (queue_application_id = 0)
 ORDER BY priority, priority_request_id, request_id