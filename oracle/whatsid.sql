set verify off
set lines 132
set pages 70

define in_sid=&&1

column c1 heading "OS" format A15;
column c2 heading "SID" format 9999;
column c3 heading "Serial#" format 999999999999 
column c4 heading "Status";
column c5 heading "Lock Wait" format A10;
column c6 heading "Server";
column c7 heading "Unix PID" format A10;
column c8 heading "Hash";
column c9 heading "Machine" format A25;

select ses.osuser c1, 
       ses.sid c2, 
       ses.serial# c3, 
       ses.status c4, 
       ses.lockwait c5, 
       ses.server c6, 
       prc.spid c7,
       ses.sql_hash_value c8,
       ses.machine c9
from v$session ses, v$process prc
where ses.sid = &&in_sid and
      ses.paddr = prc.addr;

set verify on
