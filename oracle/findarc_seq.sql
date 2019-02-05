define in_seq=&&1

column name format a100
set lines 120
set verify off

select sequence#, name from v$archived_log where &&in_seq = sequence#
/

set verify on
