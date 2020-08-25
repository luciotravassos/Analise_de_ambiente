/* Formatted on 2005/10/10 16:02 (Formatter Plus v4.7.0) */
SELECT   hold.SID hold_sid, hold.inst_id, hold.sql_hash_value,
         COUNT (hold.SID)
    FROM gv$session_wait sw, gv$session wait, gv$lock l, gv$session hold
   WHERE sw.event = 'enqueue'
     AND wait.SID = sw.SID
     AND wait.inst_id = sw.inst_id
     AND l.id1 = sw.p2
     AND l.id2 = sw.p3
     AND l.BLOCK <> 0
     AND hold.SID = l.SID
     AND hold.inst_id = l.inst_id
--and wait.sid=2883
GROUP BY hold.SID, hold.inst_id, hold.sql_hash_value;

