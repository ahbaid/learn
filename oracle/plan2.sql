delete from plan_table where statement_id='TEST1';
explain plan
set statement_id = 'TEST1'
for 
 select bundleid, DELETEDFLAG from ENCFILE where DELETEDFLAG<>'Y';
@$ORACLE_HOME/rdbms/admin/utlxpls
