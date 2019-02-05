select type_name from dba_types where owner = upper('&&schema')
order by 1
/
