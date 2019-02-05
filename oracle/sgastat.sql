define in_sgastat=&&1

column c0 format A15 heading "Pool"
column c1 format A25 heading "Name"
column c2 format 999,999,990.00 heading "MBytes"

select pool c0,
       name c1,
       bytes/power(2,20)  c2
from v$sgastat
where upper(pool) like '%'||'&&in_sgastat'||'%'  or
      upper(name) like '%'||'&&in_sgastat'||'%'
/
