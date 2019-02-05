set heading off
set lines 100
set pages 0
set feedback off
set verify off

define employee_acct=&&1
define employee_pass=&&2
define system_password=&&3

spool setpasswd.sql
host chmod 600 setpasswd.sql
select 'connect system@'||connect_string||'/&&system_password'||chr(10)||'alter user &&employee_acct identified by &&employee_pass;' 
from dba_rep.db_hosts
where db_type = 'PRODUCTION';
spool off


set feedback on
set verify on


