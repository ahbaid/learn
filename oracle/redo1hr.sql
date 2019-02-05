SELECT MAX(mb) FROM (
  SELECT
    SUM(blocks * block_size) OVER (ORDER BY first_time RANGE NUMTODSINTERVAL(1, 'HOUR') PRECEDING)/1024/1024 AS mb
  FROM v$archived_log
  WHERE creator='ARCH');
