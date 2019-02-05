set verify off

define in_session_id=&&1

clear columns
clear breaks

set pages 1000
set lines 100


column c0 format A15 heading "Type" word_wrapped
column c1 format A15 heading "Held" word_wrapped
column c2 format A15 heading "Requested" word_wrapped
column c3 format A15 heading "Block" 

select lock_type c0,
       mode_held c1, 
       mode_requested c2, 
       blocking_others c3
from dba_locks 
where session_id = &&in_session_id;
