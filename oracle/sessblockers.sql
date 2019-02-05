column c0 format 99999 heading "SID"
column c1 format a50 heading "Host"
column c2 format A30 heading "Info"

@date

select s.sid as c0, 
       s.machine as c1, 
       s.client_info as c2
from v$session s, dba_locks l
where s.sid = l.session_id
  and l.blocking_others = 'Blocking'
order by 3,2;
