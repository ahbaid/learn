clear columns
clear breaks
set lines 120
set pages 5000

define in_tablespace=&&1
define in_order=&&2
set verify off


column c0 format A25 word_wrapped heading "TABLESPACE"
column c1 format 9999 heading "FID"
column c2 format A50 heading "FILENAME"
column c3 format 999,999,999 heading "Used|MBytes"
column c4 format 999,999,999 heading "Avail|MBytes"

break on report
compute sum of c3 on report
compute sum of c4 on report

spool dfusage.log

select df.tablespace_name c0, 
       df.file_id c1, 
       df.file_name c2, 
       sum (de.bytes)/power(2,20) c3,
       sum (df.bytes)/power(2,20) c4
from dba_extents de, dba_data_files df
where de.file_id(+) = df.file_id and
      df.tablespace_name = upper('&&in_tablespace')
group by df.tablespace_name, df.file_id, df.file_name
order by &&in_order
/

spool off;
set verify on
