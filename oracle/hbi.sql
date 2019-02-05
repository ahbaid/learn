-- Author:		Ahbaid Gaffoor
-- File:		headblockers.sql
-- Use:		

set pages 1000 lines 300
spool headblockers


column c0 format A20 heading "Module"
column c1 format 9999999 heading "SID"
column c2 format A20 heading "SQL_ID"
column c3 format 99999999 heading "Blocked"
column c4 format A10 heading "State"
column c5 format 99999999999 heading "Waited|(uSec)"
column c6 format 99999999999 heading "Remain|(uSec)"
column c7 format A120 word_wrapped heading "Wait Event Information"

@@dbname

set feedback off verify off
exec dbms_output.put_line(chr(10)||'Database: '||'&&dbname '||to_char(sysdate,'YYYYMMDD-HH24:MI:SS'));
set feedback on verify on

with sq as (
   select s.sid sid, 
          s.module module, 
          s.blocking_session blocking_session, 
          s.sql_id sql_id,
          sw.event ev,
          sw.p1text p1t, 
          sw.p1 wp1,
          sw.p2text p2t, 
          sw.p2 wp2,
          sw.p3text p3t, 
          sw.p3 wp3,
          sw.time_remaining_micro rt,
          sw.wait_time_micro usecw,
          sw.state state
   from v$session s, v$session_wait sw
   where s.sid = sw.sid
)
select s1.module as c0,
       s1.sid as c1,
       s1.sql_id as c2,
       count(*) as c3,
--       s1.state as c4,
       s1.usecw as c5,
       s1.rt as c6,
       rpad('('||s1.state||') ',25)||s1.ev||' ['||s1.p1t||','||s1.p2t||','||s1.p3t||'] -> ['||s1.wp1||','||s1.wp2||','||','||s1.wp3||']' as c7
from sq s1, sq s2
where s1.blocking_session is null and s2.blocking_session = s1.sid
group by s1.module, s1.sid, s1.sql_id, 
         s1.state, s1.usecw, s1.rt,
         rpad('('||s1.state||') ',25)||s1. ev||' ['||s1.p1t||','||s1.p2t||','||s1.p3t||'] -> ['||s1.wp1||','||s1.wp2||','||','||s1.wp3||']'
order by 4 desc, 1;


spool off
