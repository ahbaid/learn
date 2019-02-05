create or replace function XMLVersion return varchar2 
is language java name
'oracle.xml.parser.v2.XMLParser.getReleaseVersion() returns java.lang.String';
/

select xmlversion from dual;

drop function xmlversion;
