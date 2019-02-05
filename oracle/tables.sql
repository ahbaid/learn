set verify off
set pages 200
set lines 300

define in_owner=&&1
define in_order=&&2

column c0 format a30 heading "Table"
column c1 heading "Created"
column c2 heading "Last Analyzed"
column c3 format 999,999,999,999,990 heading "Rows"
column c4 format a11 heading "Partitioned"

select dt.table_name c0,
       do.created c1,
       dt.last_analyzed c2,
       dt.num_rows c3,
       dt.partitioned c4 
from dba_tables dt, dba_objects do
where dt.owner = upper('&&in_owner') and
      do.owner = dt.owner and dt.table_name = do.object_name and do.object_type = 'TABLE'
order by &&in_order;
