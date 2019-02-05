clear columns
clear breaks

set pages 1000
set lines 120

define in_owner=&&1


column c0 format A30 word_wrapped heading "Master Table"
column c1 format A30 word_wrapped heading "Log Table"
column c2 format 999,999,990 heading "MBytes"

select master c0, 
       log_table c1,
       sum(bytes)/power(2,20) c2
from dba_mview_logs mv, dba_segments ds
where mv.log_owner = upper('&&in_owner') and
      mv.log_owner = ds.owner and
      mv.log_table = ds.segment_name and
      ds.segment_type = 'TABLE'
group by master, log_table
order by 3
/
