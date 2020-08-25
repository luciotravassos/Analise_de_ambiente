/*prompt ve_seg v2.04 - Lista segmentos
prompt
set verify off*/
select rpad(tablespace_name,15)                 "TABLESPACE",
       rpad(owner,8)                            "DONO",
       rpad(segment_name,28)                    "SEGMENTO",
       rpad(partition_name,4)                    "PARTITION",
       rpad(decode(segment_type,'TABLE PARTITION','TP',
            'INDEX PARTITION','IP','LOBSEGMENT','LS','LOBINDEX','LI',
            segment_type),2)                    "TI",
       lpad(to_char(extents),3)                 "EXT",
       lpad(to_char(max_extents),4)             "MXEX",
       lpad(to_char(trunc(bytes/1024/1024)),12)       "  MB",
       lpad(to_char(trunc(next_extent/1024)),7) "NEXT(K)"
from dba_segments
where --tablespace_name = upper(nvl('&tablespace',tablespace_name)) and
      segment_type like upper(nvl('&tipo_de_segmento',segment_type)) and
      segment_name like upper(nvl('&nome_do_segmento',segment_name)) -- and
      --extents         > nvl(to_number('&extensoes'),0) and
      --owner           = upper(nvl('&proprietario',owner))
order by bytes desc,segment_type,segment_name
--set verify on
