spool setjvmprivs.sql 

set echo off 

set feedback off 

set heading off 

set linesize 80 

set pagesize 1000 

column stmt format a70 word_wrapped 

select 'exec '||stmt from (select seq, 'dbms_java.grant_permission('''||grantee||''','''|| type_schema||':'||type_name||''','''||name||''','''||action|| ''');' stmt from dba_java_policy where grantee not in ('JAVADEBUGPRIV', 'JAVASYSPRIV', 'JAVAUSERPRIV', 'JAVA_ADMIN', 'JAVA_DEPLOY', 'SYS', 'PUBLIC') and type_name!='oracle.aurora.rdbms.security.PolicyTablePermission' union all 
select seq,'dbms_java.grant_policy_permission('''||a.grantee||''','''|| u.name||''','''||permition||''','''||action||''');' stmt from sys.user$ u, 

           (select seq, grantee, to_number(substr(name,1,instr(name,':')-1)) userid, substr(name,instr(name,':')+1,instr(name,'#') 
- instr(name,':')-1) permition, substr(name,instr(name,'#')+1 ) action from dba_java_policy where grantee not in ('JAVADEBUGPRIV', 'JAVASYSPRIV', 'JAVAUSERPRIV', 'JAVA_ADMIN', 'JAVA_DEPLOY', 'SYS', 'PUBLIC') and type_name = 'oracle.aurora.rdbms.security.PolicyTablePermission') a where u.user#=userid) order by seq; 
column stmt clear 

set pagesize 24 

set heading on 

spool off 
