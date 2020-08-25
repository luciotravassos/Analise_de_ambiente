select b.user_concurrent_program_name programa,
       count(*) frequencia,
       round(sum(a.actual_completion_date - a.actual_start_date) * 3600 * 24 / 60) tempo_execucao,
       round(round(sum(a.actual_completion_date - a.actual_start_date) * 3600 * 24 / 60) /
             count(*),
             2) "Média Minutos"
  from applsys.fnd_concurrent_requests    a,
       applsys.fnd_concurrent_programs_tl b
 where a.program_application_id = b.application_id
   and a.concurrent_program_id = b.concurrent_program_id
   and b.language = 'PTB'
   and trunc(a.actual_start_date) >= '18-JUL-2012'
   and a.actual_completion_date is not null
 group by b.user_concurrent_program_name
 order by 3 desc