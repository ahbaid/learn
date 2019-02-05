set verify off
set lines 130
set pages 1000
clear columns
clear breaks

define in_tablespace=&&1

column c1 format A12 heading "Owner"
column c2 format A30 heading "Object"
column c3 format A12 heading "Type"
column c4 format 999,999,999,990 heading "Size MB"

select owner c1, 
       segment_name c2, 
       segment_type c3, 
       sum(bytes)/power(2,20) c4
from dba_segments
where tablespace_name=upper('&&in_tablespace')
group by owner, segment_name, segment_type
order by 4,2,3
/

set verify on
