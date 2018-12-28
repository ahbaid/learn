set nocount on
select schema_id, type_desc, count(*) 
from sys.objects 
group by schema_id, type_desc order by schema_id asc, type_desc asc;
go
