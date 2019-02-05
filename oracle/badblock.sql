define in_fid=&&1
define in_blk=&&2

select segment_name, segment_type from dba_extents
where file_id = &&in_fid and &&in_blk between block_id and block_id + blocks - 1
/
