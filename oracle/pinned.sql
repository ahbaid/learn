column name format a30
set pages 30

select type, name from v$db_object_cache
where kept = 'YES'
and name in ('DBMS_BACKUP_RESTORE','DBMS_RCVMAN','STANDARD','DBMS_STANDARD','DBMS_UTILITY',
'DBMS_AQ','DBMS_AQIN','DIUTIL','DIANA','DBMS_SYS_SQL','PIDL')
order by name, type
/
