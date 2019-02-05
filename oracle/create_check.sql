select owner, object_type, to_char(created,'DD/MM/YYYY'), count(*) from dba_objects
where owner not in ('SYS','SYSTEM')
and created > sysdate - 2
group by owner, object_type, to_char(created,'DD/MM/YYYY')
/
