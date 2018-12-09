/* {{{ 
Author: 	Ahbaid Gaffoor
File:		enable_query_store.sql
Date:		Sunday Dec 9th 2018
}}} */

:setvar in-dbname testdb

use $(in-dbname)
go

-- Show database version
select @@version
go

-- Check if query store is enabled
select name, is_query_store_on from sys.databases where name = '$(in-dbname)'
go

-- Enable query store for testdb
alter database $(in-dbname) set query_store=off;
go

-- Check if query store is enabled
select name, is_query_store_on from sys.databases where name = '$(in-dbname)'
go

