set lines 132
set pages 1000

clear columns
clear breaks

column c0 format A15 heading "Owner" word_wrapped
column c1 format A30 heading "Name" word_wrapped
column c2 format A25 heading "Type"
column c3 format A25 heading "Created" 
column c4 format A25 heading "Modified" 
column c5 format A15 heading "Status" 

define in_object_name=&&1

select owner c0,
       object_name c1,
       object_type c2,
       to_char(created,'MM/DD/YYYY HH24:MI:SS') c3,
       to_char(last_ddl_time,'MM/DD/YYYY HH24:MI:SS') c4,
       status c5,
       object_id
from dba_objects
where object_name = upper('&&in_object_name')
order by c0,c2,c1
/
