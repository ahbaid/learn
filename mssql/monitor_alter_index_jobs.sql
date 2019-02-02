use master
go

select 
   er.session_id,
   er.command,
   convert(numeric(4,2),er.percent_complete) as pct_done,
   convert(varchar(20),dateadd(ms,er.estimated_completion_time,GetDate()),20) as eta_wall_time,
   convert(numeric(10,2),er.total_elapsed_time/1000.0/60.0) as elapsed_mins,
   convert(numeric(10,2),er.estimated_completion_time/1000.0/60.0) as eta_mins,
   convert(numeric(10,2),er.estimated_completion_time/1000.0/60.0/60.0) as eta_hours,
   convert(varchar(1000), (
      select SUBSTRING(text,er.statement_start_offset/2,
         case 
            when er.statement_end_offset = -1 then 1000 
            else (er.statement_end_offset-er.statement_start_offset)/2 
         end)
      from sys.dm_exec_sql_text(sql_handle))
   )
from sys.dm_exec_requests er 
where lower(command) in ('alter index');
go


-- select er.percent_complete, * from sys.dm_exec_requests where lower(command) in ('alter index');
