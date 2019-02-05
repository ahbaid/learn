-----------------------------------------------------------------------------
-- ##############################################################
-- # Script Name        : gsd_dml_audit_pkg.sql
-- # Directory          :
-- # Description        : DML audit
-- # Arguments          : -
-- # called by          : gsdaud_<tabname>_trig
-- # called scripts     : none
-- #
-- # Modification History:
-- # DATE:      DBA:      CR#/SR#:     Modification Description:
-- # ________   _______   ________     ________________________
-- #                                    sysdba actions
-- ##############################################################
--  OVERVIEW
--
--  This  package is called by trigger on sensitive tables on which 
--  its decided to have DML auditing.
--
--  This package is intended to be created only once initially
--  and it needs to be run as SYS user.
--
------------------------------------------------------------------
--  SOURCE CODE
--================================================================
CREATE OR REPLACE PACKAGE GSD_DML_AUDIT_PKG
AS
PROCEDURE LOG_DML(v_tabname IN varchar2);

END GSD_DML_AUDIT_PKG;
/

CREATE OR REPLACE PACKAGE BODY GSD_DML_AUDIT_PKG
AS

PROCEDURE LOG_DML(v_tabname IN varchar2)
IS
v_dmlop varchar2(10);
v_osuser v$session.osuser%type;
v_machine v$session.machine%type;
v_terminal v$session.terminal%type;
v_program v$session.program%type;
v_sql varchar2(2000);
v_profile dba_users.profile%type;
 vsql_text ora_name_list_t;
 n integer;
pragma autonomous_transaction;

BEGIN
 SELECT profile INTO v_profile
 FROM dba_users
 WHERE username=user 
   AND username not like 'P\_%' escape '\' 
   AND profile in ('GSD_DBA_PROFILE','GSD_INT_PROFILE','DEFAULT');
 
IF sql%found
 THEN
  IF inserting then v_dmlop := 'Insert';
   ELSIF deleting then v_dmlop := 'Delete';
   ELSIF updating then v_dmlop := 'Update';
   ELSE v_dmlop := '???';
END IF;
 
SELECT s.osuser, s.machine, s.terminal, s.program
  INTO v_osuser, v_machine, v_terminal, v_program
  FROM sys.v_$session s
 WHERE s.sid = (select sid from v$mystat where rownum=1);
 
n:= ora_sql_txt(vsql_text);
FOR i IN 1..n LOOP
 v_sql:=v_sql||vsql_text(i);
END LOOP;

INSERT into ops$oracle.DML_AUDIT
 (tabname
  , username
  , osuser
  , machine
  , terminal
  , program
  , operation
  , sqltext
  , time)
values
 (v_tabname
  , user
  , v_osuser
  , v_machine
  , v_terminal
  , v_program
  , v_dmlop
  , substr(v_sql,1,2000)
  , sysdate);

COMMIT;
END IF;

EXCEPTION
 WHEN no_data_found THEN
   return;
  WHEN others THEN
   rollback;
END LOG_DML;

END GSD_DML_AUDIT_PKG;
/
