select owner, object_type, status, count(*) from dba_objects
where status <> 'VALID'
group by owner, object_type, status
order by 1,2,3
/
