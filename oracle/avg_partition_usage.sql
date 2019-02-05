define in_owner=&&1
define in_object=&&2

set lines 120
set pages 1000

column c0 heading "Total/MB"
column c1 heading "Count"
column c2 heading "Max/MB"
column c3 heading "Avg/MB"


with usageqry as
(
select owner||'.'||segment_name||'--> '||segment_type sn, partition_name, sum(bytes)/power(2,20) as mb
from dba_segments
where owner = upper('&&in_owner') and segment_name = upper('&&in_object')
group by owner||'.'||segment_name||'--> '||segment_type, partition_name
order by 1,2,3
)
select sum(mb) as c0, 
       count(mb) as c1, 
       max(mb) as c2, 
       sum(mb)/count(mb) as c3
from usageqry;
