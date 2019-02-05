set echo on
create user ahg identified by ahg
default tablespace dba_ts
quota unlimited on dba_ts;

grant select_catalog_role to ahg;
grant create session to ahg;
grant connect to ahg;
grant create procedure to ahg;
grant create type to ahg;
set echo off
