----------------------------------------------------------------------------------------------------------------------------------
-- LISTAGEM DOS CONCURRENTS - (PENDENTES e EXECUTANDO) ( DEFINICAO DO CONJUNTO DOS CONCURRENTS - REQUEST SET'S )
----------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT a.request_id, a.phase_code, a.status_code, a.priority,
                a.request_date, a.requested_start_date,
                a.responsibility_application_id, a.responsibility_id,
                e.responsibility_name, a.argument_text, a.program_short_name,
                a.program, a.requestor, a.description, d.argument1 param1,
                d.argument2 param2, d.argument3 param3
           FROM apps.fnd_conc_req_summary_v a,
                apps.fnd_concurrent_requests b,
                apps.fnd_run_requests d,
                apps.fnd_responsibility_tl e
          WHERE a.request_id = b.request_id
            AND (    a.responsibility_id = e.responsibility_id
                 AND a.responsibility_application_id = e.application_id
                )
           -- AND (a.requestor = '25555304'
              --  )
            --AND a.phase_code = 'C' --IN ('P','R')
            AND (    d.parent_request_id = a.request_id
                 AND TO_CHAR (d.set_application_id) = b.argument1
                 AND TO_CHAR (d.request_set_id) = b.argument2
                )
            AND (UPPER (d.argument1) <> 'INVENTORY MISC')
UNION
----------------------------------------------------------------------------------------------------------------------------------
-- LISTAGEM DOS CONCURRENTS - (PENDENTES e EXECUTANDO) ( DEFINICAO SIMPLES )
----------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT a.request_id, a.phase_code, a.status_code, a.priority,
                a.request_date, a.requested_start_date,
                a.responsibility_application_id, a.responsibility_id,
                e.responsibility_name, a.argument_text, a.program_short_name,
                a.program, a.requestor, a.description, '' param1, '' param2,
                '' param3
           FROM apps.fnd_conc_req_summary_v a,
                apps.fnd_concurrent_requests b,
                apps.fnd_responsibility_tl e
          WHERE a.request_id = b.request_id
            AND (    a.responsibility_id = e.responsibility_id
                 AND a.responsibility_application_id = e.application_id
                )
            AND (a.requestor = '25555304'
                )
            AND a.phase_code = 'C' --IN ('P','R')
            AND (a.request_id NOT IN (
                                      SELECT DISTINCT f.request_id
                                                 FROM apps.fnd_run_requests f
                                                WHERE f.parent_request_id =
                                                                  a.request_id)
                )

