define in_user=&&1

select owner, segment_name, segment_type, sum(bytes)/power(2,20)
from dba_segments where owner = upper('&&in_user')
having (sum(bytes)/power(2,20)) > 100
group by owner, segment_name, segment_type
order by 4 asc
/
