PROMPT
exec dbms_output.put_line('echo');
exec dbms_output.put_line('echo "Copying Control files"');
exec dbms_output.put_line('echo');

select 'scp '||name||' &&1'||substr(name,1,instr(name,'/',1,&&2))
from v$controlfile;
