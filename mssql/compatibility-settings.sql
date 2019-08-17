set nocount on
use master
go

select name, compatibility_level, compatibility_setting =
case cast(compatibility_level as varchar) 
   when '150' then 'SQL Server 2019 supports 150,140,130,120,110,100'
   when '140' then 'SQL Server 2017 supports 140,130,120,110,100'
   when '130' then 'SQL Server 2016 supports 130,120,110,100'
   when '120' then 'SQL Server 2014 supports 120,110,100'
   when '110' then 'SQL Server 2012 supports 110,100,90'
   when '100' then 'SQL Server 2008 supports 100,90,80'
   when '90'  then 'SQL Server 2005 supports 90,80'
   when '80'  then 'SQL Server 2000 supports 80'
   else cast(compatibility_level as varchar)
end
from sys.databases;
go
