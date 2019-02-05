clear columns
clear breaks

set verify off

define in_index_name=&&1

select owner, table_name, index_type 
from dba_indexes 
where index_name = upper('&&in_index_name') and
      owner = table_owner;

set verify on
