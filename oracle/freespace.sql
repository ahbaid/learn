-- Author:		Ahbaid Gaffoor
-- File:		freespace.sql
-- Date:		Wed Aug 11 21:26:05 2004
-- Use:		

spool freespace

define tspc = &&1
define target_percentage = 85

column c1 format 9,999,990 heading "TOTAL/MB"
column c2 format 9,999,990 heading "USED/MB"
column c3 format 9,999,990 heading "FREE/MB"
column c4 format 990.00 heading "%/USED"
column c5 format 990.00 heading "%/FREE"
column c6 format 9,999,990 heading "&&target_percentage %"

select  tspc.total_size/1024/1024 c1, 
        seg.used_space/1024/1024 c2, 
        (tspc.total_size - seg.used_space)/1024/1024 as c3,
        (seg.used_space/tspc.total_size) * 100 as c4,
        (tspc.total_size - seg.used_space)/tspc.total_size * 100 as c5,
        (100*seg.used_space/1024/1024)/&&target_percentage - (tspc.total_size/1024/1024) as c6
from (select sum(bytes) as total_size from dba_data_files
      where tablespace_name = upper('&&tspc') ) tspc,
     (select sum(bytes) as used_space from dba_segments
      where tablespace_name = upper('&&tspc') ) seg
;

spool off;
