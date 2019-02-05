set verify off
define in_block_id=&&1
column segment_name format A30

select tablespace_name, segment_name, segment_type, extent_id 
from dba_extents where block_id = &&in_block_id;
set verify on
