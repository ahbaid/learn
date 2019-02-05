define in_stamp=&&1

prompt
prompt snap_id format 'MM/DD/YYYY-HH24:MM:SS' GMT time
prompt

select snap_id,  begin_interval_time, end_interval_time from dba_hist_snapshot
where to_date('&&in_stamp','MM/DD/YYYY-HH24:MI:SS') between begin_interval_time and end_interval_time;
