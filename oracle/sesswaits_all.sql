clear columns
clear breaks
set lines 200
set pages 1000

column c0 format A20 word_wrapped heading "Event"

column c1t format A10 word_wrapped heading "P1 Text" justify left
column c1 format 999999999999999 word_wrapped heading "Value" justify left

column c2t format A10 word_wrapped heading "P2 Text" justify left
column c2 format 999999999999999 word_wrapped heading "Value" justify left

column c3t format A10 word_wrapped heading "P3 Text" justify left
column c3 format 999999999999999 word_wrapped heading "Value" justify left

column c4 format 999,999,990 heading "Wait Time"
column c5 format 999,999,990 heading "Sec in wait"

column c6 format A10 word_wrapped heading "State"

select sid,
       event c0, 
       p1text c1t, p1 c1, 
       p2text c2t, p2 c2, 
       p3text c3t, p3 c3, 
       wait_time c4, 
       seconds_in_wait c5, 
       state c6
from v$session_wait 
where event not like 'SQL%Net%'
order by p1text, p2text, p3text;
