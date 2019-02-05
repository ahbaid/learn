set verify off

select sn.name, st.value as reads, st.value*8092/power(2,20) "mb"
from  v$sesstat st, v$statname sn
where st.sid = &&1 and
 st.statistic# = sn.statistic# and
sn.name = 'physical reads'
/

set verify on
