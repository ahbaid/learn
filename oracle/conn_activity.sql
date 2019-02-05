column c0 format a50 word_wrapped heading "Connection"
column c1 format 999,999,990 heading "Count"

select nvl(client_info, nvl(module, program)) as c0, 
       status ,
       count(*) c1
from v$session 
group by nvl(client_info, nvl(module, program)), status
order by 1,2,3;
