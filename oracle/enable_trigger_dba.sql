-- File: 	enable_trigger_dba.sql
-- Use:		Enable DML auditing for selected tables
--

define data_tablespace=DBA_TS

set echo on
spool enable_trigger_dba

select username, default_tablespace from dba_users where username = 'OPS$ORACLE';

PROMPT
PROMPT OPS$ORACLE Connection
PROMPT The default tablespace MUST be DBA_TS for OPS$ORACLE user, abort and fix if needed
PROMPT
accept continue prompt "Continue.. hit enter"


connect / 
create table DML_AUDIT (
   tabname varchar2(30),
   username varchar2(30),
   osuser varchar2(30),
   machine varchar2(64),
   terminal varchar2(30),
   program varchar2(48),
   operation varchar2(10),
   sqltext varchar2(2000),
   time date
) tablespace &&data_tablespace nologging;


PROMPT
PROMPT Connecting as SYS user
PROMPT
connect / as sysdba
@$DS/gsd_dml_audit_pkg.plb

create public synonym gsd_dml_audit_pkg for SYS.gsd_dml_audit_pkg;
create public synonym DML_AUDIT for OPS$ORACLE.DML_AUDIT;

PROMPT
PROMPT Grant execute to APP owner - ERMDBA
PROMPT
grant execute on GSD_DML_AUDIT_PKG to ERMDBA;

spool off
set echo off
