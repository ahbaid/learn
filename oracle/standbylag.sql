select round(24*60*(sysdate
  - decode(dbms_flashback.GET_SYSTEM_CHANGE_NUMBER, q.first_change#, q.first_time, min(x.maxnext))
  ))  lag
from
(select dest_id,max(next_time) maxnext from v$archived_log where
(dest_id, sequence#) in (
  select d.dest_id, max(l.sequence#)
      from v$archived_log l, v$archive_dest d
     where l.applied='YES'  and d.dest_id = l.dest_id(+) and d.target = 'STANDBY' and d.status='VALID'
     group by d.dest_id
)
group by dest_id) x,
(select first_change#, first_time from v$log where status='CURRENT') q
group by q.first_change#, q.first_time
/
