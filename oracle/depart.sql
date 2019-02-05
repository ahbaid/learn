-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/depart.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		



define schema=&&1
define table=&&2

set echo off
column ddl format A100
set lines 120
set pages 0

set timing off
set heading off
set feedback off
set verify off
set termout off

spool drop_parts_&&table..sql

prompt set echo on
select 'alter table &&schema..&&table drop partition '||subobject_name||';' as ddl
from dba_objects
where owner = upper('&&schema') and object_name = upper('&&table') and subobject_name is not null
order by subobject_name desc;
prompt set echo off

spool off


set heading on
set feedback on
set verify on
set termout on

prompt drop_parts_&&table..sql
