clear columns
clear breaks

set verify off
define in_synonym_name=&&1

select rpad(owner||'.'||synonym_name||' --> ',60,' ')||table_owner||'.'||table_name as syn
from dba_synonyms
where synonym_name like '%'||upper('&&in_synonym_name')||'%'
order by owner,synonym_name,table_owner,table_name;

set verify on
