select privilege, count(*)
from dba_sys_privs
where substr(grantee,1,2) = 'P_'
group by privilege
/

select grantee
from dba_sys_privs
where substr(grantee,1,2) = 'P_'
and privilege = 'ALTER SESSION'
/

