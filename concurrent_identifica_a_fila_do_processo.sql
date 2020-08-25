/* Informa o nome da fila pelo nome do concurrent */
SELECT distinct q.concurrent_queue_name "Fila do Concurrent",
                p.user_concurrent_program_name "Concurrent",
                p.language
  FROM apps.fnd_concurrent_requests    r,
       apps.fnd_concurrent_programs_tl p,
       apps.fnd_concurrent_processes   pr,
       apps.fnd_concurrent_queues      q
 WHERE q.concurrent_queue_id = pr.concurrent_queue_id
   AND r.controlling_manager = pr.concurrent_process_id
   AND r.concurrent_program_id = p.concurrent_program_id
      --AND q.concurrent_queue_name = 'STANDARD' --Fila de processos
      --AND p.user_concurrent_program_name like 'Programa de Importação de NFFs Automáticas' --Nome do processo concorrente
   AND p.user_concurrent_program_name like
       '%Cost Manager%' --Nome do processo concorrente
  -- AND p.language = 'PTB'