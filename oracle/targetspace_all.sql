-- Author:		Ahbaid Gaffoor
-- File:		freespace_all.sql
-- Date:		Wed Aug 11 21:26:05 2004
-- Use:		

set pages 10000
set lines 130

break on report
compute sum of c1 on report;
compute sum of c2 on report;
compute sum of c3 on report;
compute sum of c6 on report;

spool freespace_all

define target_percentage=&&1

column c0 format A25 heading "TSPC"
column c1 format 9,999,990 heading "TOTAL/MB"
column c2 format 9,999,990 heading "USED/MB"
column c3 format 9,999,990 heading "FREE/MB"
column c4 format 990.00 heading "%/USED"
column c5 format 990.00 heading "%/FREE"
column c6 format 9,999,990 heading "&&target_percentage %"

select  tspc.tspc c0,
        tspc.total_size/1024/1024 c1, 
        seg.used_space/1024/1024 c2, 
        (tspc.total_size - seg.used_space)/1024/1024 as c3,
        (seg.used_space/tspc.total_size) * 100 as c4,
        (tspc.total_size - seg.used_space)/tspc.total_size * 100 as c5,
        (100*seg.used_space/1024/1024)/&&target_percentage - (tspc.total_size/1024/1024) as c6
from (select sum(bytes) as total_size, tablespace_name as tspc
      from dba_data_files
      group by tablespace_name 
     ) tspc,
     (select sum(bytes) as used_space, tablespace_name as tspc
      from dba_segments
      group by tablespace_name 
     ) seg
where tspc.tspc = seg.tspc(+)
order by c5
;

spool off;
