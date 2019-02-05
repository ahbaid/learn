--
-- SYS.AUD$ table
--
select initial_extent, next_extent, min_extents, max_extents, pct_increase
from dba_tables where owner = 'SYS' and table_name = 'AUD$';
select count(*) from dba_extents where owner = 'SYS' and segment_name = 'AUD$';

--
-- SYS.I_AUD1
--
select initial_extent, next_extent, min_extents, max_extents, pct_increase
from dba_indexes where owner = 'SYS' and index_name = 'I_AUD1';
select count(*) from dba_extents where owner = 'SYS' and segment_name = 'I_AUD1';
