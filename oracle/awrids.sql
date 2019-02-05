 select snap_id, BEGIN_INTERVAL_TIME, END_INTERVAL_TIME from dba_hist_snapshot
where snap_id in (select snap_id from (select snap_id from dba_hist_snapshot order by 1 desc) where rownum <= 3)
/
