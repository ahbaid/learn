column machine format A40 word_wrapped
set lines 130

select sid, schemaname, machine, logon_time , sysdate-logon_time "Duration"
from v$session
where status='ACTIVE' and schemaname <> 'SYS'
order by logon_time desc
/
