define in_oname = &&1
define in_pname = &&2


column segment_name format A30 heading "Object"
column  psize format 999,999,999,990 heading "MBytes"

select 
    owner, segment_name,
    sum(bytes)/power(2,20) psize
from dba_segments
where segment_name = upper('&&in_oname') and partition_name = upper('&&in_pname')
group by owner, segment_name;
