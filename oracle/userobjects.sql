set verify off

column a format a30 heading "Type"
column b format a30 heading "Name"

define in_object_owner=&&1

select object_type a, object_name b
from dba_objects
where owner = upper('&&in_object_owner') and object_type not in ('TABLE PARTITION','INDEX PARTITION')
order by 1,2;

set verify on
