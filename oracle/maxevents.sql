set feedback off
set heading off
set lines 130
set pages 100

clear columns
clear breaks

column event format A30 heading "Event"
column maxwt format 999,999,990 heading "Max Wait Time"

Select event, 'Max Event Wait Time = '||max(time_waited) maxwt
from v$session_event
where event not in ('SQL*Net message from client',
                'SQL*Net message to client',
                'pipe get',
                'pmon timer',
                'rdbms ipc message',
                'smon timer',
                'file open',
                'wakeup time manager',
                'queue messages',
                'PL/SQL lock timer',
                'control file sequential read',
                'db file parallel write',
                'SQL*Net break/reset to client',
                'SQL*Net more data from client',
                'SQL*Net message from dblink')
group by event
order by max(time_waited) desc;
PROMPT

set heading on
set feedback on
