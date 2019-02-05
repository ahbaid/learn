select owner||'.'||table_name from dba_tables where degree > 1
order by owner, table_name
/
