set pages 1000

select substr(table_name,7) "STATS$_TABLES" from dba_tables
where owner = 'PERFSTAT'
order by 1
/
