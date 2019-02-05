define in_component=&&1
set lines 120

column a heading "Date-Component-Pieces-UGA-memory-PGA-memory-TOTAL-memory-AVG-memory"

with memqry as (
select sn.name as mname, sum(ss.value) as mvalue, count(s.sid) as components
from v$statname sn, v$sesstat ss, v$session s
where s.program like '%&&in_component%' and
      sn.statistic# = ss.statistic# and
      ss.sid = s.sid
  and sn.name like '%memory'
group by sn.name )
select to_char(sysdate,'MM/DD/YYYY HH24:MI:SS')||'-&&in_component-'||uga_components||
       '-UGA-'||round(uga_value,2)||
       '-PGA-'||round(pga_value,2)||
       '-TOTAL-'||to_char(round(uga_value+pga_value,2))||
       '-AVG-'||to_char(round((uga_value+pga_value)/uga_components,2)) a
from ( select mname as uga, mvalue/power(2,20) as uga_value, components as uga_components
       from memqry where mname = 'session uga memory' ) uga,
     ( select mname as pga, mvalue/power(2,20) as pga_value, components as pga_components
       from memqry where mname = 'session pga memory' ) pga;
