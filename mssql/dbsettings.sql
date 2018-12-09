/* {{{ 
Author: 	Ahbaid Gaffoor
File:		dbsettings.sql
Date:		Sunday Dec 9th 2018
}}} */
use master
go

-- Show database version
select @@version
go

-- Check if query store is enabled
select name, is_query_store_on from sys.databases
go
