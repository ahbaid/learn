set lines 120 pages 100
column name format a50 word_wrapped

select name, value, unit 
from v$pgastat;
