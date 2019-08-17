select database_id, name, physical_database_name, compatibility_level, state, state_desc from sys.databases;
go

alter database AdventureWorks set compatibility_level = 150;
go

select database_id, name, physical_database_name, compatibility_level, state, state_desc from sys.databases;
go
