-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/profileinfo.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

undefine in_profile_name
define in_profile_name=&&1

set pages 50
set echo off
set verify off
set feedback off
spool profileinfo

select resource_name, resource_type, limit from dba_profiles where profile = upper('&&in_profile_name');

spool off
set echo off
set verify on
set feedback on
