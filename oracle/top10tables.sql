clear columns
clear breaks

define in_owner=&&1
define in_tablespace=&&2

set lines 130
set pages 100

column c0 format A10 heading "Owner"
column c1 format A30 heading "Table"
column c2 format 999,999,990 heading "MBytes"
column c3 format A30 heading "Tablespace"

select owner c0, 
       segment_name c1, 
       sum(bytes)/power(2,20) c2, 
       tablespace_name c3
from dba_segments where owner = upper('&&1') and
tablespace_name = upper('&&2') and
rownum < 11
group by owner, segment_name, tablespace_name
order by 3 desc;

