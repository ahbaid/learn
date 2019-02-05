set verify off

define in_event=&&1

select sw.event, sw.sid, s.serial#, sw.seconds_in_wait from v$session_wait sw, v$session s
where s.sid = sw.sid and
      upper(sw.event) like '%'||upper('&&in_event')||'%'
order by sw.seconds_in_wait desc;

set verify on

