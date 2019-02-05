/*
alter table <table_name> storage ( buffer_pool { KEEP | RECYCLE | DEFAULT } );
*/

define in_object_name=&&1

clear columns
clear breaks

set verify off

select owner||'.'||index_name||' -> '||buffer_pool as "Cached" 
from dba_indexes
where index_name = upper('&&in_object_name')
union
select owner||'.'||table_name||' -> '||buffer_pool as "Cached" 
from dba_tables
where table_name = upper('&&in_object_name');

set verify on
