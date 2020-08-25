select sum(round(a.BYTES / 1024 / 1024 / 1024) )"GB Allocated",
       sum(round((a.BYTES-nvl(b.BYTES, 0)) / 1024 / 1024 / 1024) )"GB Used"
from   (select   TABLESPACE_NAME,
                 sum(BYTES) BYTES
        from     sys.dba_data_files
        group by TABLESPACE_NAME) a,
       (select   TABLESPACE_NAME,
                 sum(BYTES) BYTES
        from     sys.dba_free_space
        group by TABLESPACE_NAME) b
where  a.TABLESPACE_NAME = b.TABLESPACE_NAME (+)
