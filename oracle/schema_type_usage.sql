-- Author:		Ahbaid Gaffoor
-- File:		schema_type_usage.sql
-- Use:		  	List schema object usage by type

define in_owner=&&1
set lines 120 pages 1000 

column c0 format A30 heading "Segment Type"
column c1 format 999,999,990 heading "Space(Mb)"

select 
   segment_type as c0, 
   sum(bytes)/power(2,20) as c1
from dba_segments
where owner = upper('&&in_owner')
group by segment_type order by 1;
