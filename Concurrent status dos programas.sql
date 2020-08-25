/* Formatted on 2005/09/19 11:48 (Formatter Plus v4.7.0) */
SELECT   fcr.request_id "Request", fcp.user_concurrent_program_name "Program",
         TO_CHAR (fcr.actual_start_date, 'DD-MON-YYYY HH24:MI:SS') "Started"
    FROM apps.fnd_concurrent_requests fcr,
         apps.fnd_concurrent_programs_tl fcp
   WHERE fcr.phase_code = 'P'
     AND fcr.program_application_id = fcp.application_id
     AND fcr.concurrent_program_id = fcp.concurrent_program_id
     AND fcp.user_concurrent_program_name like 'Cost Manager%'
     AND fcp.LANGUAGE = 'US'
ORDER BY 1;

