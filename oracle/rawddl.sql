set feedback off verify off heading off newpage 0

define owner=&&1
define otype=&&2
define oname=&&3

column noname new_value fname noprint;
select substr(lower('&&otype'),1,1)||'_'||lower('&&oname')||'.raw' as noname from dual;

prompt Dumping &&owner..&&otype..&&oname to &&fname

set termout off
spool &&fname
@@getddl &&owner &&otype &&oname
spool off
set termout on
