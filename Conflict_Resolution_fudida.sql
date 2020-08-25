SELECT    'update fnd_concurrent_requests set status_code=''X'', phase_code=''C'' where request_id='||fcr.request_id||';'
  FROM 
          apps.fnd_concurrent_requests fcr,
          apps.fnd_concurrent_programs_tl fcp
  WHERE fcr.phase_code = 'P' 
      AND fcr.program_application_id = fcp.application_id 
      AND fcr.concurrent_program_id = fcp.concurrent_program_id 
      AND fcp.LANGUAGE = 'US' 
      and fcp.user_concurrent_program_name='OS - Controle de Entrega de Materiais (VISA)'
      and rownum<1000
 ORDER BY 1