column lock_id1 format A12
column lock_id2 format A12

select session_id, mode_held, lock_type, lock_id1, lock_id2
from dba_locks
where blocking_others = 'Blocking';

