clear columns
column granted_role format A30 heading "Role"

set verify off

define in_user=&&1

select granted_role from dba_role_privs where grantee = upper('&&in_user');

set verify on
