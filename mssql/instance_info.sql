set nocount on
use master
go

print ''
SELECT  
  CONNECTIONPROPERTY('local_net_address') AS ServerIP,
  SERVERPROPERTY('MachineName') AS ComputerName,
  SERVERPROPERTY('ServerName') AS InstanceName,  
  SERVERPROPERTY('Edition') AS Edition,
  SERVERPROPERTY('ProductVersion') AS ProductVersion,  
  SERVERPROPERTY('ProductLevel') AS ProductLevel;  
go

select @@version;
go
