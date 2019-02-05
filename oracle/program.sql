define in_program=&&1

set pages 200
set lines 250

column c0 format 9999 heading "SID"
column c1 format A60 word_wrapped heading "Machine"
column c2 format A60 word_wrapped heading "Program"
column c3 format A12 word_wrapped heading "Schema"

select sid c0,
       schemaname c3,
       machine c1,
       program c2
from v$session 
where program like '%'||'&&in_program'||'%' and
      serial# > 1
order by 3,1;
