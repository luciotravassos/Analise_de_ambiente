/* Script informa o status do concurrent pela Request ID */
SELECT   --c.printer_name, c.description,
SUBSTR (a.request_id, 1, 20) request_id,
         SUBSTR (b.user_name, 1, 30) requestor,
         SUBSTR (a.completion_text, 1, 30) completion_text,
         a.phase_code "Phase Code", a.status_code,
         a.CONCURRENT_PROGRAM_ID,a.ARGUMENT_TEXT,
         SUBSTR (a.program, 1, 40) program, a.priority, a.request_date,
         a.actual_completion_date,
         TRUNC ((a.actual_completion_date - a.actual_start_date) * 60 * 24
               ) tempo
    FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b--,fnd_printer_vl c
   WHERE a.requested_by = b.user_id
 /*  A linha abaixo vc determina quantos dias pode se ver as atividades*/
     AND a.actual_completion_date > ((SELECT SYSDATE FROM DUAL)-290)
 /* Nesse ponto, podemos pegar o processo pelo nome do programa*/
   and a.program like '%Invoice Approval Workflow%'
AND a.actual_completion_date > ((SELECT SYSDATE FROM DUAL)-1)
ORDER BY a.request_id DESC


