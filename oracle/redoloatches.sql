column ln format a20

select ln.name ln, gets, misses, immediate_gets, immediate_misses
from v$latch l, v$latchname ln
where ln.name like 'redo%' and
      ln.latch# = l.latch#
/
