select module, count(*) from v$session
group by module
order by 2 asc, 1 desc
/
