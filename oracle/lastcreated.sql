clear columns
clear breaks
set verify off

define in_range=&&1

set pages 1000
set lines 100

column owner format A12
column object_name format A30

select owner, object_name, object_type, created from dba_objects
where created > sysdate - &&in_range
order by created
/
