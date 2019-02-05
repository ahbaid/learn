define in_schema=&&1

column c0 format A30 heading "Name"
column c1 format A15 heading "Type"
column c2 format A30 heading "Tablespace"

select segment_name c0, 
       segment_type c1, 
       tablespace_name c2
from dba_segments where owner = upper('&&in_schema')
order by 2,1;
