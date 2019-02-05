column c0 format 99999 heading "SID"
column c1 format a50 heading "Host"
column c2 format A30 heading "Info"

@date
set termout off feedback off verify off heading off newpage 0
spool runsbreport.sql
prompt
select unique '@sessplan_quiet '||session_id from dba_locks where blocking_others = 'Blocking';
prompt
spool off
set termout on feedback on verify on heading on newpage 0


spool blocker_report append

select s.sid as c0, 
       s.machine as c1, 
       s.client_info as c2
from v$session s, dba_locks l
where s.sid = l.session_id
  and l.blocking_others = 'Blocking'
order by 3,2;

@runsbreport.sql

spool off
