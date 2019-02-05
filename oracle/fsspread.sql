column fname format a30 heading "FN Prefix"
column cnt format 999,990 heading "Count"
column sz format 999,999,990 heading "Size"

select substr(file_name,1,9) fname, count(*) cnt, sum(bytes)/power(2,20) as sz
from dba_data_files
group by substr(file_name,1,9)
order by 1
/
