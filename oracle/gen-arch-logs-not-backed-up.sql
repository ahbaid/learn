rem holmer 07/01/05 
rem gen-copy-arch-logs-not-backed-up.sql 
set pages
set feed off
set head off

set lines 120
prompt
prompt run this to make sure logs don't already exist on primary : run-on-primary-ls-arch-files.ksh
prompt
spool run-on-primary-ls-arch-files.ksh
select 'ls ' ||  substr(name,1,80) from  admin.archive_log_backups
where first_backup_time is null 
and completion_time <= (select max(startup_time) from gv$instance)
order by completion_time;
spool off

set lines 250
prompt
prompt run this to copy logs to primary IF THEY DON'T ALREADY EXIST : run-on-standby-copy-arch-files.ksh
prompt 
spool run-on-standby-copy-arch-files.ksh
select  'dd --o_direct=1M if=' || substr(name,1,80)
|| ' | ssh -1 -c none PRIMARY_HOST_NAME " cd ' || substr(name,1,24)
|| ' ; dd --o_direct=1M of=' || substr(name,25,80) || '"'
from  admin.archive_log_backups where first_backup_time is null
and completion_time <= (select max(startup_time) from gv$instance)
order by completion_time;
spool off
