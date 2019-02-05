define in_owner=&&1
select trigger_name, status from dba_triggers where owner = upper('&&in_owner')
/
