set verify off

define in_owner=&&1
select object_type, count(*) from dba_objects
where owner = upper('&&in_owner')
group by object_type;
