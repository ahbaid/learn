define tspc=&&1

column c1 format A12 heading "Tablespace"
column c2 format 9999 heading "fid"
column c3 format A50 heading "File"
column c4 format 9,999,990 heading "MB"

set lines 130
set pages 1000

select tablespace_name c1,
       file_id c2,
       file_name c3 ,
       bytes/1024/1024 c4
from dba_temp_files 
order by 1,file_id
/
