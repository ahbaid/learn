select 'alter user '||username||' identified by mangocomputer1ncforever;'||chr(10)||
       'alter user '||username||' password expire;'
from dba_users
where substr(username,1,2) <> 'P_' and account_status = 'EXPIRED'
order by username desc
/
