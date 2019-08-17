restore database AdventureWorksDW from disk = '/tmp/AdventureWorksDW2017.bak'
with recovery,
move 'AdventureWorksDW2017' to '/var/opt/mssql/data/adventureworksDW.mdf',
move 'AdventureWorksDW2017_log' to '/var/opt/mssql/data/adventureworksDW.ldf'
;
go
