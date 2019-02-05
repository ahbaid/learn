define sqlstr=&&1

select s.module, s.sql_id, st.sql_text from v$session s, v$sqltext st where st.sql_id = s.sql_id and lower(st.sql_text) like '%&&sqlstr%'
/
