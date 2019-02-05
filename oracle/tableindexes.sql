define in_owner=&&1
define in_table=&&2

select index_name from dba_indexes where table_owner = upper('&&in_owner') and table_name = upper('&&in_table');
