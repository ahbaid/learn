define in_owner=&&1

select trunc(last_analyzed), count(*) from dba_tables
where owner = upper('&&in_owner')
group by trunc(last_analyzed)
/
