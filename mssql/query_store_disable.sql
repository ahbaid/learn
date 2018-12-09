/* {{{ 
Author: 	Ahbaid Gaffoor
File:		query_store_disable.sql
Date:		Sunday Dec 9th 2018
Notes:   Source the environment variables in "mssql.env" to ensure variables are passed in
}}} */

--:setvar inDbname testdb

-- Check if query store is enabled
select name, is_query_store_on from sys.databases where name = '$(inDbname)'
go

-- Enable query store for testdb
alter database $(inDbname) set query_store=off;
go

-- Check if query store is enabled
select name, is_query_store_on from sys.databases where name = '$(inDbname)'
go
