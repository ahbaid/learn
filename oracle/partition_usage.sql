define in_owner=&&1
define in_object=&&2

set lines 120 pages 1000 verify off

column sn format A60 word_wrapped heading "Object"

select owner||'.'||segment_name||'--> '||segment_type sn, partition_name, sum(bytes)/power(2,20) as mb
from dba_segments
where owner = upper('&&in_owner') and segment_name = upper('&&in_object')
group by owner||'.'||segment_name||'--> '||segment_type, partition_name
order by 1,2,3;

set verify on
