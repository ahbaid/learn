PROMPT Summary of events since instance startup
PROMPT
SELECT event, total_waits waits, total_timeouts timeouts,
       time_waited total_time, average_wait avg
  FROM V$SYSTEM_EVENT
  ORDER BY 4 DESC
/


PROMPT
PROMPT Summary of buffer waits since instance startup
PROMPT

select * from v$waitstat;
