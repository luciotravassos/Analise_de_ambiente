/* Verifica o status das requests pela Impressora */
SELECT c.printer_name,
       c.description,
       SUBSTR(a.request_id, 1, 20) request_id,
       SUBSTR(b.user_name, 1, 30) requestor,
       SUBSTR(a.completion_text, 1, 30) completion_text,
       a.phase_code "Phase Code",
       a.status_code,
       SUBSTR(a.program, 1, 40) program,
       a.priority,
       a.request_date,
       a.actual_completion_date,
       TRUNC((a.actual_completion_date - a.actual_start_date) * 60 * 24 / 60) tempo,
       c.printer_name
  FROM fnd_printer_vl c, apps.fnd_conc_req_summary_v a, apps.fnd_user b
 WHERE a.requested_by = b.user_id
   AND c.printer_name like '%a071-pt-balcao-1%'
   AND a.status_code = 'C'
   AND a.actual_completion_date > ((SELECT SYSDATE FROM DUAL) - 1)
   AND A.PROGRAM_SHORT_NAME = upper('VISA_INV_PICK_TICKETS')
 ORDER BY request_date DESC