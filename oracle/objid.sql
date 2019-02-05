set verify off

define in_objid=&&1

set lines 120

column obj format A120 heading "Object"

select '['||object_id||'] '||object_type||' --> '||owner||'.'||object_name||
decode(subobject_name,null,null,'['||subobject_name||']')
as obj
from dba_objects
where object_id = &&in_objid;

set verify off
