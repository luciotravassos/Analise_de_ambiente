 -- Achando o Valor do SQL_ID
 
-- set lines 300
--set pages 1000
--set long 9999
--col sql_text format a90 wrapped
select snap_id, sql_id, sql_text 
from sys.wrh$_sqltext where sql_text like 'insert into XTAM.E$_T$_TYPE_AR%'
order by 1

 
 
 SELECT b.sql_id,A.BEGIN_INTERVAL_TIME,
        B.PLAN_HASH_VALUE,
        ROUND(B.ELAPSED_TIME_DELTA/1000000,2) AS ELAPSED_TIME_SECS,
        B.EXECUTIONS_DELTA,
        B.BUFFER_GETS_DELTA
 FROM SYS.WRM$_SNAPSHOT A,
      SYS.WRH$_SQLSTAT B
 WHERE A.DBID        = B.DBID
   AND A.INSTANCE_NUMBER = B.INSTANCE_NUMBER
   AND A.SNAP_ID     = B.SNAP_ID
 AND B.SQL_ID  = '9u5u7jus0vj12'
  AND A.BEGIN_INTERVAL_TIME > TO_DATE(SYSDATE)-14
   --AND B.SQL_ID      in ('7x3vj7xx34hwb','65mrn19j3c62t','9u5u7jus0vj12')
 ORDER BY 2