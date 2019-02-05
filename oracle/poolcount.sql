select owner||'.'||table_name, buffer_pool
from dba_tables
where buffer_pool <> 'DEFAULT'
order by buffer_pool;


select owner, buffer_pool, count(*) from dba_tables
where buffer_pool <> 'DEFAULT' and owner not in ('SYSTEM','SYS','PERFSTAT')
group by owner, buffer_pool;
