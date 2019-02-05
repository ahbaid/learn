select sid, program from v$session where sid in
(select session_id
from dba_locks
where blocking_others = 'Blocking' )
/
