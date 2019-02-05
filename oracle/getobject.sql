set lines 100
set pages 100

set verify off

define in_object_id=&&1

column obj format a100 heading "Object"

select object_type||' --> '||owner||'.'||object_name as obj
from dba_objects
where object_id = &&in_object_id;

set verify on
