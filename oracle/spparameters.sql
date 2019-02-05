@@dbname
column pname format A40
column pvalue format A100

set lines 150 pages 9000 feedback off verify off heading off newpage 0

column filename new_value fname noprint;
select '&&dbuname'||'_spparameters.txt' as filename from dual;

spool &&fname

select p.name as pname, p.value as pvalue 
from v$spparameter p 
--where p.value is not null
order by 1;

spool off

set feedback on verify on heading on newpage 1

prompt
prompt Review &&fname for parameter listing
prompt
