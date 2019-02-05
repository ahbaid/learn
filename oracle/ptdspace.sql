@format

set feedback off


select 'GLOBAL columns: '||count(*) as c from dba_tab_columns 
where table_name = 'SEARCH_DOCUMENTS_P1' and column_name like 'GLOBAL_VALUE%';

select 'PTD columns: '||count(*) as c from dba_tab_columns 
where table_name = 'SEARCH_DOCUMENTS_P1' and column_name like 'PTD_VALUE%';


select service_id, count(*), min(column_number), max(column_number) 
from search_global_item_fields
group by service_id;

set feedback on
