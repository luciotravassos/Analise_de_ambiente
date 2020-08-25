SELECT fcr.request_id,
       fu.user_name requestor,
       fcr.phase_code "Phase Code",
       fcr.status_code,
       fcp.user_concurrent_program_name "Program",
       fcr.ARGUMENT_TEXT,
       fcr.request_date,
       to_char(fcr.REQUESTED_START_DATE, 'DD/MM/YY HH24:MI'),
       RESUBMIT_INTERVAL,
       RESUBMIT_INTERVAL_UNIT_CODE,
       RESUBMIT_INTERVAL_TYPE_CODE,
       RESUBMIT_TIME
  FROM apps.fnd_concurrent_requests    fcr,
       apps.fnd_concurrent_programs_tl fcp,
       apps.fnd_user                   fu
 WHERE fcr.phase_code in ('R')
   AND fcr.program_application_id = fcp.application_id
   AND fcr.concurrent_program_id = fcp.concurrent_program_id
   AND fcp.LANGUAGE = 'PTB'
   and fu.user_id = fcr.REQUESTED_BY
 ORDER BY 1