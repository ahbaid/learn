clear columns
clear breaks

define in_owner=&&1

column c0 format A25 heading "Tablespace"
column c1 format 999,990 heading "Usage MB"

break on report
compute sum of c1 on report

select tablespace_name c0,
       sum(bytes)/power(2,20) c1
from dba_segments
where owner = upper('&&in_owner')
group by tablespace_name
order by c0
/
