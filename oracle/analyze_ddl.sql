clear columns
clear breaks

define in_schema=&&1

set feedback off
set verify off
set heading off
set termout off

column tmp_fname noprint new_value fname;
select 'analyze_'||upper('&&in_schema')||'_tables.sql' as tmp_fname from dual;

column tmp_fname2 noprint new_value lname;
select 'analyze_'||upper('&&in_schema')||'_tables.lst' as tmp_fname2 from dual;

spool &&fname

prompt set echo on
prompt spool &&lname
prompt

select 'analyze table '||owner||'.'||table_name||' estimate statistics sample 25 percent;' analyze 
from dba_tables
where owner = upper('&&in_schema');

prompt
prompt spool off

spool off;

set feedback on
set verify on
set heading on
set termout on
