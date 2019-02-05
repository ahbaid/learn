select ses.osuser c1,
       ses.sid c2,
       ses.serial# c3,
       ses.status c4,
       ses.lockwait c5,
       ses.server c6,
       prc.spid c7,
       ses.sql_hash_value c8,
       ses.machine c9,
       ses.schemaname c10,
       ses.logon_time
from v$session ses, v$process prc
where ses.paddr = prc.addr and ses.schemaname = 'OPC_OP'
order by ses.logon_time, ses.sid
/
