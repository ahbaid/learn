-- Author:		Ahbaid Gaffoor
-- File:		createoutline.sql
-- Use:			used to create an outline for an existing SQL statement

-- aqc8kpz3mu3x1

define in_sqlid=&&1
define in_outline=&&2

set pages 1000 lines 120 feedback on verify on

@sqlid &&in_sqlid

declare

  outline_sql varchar2(32000) := null;
  ddl varchar2(32000) := null;

  e_OUTLINE_EXISTS exception;
  pragma exception_init(e_OUTLINE_EXISTS, -18004);

/*
  cursor c_onames (in_sqltext varchar2) is
  select owner, name, signature from dba_outlines where sql_text = in_sqltext;
*/

begin

  select sql_fulltext into outline_sql from v$sql 
  where sql_id = '&&in_sqlid' and rownum = 1;

  dbms_output.put_line('SQL &&in_sqlid length is: '||length('&&in_sqlid'));

  dbms_output.put_line(chr(10)||'Outline '||upper('&&in_outline'));
  dbms_output.put_line('===================================================');
  dbms_output.put_line(outline_sql);

  ddl := 'create outline '||upper('&&in_outline')||' on '||outline_sql;

  begin

     execute immediate ddl;

  exception when e_OUTLINE_EXISTS then
     begin

       dbms_output.put_line(chr(10));
       dbms_output.put_line('Outline exists...');
/*
       dbms_output.put_line('-----------------');

       for c1 in c_onames(outline_sql) loop
          dbms_output.put_line(c1.owner||'.'||c1.name||' -> '||c1.signature);
       end loop;

*/
       dbms_output.put_line(chr(10));

     end;

  end;

end;
/
