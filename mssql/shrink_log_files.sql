use master
go

select 'use '+ DB_NAME (database_id) + ' ; DBCC SHRINKFILE (N''' + name + ''''+', 0, TRUNCATEONLY);' FROM SYS.MASTER_FILES  WHERE DATABASE_ID > 4 AND type_desc ='LOG' and state_desc = 'ONLINE'
go
