set verify off
define tname=&&1
select queue_name from search_propagation_queues where table_name = upper('&&tname') and error_id <> 0 order by 1;
set verify on
