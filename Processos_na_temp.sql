select rpad(a.username, 8) USUARIO,
       lpad(to_char(a.sid), 3) SID,
       lpad(to_char(a.serial#), 5) SERL#,
       rpad(u.tablespace, 10) TABLSPC,
       lpad(u.extents, 5) EXTS,
       lpad(u.blocks, 10) BLOCKS,
       rpad(a.module, 10) MODULO,
       rpad(a.action, 20) ACAO
  from v$session a, v$sort_usage u
 where a.saddr = u.session_addr 