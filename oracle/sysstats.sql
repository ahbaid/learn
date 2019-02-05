set lines 150

define in_name=&&1

set lines 150

column name format a120

select name, value from v$sysstat
where lower(name) like '%&&in_name%'
order by value;
