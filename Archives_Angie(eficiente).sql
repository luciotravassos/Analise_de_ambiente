/*set heading on
set linesize 220
col "00" format a3
col "01" format a3
col "02" format a3
col "03" format a3
col "04" format a3
col "05" format a3
col "06" format a3
col "07" format a3
col "08" format a3
col "09" format a3
col "10" format a3
col "11" format a3
col "12" format a3
col "13" format a3
col "14" format a3
col "15" format a3
col "16" format a3
col "17" format a3
col "18" format a3
col "19" format a3
col "20" format a3
col "21" format a3
col "22" format a3
col "23" format a3
col "Total" format a5
col dia form a8*/
select   to_char(FIRST_TIME,'yyyymmdd') DIA,
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'00',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'00',1,0))) "00",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'01',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'01',1,0))) "01",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'02',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'02',1,0))) "02",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'03',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'03',1,0))) "03",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'04',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'04',1,0))) "04",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'05',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'05',1,0))) "05",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'06',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'06',1,0))) "06",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'07',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'07',1,0))) "07",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'08',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'08',1,0))) "08",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'09',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'09',1,0))) "09",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'10',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'10',1,0))) "10",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'11',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'11',1,0))) "11",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'12',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'12',1,0))) "12",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'13',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'13',1,0))) "13",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'14',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'14',1,0))) "14",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'15',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'15',1,0))) "15",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'16',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'16',1,0))) "16",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'17',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'17',1,0))) "17",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'18',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'18',1,0))) "18",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'19',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'19',1,0))) "19",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'20',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'20',1,0))) "20",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'21',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'21',1,0))) "21",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'22',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'22',1,0))) "22",
         decode(sum(decode(to_char(FIRST_TIME,'hh24'),'23',1,0)),0,'-',sum(decode(to_char(FIRST_TIME,'hh24'),'23',1,0))) "23",
         decode(count(*),0,'-',count(*)) "Total"
from     sys.v_$log_history
where first_time between '01-mar-12' and '28-mar-12'
group by to_char(FIRST_TIME,'yyyymmdd');

