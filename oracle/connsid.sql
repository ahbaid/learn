define in_connection=&&1

column c0 format a30 heading "Connection"

select nvl(client_info, nvl(module, program)) as c0, machine, status, sid from v$session
where nvl(client_info, nvl(module, program)) like '%&&in_connection%'
order by machine, status
/
