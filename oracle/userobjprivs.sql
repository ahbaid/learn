set lines 120
set pages 1000

clear columns
clear breaks

define in_user=&&1
set verify off

column c0 format a15 word_wrapped heading "Owner"
column c1 format a30 heading "Object"
column c2 format a30 heading "Type"
column c3 format a30 heading "Privilege [Y if Grantable]"

select a.owner c0,
       a.table_name c1,
       b.object_type c2,
       a.privilege||decode(a.grantable,'NO',null,' [Y]') c3
from dba_tab_privs a, dba_objects b
where a.grantee = upper('&&in_user') and
      b.owner = a.owner and
      b.object_name = a.table_name and
      b.object_type <> 'PACKAGE BODY'
order by 1,3,2; 

set verify on
