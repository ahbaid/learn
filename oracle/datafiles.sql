define tspc=&&1

column c1 format 9,999,990 heading "MB"
column c2 format A70 heading "File"

set lines 130
set pages 1000

select bytes/1024/1024 c1, 
       file_name c2 
from dba_data_files 
where tablespace_name = upper('&&1')
order by file_id
/
