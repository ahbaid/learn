-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/smon_dump.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

set echo on
spool smon_dump


undefine in_smon_ospid
oradebug setospid &&in_smon_ospid
oradebug unlimit
oradebug dump errorstack 10
oradebug tracefile_name

set echo off
spool off
