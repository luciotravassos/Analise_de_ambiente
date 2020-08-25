/* Formatted on 2005/05/05 13:53 (Formatter Plus v4.7.0) */
SELECT    'alter table '
       || owner
       || '.'
       || table_name
       || ' storage (next '
       || TRUNC (next_extent / 10 / 1024) * 1024
       || '); '
  FROM dba_tables a
 WHERE 2 * a.next_extent >= (SELECT MAX (BYTES)
                               FROM dba_free_space b
                              WHERE a.tablespace_name = b.tablespace_name)

