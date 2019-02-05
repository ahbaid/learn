clear columns
clear breaks

set verify off

define in_lob_name=&&1

column c0 format A40 heading "Table"
column c1 format A30 heading "Column"
column c2 format A30 heading "Index"
column c3 heading "In Row"

select owner||'.'||table_name c0, 
       column_name c1, 
       index_name c2, 
       in_row c3
from dba_lobs where segment_name = upper('&&in_lob_name')
/

set verify on
