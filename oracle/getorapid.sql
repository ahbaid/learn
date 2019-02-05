define in_sid=&&1

select spid from v$process p, v$session s
where p.addr = s.paddr and s.sid = &&in_sid
/
