with lockqry as (
select * from dba_locks )
select a.session_id
from lockqry a, lockqry b
where
   b.session_id = &&in_block_sid and
    b.lock_id1 = a.lock_id1 and
   b.lock_id2 = a.lock_id2 and
   b.lock_type = a.lock_type and
   b.blocking_others = 'Blocking'
/
