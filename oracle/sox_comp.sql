col status for a10
col password for a25
col profile for a25
col username for a25
set lines 300
set head off
set feed off
select 'To check whether Production DBA accounts have been set with the GSD_DBA_PROFILE and passwords changed' from dual;
select '__________________________________________________________________________________' from dual;
select 'USER,PASSWORD,PROFILE,PASSWORD_CHANGED,PASSWORD_EXPIRES,STATUS' from dual;
select u.name  ||','||u.password ||','||du.profile ||','||u.ptime ||','||du.expiry_date ||','||du.account_status  from user$ u, dba_users du
where u.user# = du.user_id and u.name in ('SYS','SYSTEM','OUTLN','DBSNMP','CSMIG','CTXSYS','TRACESVR','OSE$HTTP
$ADMIN','AURORA$ORB$UNAUTHENTICATED','AURORA$JIS$UTILITY$','OPS$ORACLE','PATROL35','PRECISE','PRECISE_I3','PERF
STAT','SYSMAN','MGMT_VIEW','WMSYS','DIP','ORDSYS','ORDPLUGINS','MDSYS');

select 'Other production Account with password Changed and profile set' from dual;
select '________________________________________________' from dual;
select 'USER,PASSWORD,PROFILE,PASSWORD_CHANGED,PASSWORD_EXPIRES,STATUS' from dual;
select u.name||','||u.password||','||du.profile||','||u.ptime||','||du.expiry_date||','||du.account_status
from user$ u,dba_users du
where u.user# = du.user_id and u.name not in ('SYS','SYSTEM','OUTLN','DBSNMP','CSMIG','CTXSYS','TRACESVR','OSE$HTTP$ADMIN','AURORA$ORB$UNA
UTHENTICATED','AURORA$JIS$UTILITY$','OPS$ORACLE','PATROL35','PRECISE','PRECISE_I3','PERFSTAT','SYSMAN','MGMT_VIEW','WMSYS','DIP','ORDSYS',
'ORDPLUGINS','MDSYS') and username not like 'P\_%' escape '\'
/
select 'Other production Account with GSD Roles' from dual;
select '_______________________________' from dual;
select 'GRANTEE,GRANTED ROLE' from dual;
select grantee||','||granted_role from dba_role_privs where grantee not in ('SYS','GSD_ROLE_APP_ADMIN','GSD_ROLE_APP_OWNER','GSD_ROLE_SUPPORT_USER',
'GSD_ROLE_APP_USER','GSD_ROLE_INTERFACE_USER') and granted_role in('GSD_ROLE_CATALOG','GSD_ROLE_SUPPORT_CATALOG','GSD_ROLE_APP_CATALOG',
'GSD_ROLE_APP_OWNER','GSD_ROLE_APP_USER','GSD_ROLE_MANGOCONNECT',
'GSD_ROLE_SUPPORT_USER','GSD_ROLE_REPORT_USER','GSD_ROLE_CONNECT_USER',
'GSD_ROLE_INTERFACE_USER') order by grantee,granted_role

select 'Other production Account without any Roles' from dual;
select '_______________________________' from dual;
select 'User Name' from dual;
select username from dba_users where username not in ('SYS','SYSTEM','OUTLN',
'DBSNMP','CSMIG','CTXSYS','TRACESVR',
'OSE$HTTP$ADMIN','AURORA$ORB$UNAUTHENTICATED','AURORA$JIS$UTILITY$',
'OPS$ORACLE','PATROL35','PRECISE','PRECISE_I3','PERFSTAT','SYSMAN',
'MGMT_VIEW','WMSYS','DIP') and username not like 'P\_%' escape '\' 
and username not in (select grantee from dba_role_privs)
/

select 'User Account that are expired or/and locked' from dual;
select '_______________________________' from dual;
select 'UserName,Account Status, Lock date, Expiry date' from dual;
select username||','||ACCOUNT_STATUS||','||LOCK_DATE||','||EXPIRY_DATE
 from dba_users where ACCOUNT_STATUS != 'OPEN';
