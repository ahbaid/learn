select snap_id, snap_time from stats$snapshot
where snap_id in (select min(snap_id) from stats$snapshot
                  union
                  select max(snap_id) from stats$snapshot)
/

select round(sysdate - (select snap_time from stats$snapshot
                  where snap_id in (select min(snap_id) from stats$snapshot)) )
as "Days of Data" from dual;
