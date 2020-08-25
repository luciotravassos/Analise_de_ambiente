/* Script informa o status do concurrent */
SELECT   SUBSTR (a.request_id, 1, 20) request_id,
         SUBSTR (b.user_name, 1, 30) requestor,
         SUBSTR (a.completion_text, 1, 30) completion_text,
         a.phase_code "Phase Code", a.status_code,
         SUBSTR (a.program, 1, 40) program, a.priority, a.request_date,
         a.actual_completion_date,a.USER_CONCURRENT_PROGRAM_NAME, a.ARGUMENT_TEXT,
         TRUNC ((a.actual_completion_date - a.actual_start_date) * 60 * 24
               ) tempo    FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b
   WHERE a.requested_by = b.user_id
     AND a.status_code = 'C'
     and a.phase_code = 'C'
     and to_char(a.actual_completion_date, 'YYYY/MM/DD HH24:MI:SS') >=  '2010/10/08 14:00:00' 
    and to_char(a.actual_completion_date, 'YYYY/MM/DD HH24:MI:SS') <= '2010/10/09 15:40:00'
 ORDER BY a.request_id DESC


