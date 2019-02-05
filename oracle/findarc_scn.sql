define in_scn=&&1

column name format a100
set lines 120
set verify off

select sequence#, name from v$archived_log where &&in_scn
between first_change# and next_change#
/

set verify on
