define in_schema=&&1

clear columns
clear breaks

set pages 1000
set lines 120

select dbms_metadata.get_granted_ddl('SYSTEM_GRANT',upper('&&in_schema')) from dual;
select dbms_metadata.get_granted_ddl('ROLE_GRANT',upper('&&in_schema')) from dual;
select dbms_metadata.get_granted_ddl('OBJECT_GRANT',upper('&&in_schema')) from dual;
