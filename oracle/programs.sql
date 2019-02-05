clear columns
clear breaks
set lines 130
set pages 1000

column schema format A11 heading "Schema"
column ctotal format 9,999 heading "Total"
column cactive format 9,999 heading "Active"
column cinactive format 9,999 heading "Inactive"
column cothers format 9,999 heading "Others"

break on report 
compute sum of ctotal on report
compute sum of cactive on report
compute sum of cinactive on report
compute sum of cothers on  report

with session_qry as (
   select schemaname, program, status  from v$session
)
select allc.schemaname as schema,
       allc.program program,
       allc.countem ctotal,
       nvl(activec.countem,0) cactive,
       nvl(inactivec.countem,0) cinactive,
       nvl(othersc.countem,0) cothers
from
    (select schemaname, program, count(*) countem from session_qry
     group by schemaname, program, status
    ) allc,
    (select schemaname, program, count(*) countem from session_qry
     where status = 'ACTIVE'
     group by schemaname, program, status
    ) activec,
    (select schemaname, program, count(*) countem from session_qry
     where status = 'INACTIVE'
     group by schemaname, program, status
    ) inactivec,
    (select schemaname, program, count(*) countem from session_qry
    where status not in ('ACTIVE', 'INACTIVE')
    group by schemaname, program, status
    ) othersc
where allc.program = activec.program(+) and
      allc.schemaname = activec.schemaname(+) and
      allc.program = inactivec.program(+) and
      allc.schemaname = inactivec.schemaname(+) and
      allc.program = othersc.program(+) and
      allc.schemaname = othersc.schemaname(+) and
      allc.schemaname not in ('SYS','SYSTEM')
/
