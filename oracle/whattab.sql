clear columns
clear breaks

set verify off
define in_table_name=&&1

select owner||'.'||table_name "Table"
from dba_tables
where table_name like '%'||upper('&&in_table_name')||'%'
order by owner,table_name;

set verify on
