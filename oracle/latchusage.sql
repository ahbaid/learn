select total_latches, used_latches
  from (select count(1) total_latches
          from v$latch_children
         where name like 'cache buffers lru chain') t,
       (select count(1) used_latches
          from v$latch_children
         where name like 'cache buffers lru chain'
           and gets <> (select min(gets)
                          from v$latch_children
                         where name like 'cache buffers lru chain'));
