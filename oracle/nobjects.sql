define in_owner=&&1

select object_type, count(object_type) from dba_objects
where owner = upper('&&in_owner')
group by object_type
order by 1
/
