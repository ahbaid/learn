select owner, original_name, decode(type,'Table Partition','TABLE','Index Partition','INDEX',type) as type, count(*) from dba_recyclebin
group by owner, original_name, decode(type,'Table Partition','TABLE','Index Partition','INDEX',type) 
order by 1, 2, 4
/
