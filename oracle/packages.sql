set verify off

define in_owner=&&1

column object_name format a30
column object_type format a30

select object_name, object_type
from dba_objects
where owner = upper('&&in_owner') and object_type like 'PACKAGE%'
order by 1;
