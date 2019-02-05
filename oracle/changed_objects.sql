set verify off

clear columns
clear breaks

define in_date=&&1

spool changed_objects

set lines 130
set pages 6000

column c0 format A10 heading "Owner"
column c1 format A30 heading "Object"
column c2 format A20 heading "Type"
column c3 format A20 heading "Created"
column c4 format A20 heading "Modified"

set feedback off
select instance_name "DATABASE" from v$instance;
select to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') "TODAY" from dual;
set feedback on

select owner c0, 
       object_name c1, 
       object_type c2, 
       to_date(created,'DD-MON-YYYY HH24:MI:SS') c3, 
       to_date(last_ddl_time,'DD-MON-YYYY HH24:MI:SS') c4
from dba_objects
where owner not in (
                    'SYS',
                    'SYSTEM',
                    'DBSNMP',
                    'OUTLN',
                    'OSE$HTTP$ADMIN',
                    'AURORA$ORB$UNAUTHENTICATED',
                    'AURORA$JIS$UTILITY$',
                    'OPS$ORACLE',
                    'CTXSYS',
                    'CSMIG',
                    'PERFSTAT',
                    'PRECISE_I3',
                    'PRECISE',
                    'PATROL35'
                   ) and
      ( trunc(created) >= to_date('&&in_date','MMDDYY') or
        trunc(last_ddl_time) >= to_date('&&in_date','MMDDYY') )
order by 5;

spool off
