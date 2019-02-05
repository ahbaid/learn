select name, 100 - (round (physical_reads/(db_block_gets + consistent_gets)*100,2)) "Cache Hit Ratio"
from v$buffer_pool_statistics
/
