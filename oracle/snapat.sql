-- Author:		Ahbaid Gaffoor
-- File:		snapat.sql
-- Date:		Tuesday 3rd October 2006
-- Use:			Get statspack id for a given time

spool snapat

set verify off
define in_snap_hour=&&1
define in_tz_adj=&&2

select snap_id, snap_time TZ, snap_time-(&&in_tz_adj/24) as LOCAL_TZ from stats$snapshot
where to_char(snap_time,'mm/dd/yyyy/hh24') = to_char(to_date('&&in_snap_hour','mm/dd/yyyy/hh24')+(&&in_tz_adj/24), 'mm/dd/yyyy/hh24');

set verify on
