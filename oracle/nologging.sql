select owner||'.'||table_name from dba_tables where logging = 'NO'
order by owner, table_name
/
