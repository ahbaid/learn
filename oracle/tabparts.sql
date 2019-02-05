define schema=&&1
define table_name=&&2

column c2 format 999,999,999,999

select dtp.partition_name, 
       dtp.tablespace_name, 
       sum(ds.bytes)/power(2,20) c2
from dba_tab_partitions dtp, dba_segments ds
where table_owner = upper('&&schema') and table_name = upper('&&table_name') and
      dtp.table_owner = ds.owner and
      dtp.table_name = ds.segment_name and
      dtp.partition_name = ds.partition_name
group by dtp.partition_name, dtp.tablespace_name
order by 1,2
/
