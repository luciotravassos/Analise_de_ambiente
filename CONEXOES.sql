/*select inst_id, machine, program, count(*)
  from gv$session
 where username is not null
 group by inst_id, machine, program*/
 
 select inst_id, machine, count(*)
  from gv$session
 where username is not null
 group by inst_id, machine
 order by 1, 2