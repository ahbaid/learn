column hpname format a50 heading "Name"
column hpdesc format a80 heading "Description"
column sesm format A4 heading "SesM"
column sysm format A4 heading "SysM"
column sval format A20 heading "SesV"
column ival format A20 heading "InsV"

set lines 200
set pages 100

define in_desc=&&1

select t1.ksppinm as hpname, 
       t1.KSPPDESC as hpdesc,
       decode(bitand(t1.ksppiflg/256,1),1,'1','0') as sesm,
       decode(bitand(t1.ksppiflg/65536,3),1,'IMM',2,'DEF',3,'IMM','0') as sysm,
       t2.ksppstvl as sval,
       t3.ksppstvl as ival
from x$ksppi t1,
     x$ksppcv t2,
     x$ksppsv t3
where translate(ksppinm,'_','#') like '#%' and lower(ksppdesc) like '%'||lower('&&in_desc')||'%' and
      t1.indx = t2.indx and
      t1.indx = t3.indx
order by 2,1;
