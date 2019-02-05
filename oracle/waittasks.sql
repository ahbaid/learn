--
-- Author:      Ahbaid Gaffoor
-- Date:        Tuesday 25th February 2003
-- File:        waittasks.sql
--
-- Purpose:     Display currently waiting tasks
--
-- License:     You may reuse this software at will provided you quote and retain this header
--
-- Disclaimer:  No warranty is provided with this software, no liability or guarantees
--              are given in any form
--
-- 

set lines 200
set pages 100
clear breaks
clear columns

define in_ordering=&&1

col c1  heading 'SID'        format 999
col c2  heading 'User Name'  format a16 wrap
col c3  heading 'Event Name' format a10 wrap
col c4  heading 'InWait(s)'  format 999,999.99
col c5  heading 'Wait Time'  format 999,999.99
col c6  heading 'state'      format a10 wrap
col c7  heading 'P1 text'    format a10 wrap
col c8  heading 'P1 Val'     format 999999999999999
col c9  heading 'P1 Raw'     format a10
col c10 heading 'P2 Text'    format a10 wrap
col c11 heading 'P2 Val'     format 999999999999999
col c12 heading 'P2 Raw'     format a10
col c13 heading 'P3 Text'    format a10 wrap
col c14 heading 'P3 Val'     format 999999999999999
col c15 heading 'P3 Raw'     format a10

SELECT 
   a.sid              c1, 
   decode(b.username, NULL,c.name, b.username)    c2,
   a.event            c3,
   a.seconds_in_wait  c4,
   a.wait_time        c5,
   a.state            c6,
   a.p1text           c7,
   a.p1               c8,
   a.p2text          c10,
   a.p2              c11,
   a.p3text          c13,
   a.p3              c14
FROM
   v$session_wait a, 
   v$session      b,
   v$bgprocess    c
where 
   event not like 'DFS%' and
   event not like 'KXFX%' and
   a.sid = b.sid and
   b.paddr = c.paddr (+) and
   event not in
          ('lock element cleanup',
          'pmon timer',
          'rdbms ipc message',
          'smon timer',
          'SQL*Net message from client',
          'SQL*Net break/reset to client',
          'SQL*Net message to client',
          'SQL*Net more data to client',
          'dispatcher timer',
          'Null event',
          'parallel query dequeue wait',
          'parallel query idle wait - Slaves',
          'pipe get',
          'PL/SQL lock timer',
          'slave wait',
          'virtual circuit status',
          'WMON goes to sleep'
          )
order by &&in_ordering desc ;

