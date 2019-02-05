select owner, object_type, count(*)
from dba_objects
where object_type like 'JAVA%'
group by owner, object_type
order by 1,2
/
