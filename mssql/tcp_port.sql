-- MSSQL 2012 and higher only
-- https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-tcp-listener-states-transact-sql?view=sql-server-2017
set nocount on
use master
go
select port from sys.dm_tcp_listener_states where is_ipv4 = 1 and listener_id = 2;
go
