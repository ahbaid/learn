column name format A25
select * from v$sysstat where class=4
/

column locks heading "Locks Held: requests - releases"
select e1.requests - e2.releases as locks
from (select value as requests 
      from v$sysstat where name = 'enqueue requests') e1,
     (select value as releases 
      from v$sysstat where name = 'enqueue releases') e2
/

column event format a10
select * from v$system_event 
where event = 'enqueue';


SELECT COUNT(*), SUM(time_waited), MAX(max_wait)
FROM v$session_event
WHERE event = 'enqueue'; 
