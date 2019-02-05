column owner format A12

select owner, table_name, trigger_name
from dba_triggers
where trigger_name like 'GSD%'
/
