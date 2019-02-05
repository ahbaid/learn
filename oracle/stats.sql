--
-- Usage: @stats <sid> <substring_to_match>
--
set lines 100
set pages 1000
set verify off
set feedback off

clear columns
clear breaks

define in_sid=&&1
define in_stat_name=&&2

set termout off
column pheading noprint new_value sid_heading
select '&&in_sid'||' '||schemaname||' '||osuser||'@'||machine as pheading 
from v$session
where sid=&&in_sid;
set termout on

column c0 heading "Stat#"
column c1 format A50 heading "&&sid_heading" word_wrapped
column c2 heading "Value" word_wrapped


select a.statistic# c0,
       b.name c1, 
       a.value c2
from v$sesstat a, v$statname b
where a.statistic# = b.statistic# and
      a.sid = &&in_sid and
      lower(b.name) like '%'||lower('&&in_stat_name')||'%'
/

PROMPT

set feedback on
set verify on
