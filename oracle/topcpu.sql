-- Author:		Ahbaid Gaffoor
-- File:		topcpu.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

spool topcpu


set verify off

define in_top_n_sessions=&&1
column c0 format 99999 heading "SID"
column c1 format A30 word_wrapped heading "CPU" 
column c2 format 999,999,990 heading "CPU Sum"
column c3 format A50 word_wrapped heading "Module" 
column c4 format A20 word_wrapped heading "sql_id" 


select a.sid c0, b.name c1, a.value c2, s.module c3, s.sql_id c4
from v$sesstat a, v$statname b, v$session s
where a.statistic# = b.statistic# and
      s.sid = a.sid and 
      b.name = 'CPU used by this session' and 
      rownum < &&in_top_n_sessions
order by 3 desc;

set verify on
