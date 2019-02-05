define in_tablespace=&&1
define in_unit=500

set verify off

column c0 format A70 word_wrapped heading "File"
column c1 format 999,999,990 heading "MBytes"

select file_name c0, sum(bytes)/power(2,20) c1
from dba_data_files
where tablespace_name = upper('&&in_tablespace')
having        mod ( sum(bytes)/power(2,20) , &&in_unit) <> 0
group by file_name;

set verify on
