set lines 110
set pages 10000
spool version_options

select banner from v$version

column parameter format A50 heading "Parameter"
column value format A50 heading "value"
select parameter, value from v$option;

spool off
