-- Author:		Ahbaid Gaffoor
-- File:		avgarch.sql
-- Use:		

SELECT MAX(gb), AVG(gb)
FROM (SELECT first_time,         
             SUM(blocks*block_size)
                 OVER (ORDER BY first_time 
                       RANGE NUMTODSINTERVAL(1, 'DAY') PRECEDING)/1024/1024/1024 AS gb,
             MIN(first_time) 
                 OVER (ORDER BY first_time 
                       RANGE NUMTODSINTERVAL(1, 'DAY') PRECEDING) prev_day
       FROM v$archived_log
       WHERE creator='ARCH')
WHERE 24*(first_time-prev_day) > 23.5;
