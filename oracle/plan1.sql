explain plan set statement_id =  'TEST1'
for
SELECT /*+ index(ABCD ABCD_IDX) */ BUNDLEID,DELETEDFLAG
FROM abcd 
WHERE DELETEDFLAG!='Y'
/
@$ORACLE_HOME/rdbms/admin/utlxpls
