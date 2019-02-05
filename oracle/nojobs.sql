-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/nojobs.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

set echo on
spool nojobs

alter system set job_queue_processes=0;
alter system set aq_tm_processes=0;

spool off
set echo off
