set long 5000
set lines 100
set pages 1000

define in_session_id=&&1

column c1 format A80 wrapped heading "SQL for Session &&in_session_id"

select sql_text c1
from v$session, v$sqltext
where sql_address=address
and sid=&&in_session_id
order by piece;
