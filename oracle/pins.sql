 SELECT s.sid, kglpnmod "Mode", kglpnreq "Req", SPID "OS Process"
FROM v$session_wait w, x$kglpn p, v$session s ,v$process o
WHERE p.kglpnuse=s.saddr
AND kglpnhdl=w.p1raw
and w.event like '%library cache pin%'
and s.paddr=o.addr
/
