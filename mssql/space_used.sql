use master
go

select 
   Name, 
   file_id, 
   physical_name,
   (size * 8.0/1024) as Size,
   ((size * 8.0/1024) - (FILEPROPERTY(name, 'SpaceUsed') * 8.0/1024)) As FreeSpace
from sys.database_files;
go
