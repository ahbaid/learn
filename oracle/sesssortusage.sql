clear columns
clear breaks

set verify off
define in_memory=&&1

column c0 format A10 heading "User"
column c6 format A40 heading "Machine"

SELECT su.username c0, 
       s.sid, 
       extents,
       blocks,
       blocks*8192/power(2,20) "MB", 
       s.status,
       s.machine c6
FROM V$SORT_USAGE su, v$session s
where s.saddr = su.session_addr and
      blocks*8192/power(2,20) > &&in_memory
order by extents, blocks;

set verify on
