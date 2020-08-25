/* Script informa o status do concurrent PENDENTE*/
SELECT DISTINCT (concurrent_program_id), program, program_application_id,
                printer, program_short_name, argument_text, print_style,
                user_print_style, save_output_flag, actual_completion_date,
                completion_text, parent_request_id, request_type, fcp_printer,
                fcp_print_style, fcp_required_style, last_update_date,
                last_updated_by, requested_by, has_sub_request,
                is_sub_request, update_protected, queue_method_code,
                responsibility_application_id, responsibility_id,
                controlling_manager, last_update_login, priority_request_id,
                enabled, requested_start_date, phase_code, hold_flag,
                status_code, request_id, requestor, priority
           FROM apps.fnd_conc_req_summary_v
          WHERE phase_code = 'P' --AND status_code = 'Q'
       ORDER BY request_id DESC

