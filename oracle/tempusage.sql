set pages 100
select file_id,  tablespace_name,
   sum(bytes_used/power(2,20)) mb_used,
   sum(bytes_free/power(2,20)) mb_free
from v$temp_space_header
group by rollup(tablespace_name, file_id)
order by 2
/
