-- Author:		Ahbaid Gaffoor
-- File:		revoke_access.sql
-- Date:		Wednesday 22nd July 2009
-- Use:			revokes access on database objects

-- {{{ dba_tab_privs
set termout off

SQL> desc dba_tab_privs
 Name                                                                     Null?    Type
 ------------------------------------------------------------------------ -------- -------------------------------------------------
 GRANTEE                                                                  NOT NULL VARCHAR2(30)
 OWNER                                                                    NOT NULL VARCHAR2(30)
 TABLE_NAME                                                               NOT NULL VARCHAR2(30)
 GRANTOR                                                                  NOT NULL VARCHAR2(30)
 PRIVILEGE                                                                NOT NULL VARCHAR2(40)
 GRANTABLE                                                                         VARCHAR2(3)
 HIERARCHY                                                                         VARCHAR2(3)

SQL> desc dba_objects
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 OWNER                                              VARCHAR2(30)
 OBJECT_NAME                                        VARCHAR2(128)
 SUBOBJECT_NAME                                     VARCHAR2(30)
 OBJECT_ID                                          NUMBER
 DATA_OBJECT_ID                                     NUMBER
 OBJECT_TYPE                                        VARCHAR2(19)
 CREATED                                            DATE
 LAST_DDL_TIME                                      DATE
 TIMESTAMP                                          VARCHAR2(19)
 STATUS                                             VARCHAR2(7)
 TEMPORARY                                          VARCHAR2(1)
 GENERATED                                          VARCHAR2(1)
 SECONDARY                                          VARCHAR2(1)

set termout on
-- }}}

set feedback off verify off newpage 0 lines 500 pages 0 heading off

define schema=&&1
define object_name=&&2

-- {{{ Generate fnrevoke and fngrant SQL file names
set termout off
column rfile new_value fnrevoke noprint;
column gfile new_value fngrant noprint;
select 'revoke_access-'||upper('&&schema')||'-'||upper('&&object_name')||'.sql' as rfile from dual;
select 'grant_access-'||upper('&&schema')||'-'||upper('&&object_name')||'.sql' as gfile from dual;
set termout on
-- }}}

-- {{{ Generate DDL for revoke 
spool &&fnrevoke

declare

   cursor cRevoke (in_owner varchar2, in_object varchar2) is
          select dtp.privilege as priv, dtp.grantee as who, do.object_type as otype
          from dba_tab_privs dtp, dba_objects do
          where dtp.owner = in_owner and dtp.table_name = in_object and
                do.owner = dtp.owner and do.object_name = dtp.table_name and do.object_type <> 'PACKAGE BODY';

   DEBUG constant boolean := false;

   ddl varchar2(4000) := null;

   -- {{{ Print Procedures

   procedure print(n number) is
   begin
      dbms_output.put_line(n);
   end print;

   procedure print(d date) is
   begin
      dbms_output.put_line(to_char(d,'DD-MON-YYYY HH24:MI:SS'));
   end print;

   procedure print(s varchar2) is
   begin
      dbms_output.put_line(s);
   end print;

   procedure CR is
   begin
      print(chr(10));
   end CR;

   procedure line(in_char varchar2 := '=', in_width number := 70) is
   begin
      print(rpad(in_char,in_width,in_char));
   end line;

   -- {{{ debugmsg(s varchar2)
   procedure debugmsg(s varchar2) is
   begin
      if (DEBUG) then
         print('DEBUG: '||to_char(sysdate,'mm/dd/yyyy hh24:mi:ss')||'==> '||s);
      end if;
   end debugmsg;
   -- }}}

   -- }}}

begin

   print('set termout on echo on feedback on verify on');
   print('spool revoke_access-'||upper('&&schema')||'-'||upper('&&object_name')||'.log');
   for obj in cRevoke(upper('&&schema'), upper('&&object_name')) loop

      ddl := 'revoke '||obj.priv||' on '||upper('&&schema')||'.'||upper('&&object_name')||' from '||obj.who||';';

      print(ddl);

   end loop;
   print('spool off');

end;
/

spool off
-- }}}

-- {{{ Generate DDL for access
spool &&fngrant

declare

   cursor cRevoke (in_owner varchar2, in_object varchar2) is
          select dtp.privilege as priv, dtp.grantee as who, do.object_type as otype
          from dba_tab_privs dtp, dba_objects do
          where dtp.owner = in_owner and dtp.table_name = in_object and
                do.owner = dtp.owner and do.object_name = dtp.table_name and do.object_type <> 'PACKAGE BODY';

   DEBUG constant boolean := false;

   ddl varchar2(4000) := null;

   -- {{{ Print Procedures

   procedure print(n number) is
   begin
      dbms_output.put_line(n);
   end print;

   procedure print(d date) is
   begin
      dbms_output.put_line(to_char(d,'DD-MON-YYYY HH24:MI:SS'));
   end print;

   procedure print(s varchar2) is
   begin
      dbms_output.put_line(s);
   end print;

   procedure CR is
   begin
      print(chr(10));
   end CR;

   procedure line(in_char varchar2 := '=', in_width number := 70) is
   begin
      print(rpad(in_char,in_width,in_char));
   end line;

   -- {{{ debugmsg(s varchar2)
   procedure debugmsg(s varchar2) is
   begin
      if (DEBUG) then
         print('DEBUG: '||to_char(sysdate,'mm/dd/yyyy hh24:mi:ss')||'==> '||s);
      end if;
   end debugmsg;
   -- }}}

   -- }}}

begin

   print('set termout on echo on feedback on verify on');
   print('spool grant_access-'||upper('&&schema')||'-'||upper('&&object_name')||'.log');
   for obj in cRevoke(upper('&&schema'), upper('&&object_name')) loop

      ddl := 'grant '||obj.priv||' on '||upper('&&schema')||'.'||upper('&&object_name')||' to '||obj.who||';';

      print(ddl);

   end loop;
   print('spool off');

end;
/

spool off
-- }}}

set feedback on verify on newpage 1 lines 120 pages 1000 heading on

prompt
prompt &&fnrevoke &&fngrant
prompt
