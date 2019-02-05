set serveroutput on size 400000
set verify off

define in_user=&&1

declare

  -- {{{ cursor c1 (uname varchar)  dba_users
  cursor c1 (uname varchar) is
      select user_id,
             account_status,
             created,
             expiry_date,
             lock_date,
             default_tablespace as dtspc,
             temporary_tablespace as ttspc,
             profile,
             u.password,
             ui.ltime 
      from dba_users u, user$ ui
      where username = uname and u.user_id = ui.user#;
  -- }}}

  -- {{{ cursor c2 (uname varchar) dba_role_privs
  cursor c2 (uname varchar) is
      select granted_role as grole
      from dba_role_privs
      where grantee = uname;
  -- }}}

  sbuffer varchar(100) := null;

  -- {{{ print procedures
  procedure print(s varchar) is 
  begin
     dbms_output.put_line(s);
  end print;

  procedure newline is
  begin
     print(chr(10));
  end;

  procedure line(linechar varchar := '=', repeat number := 80) is 
  begin
    print(rpad(linechar,repeat,linechar));
  end;
  -- }}}

  -- {{{ function get_dbname return varchar 
  function get_dbname return varchar is
    rval varchar(60) := null;
  begin
     select instance_name into rval from v$instance;
     return upper(rval);
  end get_dbname;
  -- }}}

begin

  newline;
  line;

  sbuffer := 'Account Information: '||upper('&&in_user')||'@'||get_dbname||' ['||to_char(sysdate,'HH24:MI:SS YYYY/MM/DD')||']';
  print(sbuffer);
  line('-',length(sbuffer));

  for ud1 in c1(upper('&&in_user')) loop

     if (ud1.expiry_date is not null) then
        print('Created: '||ud1.created);
        print('Expires: '||ud1.expiry_date);
     else
        print('Created: '||ud1.created||' [No Expiration Date]');
     end if;

     print('User ID: '||ud1.user_id);

     --print('TEST Status: '||ud1.account_status||' at '||to_char(ud1.ltime,'mm/dd/yyyy hh24:mi:ss'));
     if (ud1.ltime is not null) then
        print('Status: '||ud1.account_status||' at '||to_char(ud1.ltime,'mm/dd/yyyy hh24:mi:ss'));
     else
        print('Status: '||ud1.account_status);
     end if;
       
     print('Default Tablespace: '||ud1.dtspc);
     print('Temporary Tablespace: '||ud1.ttspc);
     print('Profile: '||ud1.profile);
     print('Raw Password: '||ud1.password);
  end loop;

  newline;
  sbuffer := 'Roles Assigned:';
  print(sbuffer);
  line('-',length(sbuffer));

  for ud2 in c2(upper('&&in_user')) loop
     print(ud2.grole);
  end loop;

  line;
  newline;

end;
/

set verify on
