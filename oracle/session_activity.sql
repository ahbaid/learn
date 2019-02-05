clear columns
clear breaks

break on report 

column machine format A50
column active format 9999
column inactive format 9999
column total format 999999

compute sum of active on report;
compute sum of inactive on report;
compute sum of total on report;

select to_char(sysdate,'Day mm/dd/yyyy hh24:mi:ss') as "Check Time" from dual;

select m.machine as machine, 
       nvl(a.acount,0) as active, 
       nvl(b.icount,0) as inactive,
       nvl(a.acount,0) + nvl(b.icount,0) as total
from (select s1.machine as machine, count(*) as acount
      from v$session s1
      where s1.status = 'ACTIVE'
      group by machine) a,
     (select s2.machine as machine, count(*) as icount
      from v$session s2
      where s2.status = 'INACTIVE'
      group by machine) b,
     (select unique machine as machine from v$session) m
where m.machine = a.machine(+) and
      m.machine = b.machine(+) and
      m.machine is not null
/
