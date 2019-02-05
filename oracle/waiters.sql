set lines 132
set pages 1000

spool waiters.lst

column c1 format a15 heading "Waiting"
column c2 format a10 heading "OS User"
column c3 format a4  heading "SID"
column c4 format a10 heading "Unix Pid"

column c5 format a15 heading "Blocking"
column c6 format a10 heading "OS User"
column c7 format a4  heading "SID"
column c8 format a10 heading "Unix Pid"

with lockqry as (select * from dba_locks)
SELECT s1.username c1,
       s1.osuser c2,
       substr(to_char(w.session_id),1,5) c3,
       P1.spid c4,
       s2.username c5,
       s2.osuser c6,
       substr(to_char(h.session_id),1,5) c7,
       P2.spid c8
FROM   sys.v_$process P1,   sys.v_$process P2,
       sys.v_$session S1,   sys.v_$session S2,
       lockqry w,     lockqry h
WHERE  h.mode_held       != 'None'
AND    h.mode_held       != 'Null'
AND    w.mode_requested  != 'None'
AND    w.lock_type (+)    = h.lock_type
AND    w.lock_id1  (+)    = h.lock_id1
AND    w.lock_id2  (+)    = h.lock_id2
AND    w.session_id       = S1.sid  (+)
AND    h.session_id       = S2.sid  (+)
AND    S1.paddr           = P1.addr (+)
AND    S2.paddr           = P2.addr (+);

spool off
