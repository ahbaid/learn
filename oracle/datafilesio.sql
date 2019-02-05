clear columns
clear breaks

define in_ordering=&&1

column c2 format 999,999,999,990 heading "Average|Reads/writes"
column c3 format A50 heading "File"

column ctitle format A100 heading "Machine/DB"
select host_name||' / '||instance_name as ctitle from v$instance;

set lines 100
set pages 1000

select (phyrds+phywrts)/2 c2,
       file_name c3
from dba_data_files fn, v$filestat fs
where fn.file_id = fs.file#
order by &&in_ordering
/
