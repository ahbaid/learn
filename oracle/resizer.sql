define in_tablespace_name=&&1
define in_new_size=&&2

set feedback off verify off heading off pages 1000 lines 200 newpage 0

spool resizeme.sql

prompt set echo on timing on

select 'alter database datafile '''||file_name||''' resize &&in_new_size;'
from dba_data_files
where tablespace_name = upper('&&in_tablespace_name')
order by file_id;

prompt set echo off timing off

spool off

set feedback on verify on heading on newpage 1
prompt
prompt "Resize script is resizeme.sql"
prompt
