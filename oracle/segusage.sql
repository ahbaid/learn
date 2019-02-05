clear columns
clear breaks

column c0 format A20 heading "User"
column c1 format 999,999,990 heading "MBytes"

select owner, sum(bytes)/power(2,20) MBytes
from dba_segments
where owner not in ('SYSTEM','SYS')
group by owner
order by 2,1
/
