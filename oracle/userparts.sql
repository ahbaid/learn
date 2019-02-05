clear columns
clear breaks

define in_owner=&&1

column c0 format A30 heading "Object"
column c1 format 9,990 heading "Partitions"
column c2 format A10 heading "Type"

select 'TABLE' c2, table_name c0, count(*) c1
from dba_tab_partitions
where table_owner = upper('&&in_owner')
group by 'TABLE', table_name
union
select 'INDEX' c2, index_name c0, count(*) c1
from dba_ind_partitions
where index_owner = upper('&&in_owner')
group by 'INDEX', index_name
union
select 'LOB' c2, lob_name c0, count(*) c1
from dba_lob_partitions
where table_owner = upper('&&in_owner')
group by 'LOB', lob_name
;
