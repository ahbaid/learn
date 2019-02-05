-- Author:		Ahbaid Gaffoor
-- File:		highsql.sql
-- Use:		

define in_high_count=&&1

set pages 1000

select sql_id, loaded_versions, version_count, invalidations,
       executions, round(sharable_mem/1024,0) shareable_mem_kb, object_status, child_latch, last_active_time 
from v$sqlarea
where version_count > &&in_high_count
order by 3 asc
/
