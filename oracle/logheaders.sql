column pool format a25
column name format a25
column bytes format 999,999,999,999,990

select pool, name, bytes from v$sgastat where name = 'log_buffer';
