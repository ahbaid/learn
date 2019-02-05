clear columns
clear breaks
set lines 132
set pages 1000

define in_owner=&&1
define in_name=&&2

column c0 format A30 heading "Column" word_wrapped

select column_name c0
from dba_ind_columns
where index_owner = upper('&&in_owner') and
      index_name = upper('&&in_name')
order by column_position
/
