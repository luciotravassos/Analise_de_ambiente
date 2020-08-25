/* Script informa o status do concurrent pela Request ID */
SELECT SUBSTR(a.request_id, 1, 20) request_id,
       SUBSTR(b.user_name, 1, 30) requestor,
       SUBSTR(a.completion_text, 1, 30) completion_text,
       a.phase_code "Phase Code",
       a.status_code,
       SUBSTR(a.program, 1, 40) program,
       a.priority,
       a.request_date,
       a.actual_start_date,
       a.actual_completion_date, --c.printer_name, c.description,
       TRUNC((a.actual_completion_date - a.actual_start_date) * 60 * 24) tempo,
       argument_text
  FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b --, fnd_printer_vl c
 WHERE a.requested_by = b.user_id
  -- AND a.request_id in ('3086184','3086186')
  AND a.request_id = 79277764
--AND a.actual_completion_date > ((SELECT SYSDATE FROM DUAL)-5)
 ORDER BY a.request_id DESC