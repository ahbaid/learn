-- Author:		Ahbaid Gaffoor
-- File:		schema_ts_usage.sql
-- Use:			List schema tablespace usage

spool schema_ts_usage

define in_owner=&&1
set lines 120 pages 1000

column c0 format A30 heading "Tablespace"
column c1 format 999,999,990 heading "Space(Mb)"

select 
   tablespace_name as c0, 
   sum(bytes)/power(2,20) as c1
from dba_segments
where owner = upper('&&in_owner')
group by tablespace_name order by 1;
