/* Buscar os arquivos out dos relatórios */
SELECT request_id, last_update_date, last_updated_by, request_date,
       requested_by, phase_code, status_code, priority_request_id, priority,
       requested_start_date, hold_flag, enforce_seriality_flag,
       single_thread_flag, has_sub_request, is_sub_request, implicit_code,
       update_protected, queue_method_code, argument_input_method_code,
       oracle_id, program_application_id, concurrent_program_id,
       responsibility_application_id, responsibility_id, number_of_arguments,
       number_of_copies, save_output_flag, nls_compliant, last_update_login,
       nls_language, nls_territory, printer, print_style, print_group,
       request_class_application_id, concurrent_request_class_id,
       parent_request_id, conc_login_id, language_id, description,
       req_information, resubmit_interval, resubmit_interval_unit_code,
       resubmit_interval_type_code, resubmit_time, resubmit_end_date,
       resubmitted, controlling_manager, actual_start_date,
       actual_completion_date, completion_text, outcome_product, outcome_code,
       cpu_seconds, logical_ios, physical_ios, logfile_name,
       logfile_node_name, outfile_name, outfile_node_name, argument_text,
       argument1, argument2, argument3, argument4, argument5, argument6,
       argument7, argument8, argument9, argument10, argument11, argument12,
       argument13, argument14, argument15, argument16, argument17, argument18,
       argument19, argument20, argument21, argument22, argument23, argument24,
       argument25, crm_thrshld, crm_tstmp, critical, request_type,
       oracle_process_id, oracle_session_id, os_process_id, print_job_id,
       output_file_type, release_class_app_id, release_class_id, stale_date,
       cancel_or_hold, notify_on_pp_error, cd_id, request_limit,
       crm_release_date, post_request_status, completion_code,
       increment_dates, restart, enable_trace, resub_count, nls_codeset,
       ofile_size, lfile_size, stale, security_group_id,
       resource_consumer_group, exp_date, queue_app_id, queue_id,
       ops_instance, interim_status_code, root_request_id, origin,
       nls_numeric_characters
  FROM apps.fnd_concurrent_requests
  -- podemos buscar o arquivo pela request id ou pelo próprio out
  --WHERE REQUEST_ID = 'xxxxx'
  --WHERE outfile_name like '%&p1%'
  WHERE --outfile_name like '%7969006%'
   request_id = '77748240'
