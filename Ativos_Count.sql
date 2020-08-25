select count(*)
  from v$session b, v$process a
 Where 
  (b.status IN ('ACTIVE', 'KILLED','INACTIVE') or b.lockwait is not null)
 --(b.status IN ('INACTIVE', 'KILLED') or b.lockwait is not null)
   AND 
   b.paddr = a.addr
   and type = 'USER'
   and b.username is not null
 order by b.status, b.MACHINE, b.username