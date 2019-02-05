clear columns
clear breaks

define in_owner=&&1

column c0 format a30 heading "Type"
column c1 format 999,999,990 heading "MBytes"

select segment_type c0, 
       sum(bytes)/power(2,20) c1
from dba_segments
where owner = upper('&&in_owner')
group by segment_type;
