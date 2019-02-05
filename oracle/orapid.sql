set verify off
set lines 132
set pages 70

define in_unixpid=&&1

column c1 heading "OS" format A15;
column c2 heading "SID" format 999;
column c3 heading "Serial#";
column c4 heading "Status";
column c5 heading "Lock Wait" format A10;
column c6 heading "Server";
column c7 heading "Unix PID" format A10;
column c8 heading "Hash";
column c9 heading "Machine" format A25;
column c10 heading "Address" format A12;
column c11 heading "Schema" format A12;
column c12 heading "Program" format A12;

select ses.osuser c1, 
       ses.sid c2, 
       ses.serial# c3, 
       ses.status c4, 
       ses.schemaname c11, 
       ses.lockwait c5, 
       ses.server c6, 
       prc.spid c7,
       ses.sql_address c10,
       ses.sql_hash_value c8,
       ses.machine c9,
       ses.program c12
from v$session ses, v$process prc
where prc.spid = &&in_unixpid and
      ses.paddr = prc.addr;

set verify on
