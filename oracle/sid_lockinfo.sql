define in_sid=&&1

select ksqsttyp, ksqstreq, ksqstwat, sid
from v$lock a, x$ksqst b
where a.sid = &&in_sid and
      a.kaddr = b.addr 
/
