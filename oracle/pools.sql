clear breaks
clear columns

set lines 100
set pages 1000

column c0 format A20 word_wrapped heading "Owner"
column c1 format A12 word_wrapped heading "Pool"
column c2 format 999,999,990 word_wrapped heading "MBytes"

break on c1 skip 2
compute sum of c2 on c1 

select owner c0, 
       buffer_pool c1, 
       sum(bytes)/power(2,20) c2
from dba_segments
group by owner, buffer_pool
order by buffer_pool;

