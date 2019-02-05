select owner||'.'||index_name from dba_indexes where degree > 1
order by owner, index_name
/
