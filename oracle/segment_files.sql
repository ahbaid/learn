define in_segment_name=&&1

clear columns
clear breaks

set lines 130
set pages 1000

column c0 format 99999 heading "File"
column c1 format A50 word_wrapped heading "File Name"
column c2 format 999,999,990 heading "File Used|MBytes"
column c3 format 999,999,990 heading "File Size|MBytes"

set verify off

select a.file_id c0, 
       b.file_name c1, 
       sum(a.bytes)/power(2,20) c2, 
       b.bytes/power(2,20) c3
from dba_extents a, dba_data_files b
where a.file_id = b.file_id and
      a.segment_name = upper('&&in_segment_name')
group by a.file_id, b.file_name, b.bytes/power(2,20);

set verify on
