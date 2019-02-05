clear columns
clear breaks

column owner format a10
column segment_name format a60
column segment_type format a25
column tablespace_name format a20
column segtype format a30
column mbytes format 99,999,999,999 heading "MBytes"

set lines 160
set verify off

compute sum of mbytes on segtype
break on segtype skip 1


define in_owner=&&1
define in_table_name=&&2

PROMPT &&in_table_name SEGMENT USAGE

select 
	segment_name||decode(partition_name,null,null,'.'||partition_name) as segment_name,
	segment_type||'.'||tablespace_name segtype, 
	extents,
	bytes/power(2,20) mbytes
from 
	dba_segments 
where 
        owner=upper('&&in_owner') and
	segment_name in 
	(
	(select table_name from dba_tables where table_name = upper('&&in_table_name') and owner=upper('&&in_owner')) 
	union
	(select index_name from dba_indexes where table_name in upper('&&in_table_name') and owner=upper('&&in_owner')) 
        union
	(select segment_name from dba_lobs where table_name in upper('&&in_table_name') and owner=upper('&&in_owner')) 
	)
order by owner, segment_name||decode(partition_name,null,null,'.'||partition_name), segment_type desc
;
