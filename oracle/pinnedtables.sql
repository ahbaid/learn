clear breaks

set pages 1000
set lines 100

column c0 format A15 word_wrapped heading "Owner"
column c1 format A30 word_wrapped heading "Table"
column c2 format A15 word_wrapped heading "Pool"
column c3 format 999,990.00 heading "MBytes"

break on c2 skip 1 on report skip 1
compute sum of c3 on c2 
compute sum of c3 on report

select a.buffer_pool c2,
       a.owner c0, 
       a.table_name c1, 
       sum(b.bytes)/power(2,20) c3
from dba_tables a,
     dba_segments b
where a.buffer_pool <> 'DEFAULT'  and
      a.owner = b.owner and
      a.table_name = b.segment_name and
      b.segment_type = 'TABLE'
group by a.owner, a.table_name, a.buffer_pool
order by c2;

show parameter db_recycle_cache_size

show parameter db_keep_cache_size

