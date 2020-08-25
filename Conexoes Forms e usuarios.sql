select f.time,      form, conc
from
(      select trunc(start_time) time, count(*) form from
      fnd_logins
      where start_time between to_date('&inicial', 'YYYY-MM-DD')
       and to_date('&final', 'YYYY-MM-DD')+1
       and login_type='FORM'  group by trunc(start_time)
)   f,
(      select trunc(start_time) time, count(*) conc from
      fnd_logins
      where start_time between to_date('&inicial', 'YYYY-MM-DD')
       and to_date('&final', 'YYYY-MM-DD')+1
       and login_type is null
      group by trunc(start_time)
)   c
where
trunc(c.time)=trunc(f.time);
