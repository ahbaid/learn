select unique substr(name,1,instr(name,'/',1,4))  as filedir
from v$controlfile
union
select unique substr(name,1,instr(name,'/',1,4))  as filedir
from v$datafile
union
select unique substr(member,1,instr(member,'/',1,4)) as filedir
from v$logfile
;

