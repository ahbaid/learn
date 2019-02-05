set lines 130
set pages 1000

column file_name format A50 word_wrapped
column sp heading "MBytes"

select tablespace_name, 
       file_name, 
       sum(bytes)/power(2,20) sp ,
       status
from dba_temp_files
group by file_name, tablespace_name
/
