define in_connection=&&1

clear breaks

column c0 format a30 heading "Connection"
column c heading "Count(*)"

compute sum of c on report
break on report


select nvl(client_info, nvl(module, program)) as c0, machine, status, count(*) as c from v$session
where nvl(client_info, nvl(module, program)) like '%&&in_connection%'
group by nvl(client_info, nvl(module, program)), machine, status
order by machine, status
/
