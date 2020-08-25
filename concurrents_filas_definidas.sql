/* Verifica as filas de concurrents definidas no aplications */
SELECT user_request_set_name,
       request_set_name,
       description,
       start_date_active,
       end_date_active,
       print_together_flag,
       allow_constraints_flag,
       request_set_id,
       application_id,
       concurrent_program_id,
       owner,
       created_by,
       creation_date,
       last_update_date,
       last_updated_by,
       last_update_login,
       icon_name,
       printer,
       start_stage
  FROM apps.fnd_request_sets_vl
 WHERE ('SYS' = 'SYS') --OR owner = 16750)
 ORDER BY user_request_set_name