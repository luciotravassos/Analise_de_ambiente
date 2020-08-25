/* Informa tudo sobre um processo pelo número do concurrent_process_id */
SELECT *
  FROM apps.fnd_concurrent_processes
 WHERE concurrent_process_id = 1321681
/*abaixo com o PID do SO identificamos o concurrent_process_id */
select * from apps.fnd_concurrent_processes
    where os_process_id = 1321681
