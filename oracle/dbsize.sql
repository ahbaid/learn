clear columns
clear breaks

column c0 format 999,990 heading "Total/MB"
column c1 format 999,990 heading "Data/MB"
column c2 format 999,990 heading "Temp/MB"
column c3 format 999,990 heading "Redo/MB"

select (df.data_size + ts.temp_size + ls.log_size)/power(2,20) c0,
       df.data_size/power(2,20) c1,
       ts.temp_size/power(2,20) c2,
       ls.log_size/power(2,20) c3
from (select sum(bytes) as data_size from dba_data_files) df,
     (select sum(bytes) as temp_size from dba_temp_files) ts,
     (select sum(bytes) as log_size from v$log) ls
/
