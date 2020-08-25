SELECT CWR.REQUEST_ID,
       CRS.program,
       CWR.PHASE_CODE,
       CWR.STATUS_CODE,
       CWR.ARGUMENT_TEXT,
       CWR.REQUESTED_BY,
       CWR.DESCRIPTION
  FROM FND_CONCURRENT_WORKER_REQUESTS CWR,
       fnd_concurrent_queues_vl       CQV,
       fnd_conc_req_summary_v         CRS
 WHERE (cwr.Phase_Code = 'P' or cwr.Phase_Code = 'R')
   and cwr.hold_flag != 'Y'
   AND CWR.CONCURRENT_QUEUE_ID = CQV.CONCURRENT_QUEUE_ID
   and cwr.Requested_Start_Date <= SYSDATE
   AND ('' IS NULL OR ('' = 'B' AND cwr.PHASE_CODE = 'R' AND
     cwr.STATUS_CODE IN ('I', 'Q')))
   --and '1' in (0, 1, 4t)
   and CQV.user_concurrent_queue_name = 'Standard Manager'
   and (QUEUE_APPLICATION_ID = 0)
   and cwr.request_id = CRS.request_id
 order by cwr.Priority, cwr.Priority_Request_ID, Request_ID