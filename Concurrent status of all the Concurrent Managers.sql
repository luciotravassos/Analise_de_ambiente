select distinct Concurrent_Process_Id CpId, PID Opid,
       Os_Process_ID Osid, Q.Concurrent_Queue_Name Manager,
       P.process_status_code Status,
       To_Char(P.Process_Start_Date, 'DD-MM-YYYY HH:MI:SSAM') Started_At
from   apps.Fnd_Concurrent_Processes P, apps.Fnd_Concurrent_Queues Q, apps.FND_V$Process
where  Q.Application_Id = Queue_Application_ID
  and  Q.Concurrent_Queue_ID = P.Concurrent_Queue_ID
  and  Spid = Os_Process_ID
  and  Process_Status_Code not in ('K','S')
order  by Concurrent_Process_ID, Os_Process_Id, Q.Concurrent_Queue_Name
/

