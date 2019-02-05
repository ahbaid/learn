define target=&&1
define separatorpos=&&2

PROMPT
exec dbms_output.put_line('echo');
exec dbms_output.put_line('echo "Copying Log files"');
exec dbms_output.put_line('echo');

select 'scp '||member||' &&target'||substr(member,1,instr(member,'/',1,&&separatorpos))
from v$logfile;
