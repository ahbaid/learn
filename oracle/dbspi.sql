set echo on
spool dbspi.log

create user dbspi identified by dbpeek
default tablespace dba_ts
temporary tablespace temp_ts
quota unlimited on dba_ts;

grant create session to dbspi;
grant select_catalog_role to dbspi;

alter user dbspi profile gsd_dba_profile;

spool off
set echo off
