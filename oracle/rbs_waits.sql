clear columns
clear breaks
set lines 130
set pages 1000

column c0 format A8 heading "Segment"
column c1 format 999,990 heading "Size/MB"
column c2 format 999,990 heading "Extents"
column c3 format 999,990 heading "Size/MB"
column c4 format 999,990 heading "Waits"

select rsn.name c0,
       rss.rssize/power(2,20) c1,
       rss.extents c2,
       (rss.rssize/rss.extents)/power(2,20) c3,
       waits c4
from v$rollname rsn, v$rollstat rss
where rsn.usn = rss.usn
order by 1
/
