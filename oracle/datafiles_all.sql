clear columns
clear breaks

define in_ordering=&&1

column c0 format A18 heading "Tablespace" word_wrapped
column c1 format 999,990 heading "MB"
column c2 format 999,999,999,990 heading "Average|Reads/writes"
column c3 format A50 heading "File"
column c4 format 999,999,999,990 heading "Physical|Reads"
column c5 format 999,999,999,990 heading "Physical|Writes"
column c6 format 999,999,999,990 heading "Avg IO|Time"

column ctitle format A100 heading "Machine/DB"
select host_name||' / '||instance_name as ctitle from v$instance;

break on c0 skip 2 nodup
break on report
compute sum of c1 on report 

set lines 160
set pages 1000

select tablespace_name c0,
       bytes/power(2,20) c1, 
       (phyrds+phywrts)/2 c2,
       file_name c3,
       phyrds c4,
       phywrts c5,
       avgiotim c6
from dba_data_files fn, v$filestat fs
where fn.file_id = fs.file#
order by &&in_ordering
/
