/* Script informa o status do concurrent Nome do Programa */
SELECT          --/*+ RULE */
       DISTINCT SUBSTR (a.request_id, 1, 20) request_id,
                SUBSTR (b.user_name, 1, 30) requestor,
                SUBSTR (a.completion_text, 1, 30) completion_text,
                a.phase_code "Phase Code", a.status_code,
                SUBSTR (a.program, 1, 40) program, a.priority, a.request_date,
                a.actual_completion_date,a.argument_text,
                TRUNC (  (a.actual_completion_date - a.actual_start_date)
                       * 60
                       * 24
                      ) tempo
           FROM apps.fnd_conc_req_summary_v a,
                apps.fnd_user b,
                apps.fnd_concurrent_programs fcp
          WHERE a.requested_by = b.user_id
          --and a.REQUEST_DATE < ((select sysdate from dual)-1)
/* Nesse ponto, podemos pegar o processo pelo nome do programa*/
            AND a.program = 'Relatório Mensalizado de Orçamento de Investimentos'
       ORDER BY a.request_date DESC


