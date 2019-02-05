select sid, type, lmode, request, id1 "ID1 - Type:TM object_id", id2, block
from v$lock
where sid in (select session_id
              from dba_locks
              where blocking_others = 'Not Blocking')
/
