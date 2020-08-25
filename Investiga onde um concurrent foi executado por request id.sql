--Investigando onde um processo concorrente foi executado
-- Entre com um request id

select controlling_manager
  from fnd_concurrent_requests
 where request_id = 2834666
 
 
-- Informe abaixo o resultado da query acima
 select queue_application_id, concurrent_queue_id
   from fnd_concurrent_processes
  where concurrent_process_id = 106029
  
  
  
--  Informe abaixo o resultado da query acima
  select concurrent_queue_name
    from fnd_concurrent_queues
   where application_id = 0
     and concurrent_queue_id = 1271