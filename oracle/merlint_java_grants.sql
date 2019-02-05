spool merlint_java_grants
set serveroutput on size 400000
set echo on

begin
   dbms_java.grant_permission('ORADBA', 'SYS:java.util.PropertyPermission', '*','read,write');
end;
/

begin
   dbms_java.grant_permission( 'ORADBA', 'SYS:java.net.NetPermission', 'setDefaultAuthenticator', '' );
end;
/

begin
   dbms_java.grant_permission( 'ORADBA', 'SYS:java.io.FilePermission', '/ngs/app/merlint/log/*', 'write');
end;
/

begin
   dbms_java.grant_permission( 'ORADBA', 'SYS:java.net.SocketPermission', 'ds-all-at.corp.mango.com', 'connect,resolve' );
end;
/

begin
   dbms_java.grant_permission( 'ORADBA', 'SYS:java.net.SocketPermission', '17.108.112.154:8301', 'connect,resolve' );
end;
/

begin
   dbms_java.grant_permission( 'ORADBA', 'SYS:java.net.SocketPermission', '17.108.112.155:8301', 'connect,resolve' );
end;
/

set echo off
spool off

