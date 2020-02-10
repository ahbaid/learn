restore database AdventureWorks from disk = '/tmp/AdventureWorks2017.bak' 
with recovery,
move 'AdventureWorks2017' to '/var/opt/mssql/data/adventureworks.mdf',
move 'AdventureWorks2017_log' to '/var/opt/mssql/data/adventureworks.ldf'
;
go
