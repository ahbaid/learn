clear breaks
clear columns

column c0 format A30 heading "File System"
column c1 format A18 heading "Tablespace" 
column c2 format 999,990 heading "MB"
column c3 format A50 heading "File"

column ctitle format A100 heading "Machine/DB"
select host_name||' / '||instance_name as ctitle from v$instance;

break on report skip 2
break on c0 skip 1 nodup
compute sum of c2 on c0 
compute sum of c2 on report

set lines 140
set pages 1000

select substr(file_name,1,instr(file_name,'/',1,4)-1) c0,
       tablespace_name c1,
       bytes/power(2,20) c2, 
       file_name c3 
from dba_data_files 
order by c0,file_id
/
