set nocount on
select name, create_date, modify_date from sys.objects as t where t.type_desc = 'USER_TABLE' order by 1 asc;
go
