/* verifica quais processos estão nas filas definidas */
SELECT request_set_id,
       request_set_stage_id,
       concurrent_program_id,
       display_sequence,
       user_stage_name,
       description,
       stage_name,
       outcome,
       user_executable_name,
       application_name,
       critical,
       allow_constraints_flag,
       last_update_date,
       last_updated_by,
       creation_date,
       created_by,
       last_update_login,
       success_link,
       warning_link,
       error_link,
       icon_name,
       function_id,
       function_application_id,
       x,
       y
  FROM apps.fnd_req_set_stages_form_v
 WHERE (request_set_id = 612)
--ORDER BY application_id, request_set_name)
--(set_application_id = 0) AND 
--ORDER BY display_sequence, user_stage_name