-- DBCC MEMORYSTATUS
-- https://microsoft.sharepoint.com/teams/bidpwiki/Pages1/SQL%20Server%202012%20DBCC%20MEMORYSTATUS%20explained.aspx
select name, type, buckets_count from sys.dm_os_memory_cache_hash_tables where name IN ( 'SQL Plans' , 'Object Plans' , 'Bound Trees' );
select * from sys.dm_os_memory_cache_counters where name IN ( 'SQL Plans' , 'Object Plans' ,  'Bound Trees' );
