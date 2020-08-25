/* Buscar os arquivos out dos relat�rios */
SELECT request_id,
       last_update_date,
       request_date,
       requested_by,
       phase_code,
       status_code,
       requested_start_date,
       number_of_arguments,
       printer,
       print_style,
       resubmit_time,
       resubmit_end_date,
       resubmitted,
       controlling_manager,
       actual_start_date,
       actual_completion_date,
       completion_text,
       logfile_name,
       logfile_node_name,
       outfile_name,
       outfile_node_name,
       argument_text,
       crm_thrshld,
       crm_tstmp,
       critical,
       request_type,
       oracle_process_id,
       oracle_session_id,
       os_process_id,
       print_job_id,
       output_file_type,
       release_class_app_id,
       release_class_id,
       stale_date,
       cancel_or_hold,
       notify_on_pp_error,
       cd_id,
       request_limit,
       crm_release_date,
       post_request_status,
       completion_code,
       increment_dates,
       restart,
       enable_trace
  FROM apps.fnd_concurrent_requests
-- podemos buscar o arquivo pela request id ou pelo pr�prio out
--WHERE REQUEST_ID = 'xxxxx'
--WHERE outfile_name like '%&p1%'
 WHERE --outfile_name like '%5706125%'
 request_id = '77239753'