set lines 80

column object format a40

select owner||'.'||table_name object, nvl(to_char(last_analyzed,'MM/DD/YYYY'),'Unanalyzed') last_analyzed 
from dba_tables where owner in ('ORADBA','ISTSU_OWNER') and
last_analyzed is null
order by owner, table_name
/
