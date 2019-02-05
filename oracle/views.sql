set verify off
set pages 200
set lines 300

define in_owner=&&1
define in_order=&&2

column c0 format a30 heading "View"
column c1 heading "Created"

select dv.view_name c0,
       do.created c1
from dba_views dv, dba_objects do
where dv.owner = upper('&&in_owner') and
      do.owner = dv.owner and dv.view_name = do.object_name and do.object_type = 'VIEW'
order by &&in_order;
