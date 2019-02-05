clear columns
clear breaks
define in_owner=&&1

column column_name format a30
set lines 150
set pages 1000

select table_name, column_name, segment_name, index_name, in_row
from dba_lobs where owner = upper('&&in_owner')
/
