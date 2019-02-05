define in_scn=&&1
column first_change# format 99999999999999999999
column next_change# format 99999999999999999999
set pages 130

select recid, stamp, sequence#, first_change#, next_change#
from v$log_history where &&in_scn between first_change# and next_change#;
