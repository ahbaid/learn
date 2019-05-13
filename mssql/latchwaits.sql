set nocount on
use master
go

select latch_class, waiting_requests_count, wait_time_ms, max_wait_time_ms 
from sys.dm_os_latch_stats 
order by 2 asc;
go
