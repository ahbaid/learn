set nocount on
select type_desc, count(*) from sys.objects group by type_desc order by type_desc asc;
go
