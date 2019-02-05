-- Author:		Ahbaid Gaffoor
-- File:		headblockers.sql
-- Use:		

set pages 1000
spool headblockers

column c0 format A20 heading "Module"
column c1 format 9999999 heading "SID"
column c2 format A20 heading "SQL_ID"
column c3 format 9999999999999999 heading "Blocked Sessions"

with sq as (select sid, module, blocking_session, sql_id from v$session)
select s1.module as c0,
       s1.sid as c1,
       s1.sql_id as c2,
       count(*) as c3
from sq s1, sq s2
where s1.blocking_session is null and s2.blocking_session = s1.sid
group by s1.module, s1.sid, s1.sql_id
order by 4 desc, 1;

spool off
