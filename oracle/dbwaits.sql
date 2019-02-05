-- Author:		Ahbaid Gaffoor
-- File:		dbwaits.sql
-- Date:		Thursday 19th Nov 2009
-- Use:			Using ASH show most recent wait events by session grouping
--			Sessions are grouped by nvl(client_id, nvl(module, program))

set verify off termout off feedback off heading off pages 1000

define in_session_identifier=&&1
define in_period=&&2

column c_sid new_value session_identifier noprint
column c_hist new_value session_window noprint
select '&&in_session_identifier' as c_sid, round(&&in_period*24*60) as c_hist from dual;

set termout on

declare
 header varchar2(250);
begin
 header := '&&session_identifier'||' wait events in the last '||to_char(&&session_window)||' minutes: ';
 dbms_output.put_line(chr(10)||rpad('=',length(header),'='));
 dbms_output.put_line(header);
 dbms_output.put_line(rpad('=',length(header),'='));
end;
/

set heading on feedback on

select nvl(event,'Non DB Wait') as event,  sum(time_waited)
from v$active_Session_history
where lower(module) like lower('%&&in_session_identifier%') and
      sample_time > (sysdate-&&in_period)
group by nvl(event,'Non DB Wait')
order by 2 asc, 1 desc;

set verify on feedback on heading on
