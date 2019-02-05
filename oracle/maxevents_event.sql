set verify off

define in_event=&&1

select event, sid, time_waited from v$session_event
where upper(event) like '%'||upper('&&in_event')||'%'
order by time_waited desc;

set verify on

