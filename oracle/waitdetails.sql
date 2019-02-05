--
-- Author:      Ahbaid Gaffoor
-- Date:        Tuesday 25th February 2003
-- File:        waitdetails.sql
--
-- Purpose:     Display system event wait times
--
-- License:     You may reuse this software at will provided you quote and retain this header
--
-- Disclaimer:  No warranty is provided with this software, no liability or guarantees
--              are given in any form
--
-- 
--      Some Important events:
--      =================
--      async disk IO
--      control file parallel write
--      control file sequential read
--      db file parallel write
--      db file scattered read
--      db file sequential read
--      direct path read
--      direct path write
--      log file parallel write
--      log file sync
--


set lines 132
set pages 1000
clear breaks
clear columns

column c1 heading 'ID'                    format 999
column c2 heading 'Process'               format A10
column c3 heading 'Event'                 format A30
column c4 heading 'Total Waits'           format 999,999
column c5 heading 'Wait Time(s)'          format 999,999
column c6 heading 'Timeouts'              format 999,999
column c7 heading 'Avg. Wait(s)'          format 999
column c8 heading 'Max Wait(s)'           format 999

select  b.sid                                     c1,
        decode(b.username,NULL,c.name,b.username) c2,
        event                                     c3, 
        a.total_waits                             c4,
        round((a.time_waited / 100),2)            c5,
        a.total_timeouts                          c6,
        round((average_wait / 100),2)             c7,
        round((a.max_wait / 100),2)               c8
from 
   sys.v_$session_event a, 
   sys.v_$session       b,
   sys.v_$bgprocess     c
where
   event not like 'DFS%' and
   event not like 'KXFX%' and
   a.sid = b.sid and
   b.paddr = c.paddr (+) and
   event not in (
   'lock element cleanup',
   'pmon timer',
   'rdbms ipc message',
   'smon timer',
   'SQL*Net message from client',
   'SQL*Net break/reset to client',
   'SQL*Net message to client',
   'SQL*Net more data to client',
   'dispatcher timer',
   'Null event',
   'io done',
   'parallel query dequeue wait',
   'parallel query idle wait - Slaves',
   'pipe get',
   'PL/SQL lock timer',
   'slave wait',
   'virtual circuit status',
   'WMON goes to sleep')
order by 4 desc ;

