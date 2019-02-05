column name format a45
column value format 999,999,999,999,999,999,990

select name, value from v$sysstat where lower(name) like '%redo%';
