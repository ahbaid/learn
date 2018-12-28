-- works in MSSQL 2012 and higher
set nocount on
use master
go
select value_name, value_data from sys.dm_server_registry 
where registry_key like '%IPAll' and value_name = 'TcpDynamicPorts';
go
