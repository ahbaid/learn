clear columns
clear breaks

set verify off

set pages 1000
set lines 120

column mowner format A20 word_wrapped heading "Owner"
column c0 format A30 heading "Materialized View"
column c1 format A30 heading "Last Refreshed"
column c2 format 999,999,990 heading "MBytes"

select mv.owner mowner,
       mview_name c0,
       to_char(last_refresh_date,'MM/DD/YY HH24:MI:SS') c1,
       sum(bytes)/power(2,20) c2
from dba_mviews mv, dba_segments ds
where ds.owner = mv.owner and
      ds.segment_name = mv.mview_name
group by mv.owner, mview_name, to_char(last_refresh_date,'MM/DD/YY HH24:MI:SS')
order by 1,2;

set verify on
