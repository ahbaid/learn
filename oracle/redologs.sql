set lines 200
set pages 100
set feedback on

column c1 format 999 heading "Group"
column c2 format A10 heading "Status"
column c3 format A75 heading "Log File"
column c4 format 990 heading "Size/MB"
column c5 format A10 heading "Type"

select a.group# c1,
       a.type c5,
       b.status c2,
       a.member c3,
       b.bytes/power(2,20)  c4
from v$logfile a, v$log b
where a.group#  = b.group# ;

select a.group# c1,
       a.type c5,
       b.status c2,
       a.member c3,
       b.bytes/power(2,20)  c4
from v$logfile a, v$standby_log b
where a.group#  = b.group# ;

select type as "Types", count(distinct group#) as "Groups" from v$logfile group by type;
