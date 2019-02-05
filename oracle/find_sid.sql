--enter unix process id and find the oracle sid

select s.PADDR,s.SID,s.SERIAL#,s.USERNAME,s.OSUSER,s.PROGRAM, p.SPID 
from v$session s, v$process p 
where p.spid = &proc_unix 
and p.addr = s.paddr 
/
