-- MSSQL 2012 and higher only
set nocount on
use master
go
select port from sys.dm_tcp_listener_states where is_ipv4 = 1 and listener_id = 2;
go
