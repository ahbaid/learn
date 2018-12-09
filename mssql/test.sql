/* {{{ 
Author: 	Ahbaid Gaffoor
File:		test.sql
Notes:	A playground - changes often, use at your own risk
}}} */

--:setvar inDbname testdb

use $(inDbname)
go

-- Show database version
select @@version
go

-- Check if query store is enabled
select name, is_query_store_on from sys.databases where name = '$(inDbname)'
go

-- Enable query store for testdb
alter database $(inDbname) set query_store=on;
go

-- Check if query store is enabled
select name, is_query_store_on from sys.databases where name = '$(inDbname)'
go

