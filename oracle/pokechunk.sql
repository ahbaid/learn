set heading off
set feedback off
set verify off

/*   select service_id, decode(service_id, 'item', nvl(global_value_010,'N'), 'offering', nvl(global_value_009,'N')) as ndx, count(*) as count
   from search_documents_p1 partition(&&in_chunk)
   group by  service_id, decode(service_id, 'item', nvl(global_value_010,'N'), 'offering', nvl(global_value_009,'N'));
*/

column service_id format a15
column ndx format A60
define in_chunk=&&1

spool poke50 append
select '&&in_chunk'||':'||service_id||':'||decode(service_id, 'item', nvl(global_value_010,'N'), 'offering', nvl(global_value_009,'N'))||':' as ndx, count(*) as count
from search_documents_p1 partition(&&in_chunk)
group by '&&in_chunk'||':'||service_id||':'||decode(service_id, 'item', nvl(global_value_010,'N'), 'offering', nvl(global_value_009,'N'))||':';
spool off

set feedback on
set verify on
set heading on
