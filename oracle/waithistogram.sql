column barg format a120

SELECT wait_time_milli,
             100*ratio_to_report(wait_count) over () pct,
              rpad(' ', trunc(100*ratio_to_report(wait_count) over ())+1, '#') barg
FROM v$event_histogram
WHERE event = 'log file sync'
ORDER BY wait_time_milli
/
