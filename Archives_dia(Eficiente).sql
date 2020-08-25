SELECT TO_CHAR(completion_time, 'YYYY-MM-DD'), COUNT(*), round ((count(*)/24),2) "Media hora"
  FROM v$archived_log
 GROUP BY TO_CHAR(completion_time, 'YYYY-MM-DD')
 order by 1 asc