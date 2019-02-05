set verify off

clear columns
clear breaks

define in_tspc_name=&&1
define in_order_by=&&2

column c0 format 9999 heading "File"
column c1 format A50 word_wrapped heading "File Name"
column c2 format 999,999,990 heading "Used|Mbytes"
column c3 format 999,999,990 heading "Size|Mbytes"

select a.file_id c0, 
       b.file_name c1, 
       sum(a.bytes)/power(2,20) c2,
       b.bytes/power(2,20) c3
from dba_extents a, dba_data_files b
where a.tablespace_name = upper('&&in_tspc_name') and
      b.file_id = a.file_id
group by a.file_id, b.file_name, b.bytes/power(2,20)
order by &&in_order_by;

set verify on
