SELECT segment_type,SUBSTR(TO_CHAR(SUM(BYTES) / 1024 / 1024, '999,999,999.99'), 1, 15) "Total MB",
       SUBSTR(TO_CHAR(SUM(BYTES) / 1024 / 1024 / 1024, '999,999.99'), 1, 11) "Total GB"
  from dba_segments
 where OWNER = 'MASTERSAF'
 group by segment_type