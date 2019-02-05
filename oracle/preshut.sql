-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/preshut.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

set echo on
spool preshut


show parameter aq_tm_processes
show parameter job_queue_processes

alter system set job_queue_processes=0;
alter system set aq_tm_processes=0;

alter system flush shared_pool;
alter system flush buffer_cache;

alter system switch logfile;
alter system archive log current;

prompt Issue a shutdown immediate

spool off
set echo off
