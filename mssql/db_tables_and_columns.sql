set nocount on

select 
   t.name as table_Name,
   c.name as column_Name,
   p.name as data_type,
   p.max_length as size,
   cast(p.precision as varchar) + '/' + Cast(p.scale as varchar) as precision_scale
from   
   sys.objects as t join 
   sys.columns as c on t.object_id = C.object_id join 
   sys.types as p on c.system_type_id = p.system_type_id
where 
   t.type_desc = 'USER_TABLE'
order by t.name asc;

go
