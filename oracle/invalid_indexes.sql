define in_owner=&&1

select owner, index_name, decode(table_owner,owner,table_name, table_owner||'.'||table_name) as table_name, status from dba_indexes
where status <> 'VALID' and
      owner like upper('%&&in_owner%')
order by owner, index_name;
