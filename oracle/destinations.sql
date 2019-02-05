clear breaks
set lines 200
set pages 40

column c0 format 999 heading "Id";
column c1 format A20 word_wrapped heading "Dest Name";
column c2 format A10 word_wrapped heading "Status";
column c3 format A10 word_wrapped heading "Target";
column c4 format A30 word_wrapped heading "Destination";
column c5 format A15 word_wrapped heading "Error";

select dest_id c0, 
       dest_name c1, 
       status c2, 
       target c3, 
       destination c4, 
       error c5
from v$archive_dest
where target <> 'PRIMARY'
/
