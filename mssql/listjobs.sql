use msdb
go

select 
   suser_sname(owner_sid) as owner, 
   name, 
   enabled, 
   cast(date_created as varchar) as date_created,
   cast(date_modified as varchar) as date_modified,
   description i
from msdb.sysjobs 
order by 2,1;
