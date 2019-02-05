set feedback off verify off
define in_sid=&&1
select blocking_session from v$session where sid=&&in_sid;
set feedback on verify on
