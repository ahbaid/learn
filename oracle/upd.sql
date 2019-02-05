select ses.osuser c1,
       ses.sid c2,
       ses.serial# c3,
       ses.status c4,
       ses.machine c9,
       ses.schemaname c10
from v$session ses, v$process prc
where ses.paddr = prc.addr
order by ses.schemaname
/
