-- Author:		Ahbaid Gaffoor
-- File:		sysaux_rebuild_ddl.sql
-- Date:		Sep 19th 2008
-- Use:			Rebuild SYSUAX tables and indexes to release space

set feedback off verify off

prompt
prompt
prompt Neither Shrink nor Row movement can be enabled for SYSAUX tables as indexes are function based
prompt
prompt Steps:
prompt 1) Purge data
prompt 2) Rebuild tables
prompt 3) Rebuild indexes
prompt
prompt Note: This will break any running stats jobs
prompt
prompt
prompt Rebuild the table segments
prompt

select 'alter table '||segment_name||' move tablespace SYSAUX;'  as DDL
from dba_segments 
where tablespace_name = 'SYSAUX' and segment_name like '%OPT%' and segment_type='TABLE'
order by segment_name;

prompt
prompt Rebuild the index segments
prompt

select 'alter index '||segment_name||'  rebuild online parallel (degree 4);' as DDL
from dba_segments 
where tablespace_name = 'SYSAUX' and segment_type='INDEX' and segment_name like '%OPT%' 
order by segment_name;

set feedback on verify on

prompt
