-- Author:		Ahbaid Gaffoor
-- File:		latchstats.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

set verify off
define in_lname=&&1

-- {{{ descriptions
set termout off
/*
SQL> desc v$latch
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 ADDR                                                                             RAW(4)
 LATCH#                                                                           NUMBER
 LEVEL#                                                                           NUMBER
 NAME                                                                             VARCHAR2(50)
 HASH                                                                             NUMBER
 GETS                                                                             NUMBER
 MISSES                                                                           NUMBER
 SLEEPS                                                                           NUMBER
 IMMEDIATE_GETS                                                                   NUMBER
 IMMEDIATE_MISSES                                                                 NUMBER
 WAITERS_WOKEN                                                                    NUMBER
 WAITS_HOLDING_LATCH                                                              NUMBER
 SPIN_GETS                                                                        NUMBER
 SLEEP1                                                                           NUMBER
 SLEEP2                                                                           NUMBER
 SLEEP3                                                                           NUMBER
 SLEEP4                                                                           NUMBER
 SLEEP5                                                                           NUMBER
 SLEEP6                                                                           NUMBER
 SLEEP7                                                                           NUMBER
 SLEEP8                                                                           NUMBER
 SLEEP9                                                                           NUMBER
 SLEEP10                                                                          NUMBER
 SLEEP11                                                                          NUMBER
 WAIT_TIME                                                                        NUMBER

SQL> desc v$latchname
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 LATCH#                                                                           NUMBER
 NAME                                                                             VARCHAR2(50)
 HASH                                                                             NUMBER

SQL> desc v$latchholder
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 PID                                                                              NUMBER
 SID                                                                              NUMBER
 LADDR                                                                            RAW(4)
 NAME                                                                             VARCHAR2(64)
 GETS                                                                             NUMBER

*/
set termout on
-- }}}

column c0 format a30 heading "Latch"
column c1 heading "SID"
column c2 format "999,999,999,999,999" heading "W2Wait|Gets"
column c3 format 990.00 heading "W2Wait|Hit Ratio"
column c4 format "999,999,999,999,999" heading "NoWait|Gets"
column c5 format 990.00 heading "NoWait|Hit Ratio"

select ln.name c0,
       lh.sid c1,
       l.gets c2,
       (l.gets - l.misses)/l.gets*100 c3,
       l.immediate_gets c4,
       (l.immediate_gets - l.immediate_misses)/l.immediate_gets*100 c5
from v$latch l, v$latchholder lh, v$latchname ln
where l.addr = lh.laddr(+) and 
      l.latch# = ln.latch# and
      l.gets > 0 and
      l.immediate_gets > 0 and
      upper(ln.name) like '%'||upper('&&in_lname')||'%'
order by 4 asc;
set verify on
