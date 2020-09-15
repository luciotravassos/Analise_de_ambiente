Prompt ==========================================
Prompt =Displays information about all DBA jobs.=
Prompt ==========================================
SET LINESIZE 1000 PAGESIZE 1000
COLUMN log_user FORMAT A15
COLUMN priv_user FORMAT A15
COLUMN schema_user FORMAT A15
COLUMN interval FORMAT A40
COLUMN what FORMAT A50
COLUMN nls_env FORMAT A50
COLUMN misc_env FORMAT A50
SELECT a.job, a.log_user, a.priv_user, a.schema_user,   
       To_Char(a.last_date,'DD-MON-YYYY HH24:MI:SS') AS last_date,     
       --To_Char(a.this_date,'DD-MON-YYYY HH24:MI:SS') AS this_date,     
       To_Char(a.next_date,'DD-MON-YYYY HH24:MI:SS') AS next_date,     
       a.broken, a.interval, a.failures, a.what,
       a.total_time, a.nls_env, a.misc_env         
FROM   dba_jobs a;
SET LINESIZE 80 PAGESIZE 14

Prompt ========================================================
Prompt =Displays information about all jobs currently running.=
Prompt ========================================================
SET LINESIZE 500
SET PAGESIZE 1000
SET VERIFY OFF
SELECT a.job "Job", a.sid,a.failures "Failures",      
       Substr(To_Char(a.last_date,'DD-Mon-YYYY HH24:MI:SS'),1,20) "Last Date",     
       Substr(To_Char(a.this_date,'DD-Mon-YYYY HH24:MI:SS'),1,20) "This Date"            
FROM   dba_jobs_running a;
SET PAGESIZE 14
SET VERIFY ON

Prompt =====================================
Prompt =Displays scheduler job information.=
Prompt =====================================
SET LINESIZE 200
COLUMN owner FORMAT A20
COLUMN next_run_date FORMAT A35
SELECT owner,job_name, enabled,
        job_class, next_run_date
FROM   dba_scheduler_jobs
ORDER BY owner, job_name;

Prompt ==================================================
Prompt =Displays scheduler information for running jobs.=
Prompt ==================================================
SET LINESIZE 200
COLUMN owner FORMAT A20
SELECT owner, job_name,
       running_instance, elapsed_time
FROM   dba_scheduler_running_jobs
ORDER BY owner, job_name;

Prompt =====================================================
Prompt =Displays scheduler information about job schedules.=
Prompt =====================================================
SET LINESIZE 250
COLUMN owner FORMAT A20
COLUMN schedule_name FORMAT A30
COLUMN start_date FORMAT A35
COLUMN repeat_interval FORMAT A50
COLUMN end_date FORMAT A35
COLUMN comments FORMAT A40
SELECT owner, schedule_name,
       start_date, repeat_interval,
       end_date, comments
FROM   dba_scheduler_schedules
ORDER BY owner, schedule_name;

Prompt =====================================================
Prompt =Displays scheduler information about refresh Mviews.=
Prompt =====================================================


select m.*, r.job
  from dba_refresh r
       inner join dba_refresh_children rc
               on rc.rowner = r.rowner
              and rc.rname = r.rname
       inner join dba_mviews m
               on m.owner = rc.owner
              and m.mview_name = rc.name;
