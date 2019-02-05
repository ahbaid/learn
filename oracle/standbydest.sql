clear columns
clear breaks
set lines 120
set pages 1000

column dest_name format A20 word_wrapped heading "Name"
column destination format A30 word_wrapped heading "Destination"

select dest_id, dest_name, destination, status, target
from v$archive_dest
where target = 'STANDBY'
/
