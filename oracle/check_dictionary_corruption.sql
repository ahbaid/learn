set verify off
set space 0
set heading off
set feedback off
set pages 0
spool analyze.sql
PROMPT spool analyze.log
PROMPT set echo on
select 'analyze '||object_type||' '||object_name||' validate structure;'
from dba_objects
where owner = 'SYS' 
and object_type in ('INDEX','TABLE','CLUSTER');
PROMPT set echo off
PROMPT spool off
spool off
@analyze
ed analyze.log
