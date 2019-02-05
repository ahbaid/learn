Col object_name format a30
Col object_type format a20

SELECT o.owner, object_name, object_type, COUNT(*) buffers
FROM SYS.x$bh, dba_objects o
WHERE tch > 10 AND 
      lru_flag = 8 AND 
      obj = o.object_id AND 
      o.owner not in ('SYSTEM','SYS')
GROUP BY o.owner, object_name, object_type
ORDER BY buffers;
