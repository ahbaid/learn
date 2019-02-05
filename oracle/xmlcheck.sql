spool xmlcheck.log

create function ahg return varchar2 is language java name 
'oracle.xml.parser.v2.XMLParser.getReleaseVersion() returns java.lang.String';
/

select ahg from dual;

drop function ahg;

spool off;
