column mode_held format A10
column lock_type format A12

set lines 100
set pages 1000

column lock_id1 format A12
column lock_id2 format A12

set feedback off
set verify off
set heading off
set termout off


spool $SQL/blockersids.sqg
select unique '@$SQL/sidsql '||session_id
from dba_locks
where blocking_others = 'Blocking';
spool off

set termout on
set feedback on
set verify on
set heading on

@$SQL/blockersids.sqg
