--
-- Author:	Ahbaid Gaffoor
-- Date:	Tuesday 25th February 2003
-- File:	waits.sql
--
-- Purpose:	Display system event wait times
--
-- License:	You may reuse this software at will provided you quote and retain this header
--
-- Disclaimer:  No warranty is provided with this software, no liability or guarantees
--              are given in any form
--
-- 
-- 	Some Important events:
--	=================
--	async disk IO
--	control file parallel write
--	control file sequential read
--	db file parallel write
--	db file scattered read
--	db file sequential read
--	direct path read
--	direct path write
--	log file parallel write
--	log file sync
--

define in_ordering=&&1

set lines 100
set pages 100
clear breaks
clear columns

column c1 heading 'Event'             	format A30 wrap
column c2 heading 'Total Waits'         format 999,999,999
column c3 heading 'Wait Time(s)'        format 999,999,999
column c4 heading 'Timeouts'        	format 999,999,999
column c5 heading 'Avg. Wait (s)' 	format 99.999

select 	event c1,
   	total_waits c2,
   	time_waited/100 c3,
   	total_timeouts c4,
   	average_wait/100 c5
from v$system_event
where event not in ( 
    'dispatcher timer',
    'lock element cleanup', 
    'Null event', 
    'parallel query dequeue wait',
    'parallel query idle wait - Slaves',
    'pipe get',
    'PL/SQL lock timer',
    'pmon timer', 
    'rdbms ipc message', 
    'slave wait',
    'smon timer', 
    'SQL*Net break/reset to client',
    'SQL*Net message from client', 
    'SQL*Net message to client',
    'SQL*Net more data to client',
    'virtual circuit status',
    'WMON goes to sleep'
   ) 
and event not like 'DFS%' 
and event not like '%done%'
and event not like '%Idle%'
and event not like 'KXFX%'
order by &&in_ordering desc ;
