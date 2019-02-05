set pages 1000
set lines 100

column c0 format A10 heading "STATUS"
column c1 format A10 heading "OS"
column c9 format A50 heading "Machine"
column c10 format A12 heading "Schema"
column c11 format 9999 heading "Count"

select ses.status,
       ses.osuser c1,
       ses.machine c9,
       ses.schemaname c10,
       count(*)
from v$session ses, v$process prc
where ses.paddr = prc.addr
group by ses.status, ses.osuser, ses.machine, ses.schemaname
order by ses.status, count(*) desc
/
