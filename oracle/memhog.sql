set verify off

define in_top_n_sessions=&&1
column c0 format 99999 heading "SID"
column c1 format A30 word_wrapped heading "Memory" 
column c2 format 999,999,990 heading "MBytes"


select a.sid c0, b.name c1, a.value/power(2,20) c2
from v$sesstat a, v$statname b
where a.statistic# = b.statistic#
      and lower(b.name) like '%memory%'
      and rownum < &&in_top_n_sessions
order by 3 desc;

set verify on
