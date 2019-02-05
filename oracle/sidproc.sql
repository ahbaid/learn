set feedback off verify off heading off newpage 0
define in_sid=&&1
select '!kill -9 '||p.spid from v$session s, v$process p where s.paddr = p.addr and s.sid = &&in_sid;
set feedback on verify on heading on newpage 1
