clear columns
clear breaks

set verify off

define in_user=&&1

select privilege, admin_option 
from dba_sys_privs 
where grantee = upper('&&in_user')
order by privilege;

set verify on
