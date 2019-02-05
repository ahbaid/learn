@@dbcheck

clear breaks
column c0 format A10 heading "Pool"
column c1 format A20 heading "Statistic"
column c2 format 999,999,990.00 heading "MBytes"

break on report
compute sum of c2 on report

select pool c0, 
       name c1, 
       bytes/power(2,20)  c2
from v$sgastat
where upper(pool) like '%JAVA%' ;

show parameter java
