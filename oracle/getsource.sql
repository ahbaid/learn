clear columns
clear breaks
set pages 10000
set lines 150

set verify off
define in_owner=&&1
define in_source_object=&&2


set termout off
column olabel new_value objectname noprint;
select '&&in_owner'||'.'||'&&in_source_object' as olabel from dual;
set termout on

column c0 format a150 heading &&objectname

select text as c0 from dba_source
where owner = upper('&&in_owner') and name = upper('&&in_source_object')
order by line;

set verify on
