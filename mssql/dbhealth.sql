/* {{{ 
Author: 	Ahbaid Gaffoor
File:		dbhealth.sql
Date:		Sunday Dec 9th 2018
}}} */

set nocount on

use master
select @@version
go

select name, is_query_store_on from sys.databases;
go

select program_name as "Programs Connected", count(*) from sys.sysprocesses group by program_name order by 2 asc;
go

select hostname as "Hosts Connected", count(*) from sys.sysprocesses group by hostname order by 2 asc;
go

select coalesce(hostname,"NULL")  as "Hosts Connected", count(*) from sys.sysprocesses group by coalesce(hostname,"NULL") order by 2 asc;
go
