clear columns
clear breaks
set lines 120
set pages 5000

define in_order=&&1
set verify off


spool fileusage.log

column c0 format A25 word_wrapped heading "TABLESPACE"
column c1 format 9999 heading "FID"
column c2 format A50 heading "FILENAME"
column c3 format 999,999,999 heading "Used|MBytes"
column c4 format 999,999,999 heading "Avail|MBytes"

spool fileusage.log

select df.tablespace_name c0, 
       df.file_id c1, 
       df.file_name c2, 
       sum (de.bytes)/power(2,20) c3,
       sum (df.bytes)/power(2,20) c4
from dba_extents de, dba_data_files df
where de.file_id(+) = df.file_id
group by df.tablespace_name, df.file_id, df.file_name
order by &&in_order
/

spool off;
set verify on
