define in_module=&&1
select p.spid||':'||module as "kill_modules" from v$session s, v$process p where s.paddr = p.addr and lower(s.module) like lower('%&&in_module%') order by module,sid
/
