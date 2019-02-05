column mode_held format A10
column lock_type format A12

set lines 120
set pages 1000

column lock_id1 format A12
column lock_id2 format A12

select session_id, mode_held, lock_type, lock_id1, lock_id2
from dba_locks
where blocking_others = 'Blocking'
/

select sid, type, lmode, request, 
       id1 "ID1 - Type:TM object_id", id2, block
from v$lock 
where 
      sid in (select session_id 
              from dba_locks 
              where blocking_others = 'Blocking') 
/

select sid, type, lmode, request, 
       id1 "ID1 - Type:TM object_id", id2, block
from v$lock 
where 
      sid in (select session_id 
              from dba_locks 
              where blocking_others = 'Blocking') and
      type = 'TM'
/
