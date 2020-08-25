SELECT SUBSTR(i.owner,1,10) iown,
       SUBSTR(i.index_name,1,30) "Index Name",
       SUBSTR(i.tablespace_name,1,20) ts,
       --(i.initial_extent / 1024) iext,
       --(i.next_extent / 1024) next,
       --i.pct_increase pcti,
       i.uniqueness unq,
       --i.blevel bl,
       --i.leaf_blocks lfb,
       i.status,
       --i.num_rows,
       h.column_name,
       h.column_position
  FROM dba_indexes  i,
       DBA_IND_COLUMNS h
 WHERE i.owner = UPPER('&tabown')
   AND i.table_name = UPPER('&tabnam')
   AND i.partitioned = 'NO'
   and i.index_name = h.index_name
   and i.table_name = h.table_name
ORDER BY iown,
      i.index_name;

