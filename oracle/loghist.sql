select sequence#, 
       first_time, 
       first_time-7/24 
from v$loghist
where first_time > sysdate-1
order by 1
/
