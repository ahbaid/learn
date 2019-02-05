define in_mod=&&1
select sid, module, sql_id, blocking_session from v$session where module like '%&&in_mod%'
/
