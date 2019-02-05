set pages 1000

select count(*) from dba_tab_privs 
where GRANTEE='OPS$ORACLE' and owner='PERFSTAT';

set heading off
set feedback off
set verify off
set termout off

spool grants_perfstat.dml

select 'grant delete on '||owner||'.'||table_name||' to OPS$ORACLE;'
from dba_tables where owner='PERFSTAT';

spool off

set heading on
set feedback on
set verify on
set termout on

PROMPT
PROMPT Review grants_perfstat.dml if the rows returned is equal to zero above...
PROMPT
