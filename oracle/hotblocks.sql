set verify off
define in_min_touchcount=&&1

column c0 format A12 heading "Address"
column c1 format 999999999999 heading "Object"
column c2 format 99999 heading "File#"
column c3 format 999999999999 heading "Block"
column c4 format 999,999,999 heading "Count"
column c5 format 999,999,999 heading "Total Touch"

select hladdr c0, 
       obj c1, 
       file# c2, 
       dbablk c3, 
       count(*) c4, 
       sum(tch) c5
from x$bh
group by hladdr, obj, file#, dbablk
having sum(tch) >= &&in_min_touchcount
order by  sum(tch);

set verify on
