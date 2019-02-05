undefine in_sid
define in_sid=&&1

select s.sid||' ==> '||i.instance_name||'_ora_'||p.spid||'.trc' trace_file
from v$instance i, v$session s, v$process p
where s.sid=&&in_sid and
      s.paddr = p.addr;
