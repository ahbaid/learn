define in_sid=&&1
define in_stat=&&2

select sn.name, st.value
from v$sesstat st, v$statname sn 
where st.sid = &&in_sid and
      st.statistic# = sn.statistic# and 
      sn.name like '%&&in_stat%'
/
