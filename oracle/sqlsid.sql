set lines 120
set pages 100

column c0 format 9999 heading "SID"
column c1 format A100 word_wrapped heading "SQL Text"

select a.sid c0, 
       b.sql_text c1
from v$session a, v$sqltext b
where a.SQL_ADDRESS = b.ADDRESS and a.SQL_HASH_VALUE = b.HASH_VALUE
and b.sql_text like '%GSD_HANDLER%'
;
