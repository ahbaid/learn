column ln format a20 heading "Latch"
column mgr format 90.0 heading "Miss %"
column imgr format 90.0 heading "IMiss %"

select ln.name ln, 
       gets, misses, misses/gets*100 mgr,
       immediate_gets, immediate_misses,
       immediate_gets/decode((immediate_gets + immediate_misses),0,1,(immediate_gets+immediate_misses))*100 imgr
from v$latch l, v$latchname ln
where ln.name like 'redo%' and 
      ln.latch# = l.latch#;
