set feedback off
set heading off
set verify off
set lines 132
set pages 1000

define in_user=&&1

spool recompile_&&in_user..sql

select 'alter '||decode(object_type,'PACKAGE BODY','PACKAGE',object_type)||' '||object_name||' compile;' as DML
from dba_objects
where owner = upper('&&in_user') and status = 'INVALID';

spool off

set feedback on
set heading on
set verify on
