

define in_object=&&1

set feedback off
column tfname noprint new_value fname;
select 'hash_&&in_object'||'.lst' as tfname from dual;
set feedback on

spool &&fname

@@dbcheck

set lines 100
set pages 1000
set verify off
clear columns
clear breaks

column c0 heading "SID"
column c1 heading "SQL HASH"
column c2 format A50 word_wrapped heading "SQL"
column c3 format A15 heading "Schema"


select a.sid c0, 
       a.schemaname c3,
       b.hash_value c1, 
       b.sql_text c2
from v$session a, v$sqlarea b
where a.sql_address = b.ADDRESS and
      a.SQL_HASH_VALUE = b.HASH_VALUE and
      upper(b.sql_text) like '%'||upper('&&in_object')||'%' and substr(upper(b.sql_text),1,6) <> 'SELECT'
;

spool off

PROMPT
PROMPT ed &&fname
PROMPT

set verify on
