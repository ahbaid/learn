define in_username=&&1

select username,default_tablespace,temporary_tablespace from dba_users
where username = upper('&&in_username')
/
