/* Formatted on 2005/02/03 01:37 (Formatter Plus v4.7.0) */
SELECT DISTINCT q.concurrent_queue_name, p.user_concurrent_program_name,
                q.user_concurrent_queue_name, --q.source_lang, 
                                             r.request_id,
                r.actual_start_date, r.actual_completion_date
           FROM apps.fnd_concurrent_requests r,
                apps.fnd_concurrent_programs_tl p,
                apps.fnd_concurrent_processes pr,
                apps.fnd_concurrent_queues_tl q
          WHERE q.concurrent_queue_id = pr.concurrent_queue_id
            AND r.controlling_manager = pr.concurrent_process_id
            AND r.concurrent_program_id = p.concurrent_program_id
            AND q.concurrent_queue_name = 'PO_RI_MANAGER'
            and r.actual_completion_date is null
            --AND p.user_concurrent_program_name = 'Analyzer - Extrair Saldos'
            
            /*IN
                   ('Confirmar Lote de Pagamento',
                    'Borderô de Pagamento Mercado Interno - Oracle Payables  (CVRD)',
                    'Registro de Pagamento Final',
                    'Desenvolver Pagamentos',
                    'Seleção Automática',
                    'Formata Lotes de Pagamento'
                   )
            --AND p.user_concurrent_program_name = 'Borderô de Pagamento Mercado Interno - Oracle Payables  (CVRD)' */
             AND p.language = 'PTB' 
            AND TRUNC (actual_start_date) BETWEEN TRUNC (TO_DATE ('2011-01-04',
                                                                  'YYYY-MM-DD'
                                                                 )
                                                        )
                                              AND TRUNC (TO_DATE ('2011-01-04',
                                                                  'YYYY-MM-DD'
                                                                 )
                                                        )
--order by r.actual_completion_date*/

