select sql_text from v$sqltext
where hash_value = &&1
order by piece
/
