clear columns
clear breaks

set pages 1000
set lines 130
set verify off

define in_mbytes=&&1

column c0 format A12 heading "Owner"
column c1 format A25 heading "Table"
column c2 format A25 heading "Master"
column c3 format 99,990.00 heading "MB"
column c4 format A25 heading "Log"
column c5 format 99,990.00 heading "MB"
column c6 format 990.00 heading "Ratio"


select  s.owner c0,
        s.segment_name c1, 
        l.master c2, 
        s2.bytes/power(2,20) c3,
        l.log_table c4,
        s.bytes/power(2,20) c5,
        round(100*s.bytes/s2.bytes) c6
from dba_segments s,
     dba_snapshot_logs l,
     dba_segments s2
where l.log_owner = s.owner and
      l.log_table = s.segment_name and
      s.bytes >= &&in_mbytes*power(2,20) and
      s2.owner = l.log_owner and
      s2.segment_name = l.master;

set verify on
