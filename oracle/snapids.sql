set verify off

define in_snaps=&&1
                                                                                                                               
select snap_id, snap_level, to_char(snap_time,'HH24:MI:SS MM/DD/YY') as snap_time from stats$snapshot
where rownum < &&in_snaps
order by snap_id desc;

set verify on
