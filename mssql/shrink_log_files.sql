use master
go

select 'use '+ db_name(database_id) + '; dbcc shrinkfile (N''' + name + ''''+', 0, TRUNCATEONLY);' 
from sys.master_files  
where database_id > 4 and type_desc ='LOG' and state_desc = 'ONLINE'
go
