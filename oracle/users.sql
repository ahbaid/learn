set lines 152
set pages 100

column account_status format A12 heading "Status"
column username format A20 heading "User"

select username, account_status, profile, default_tablespace, temporary_tablespace 
from dba_users 
where substr(username,length(username)-2) <> '_RO' 
-- and username not like ('%_DBA')
order by username desc
/
