set verify off feedback off heading off
set long 400000 serveroutput on size 400000 lines 250 pages 1000 newpage 0

define in_owner=&&1
define in_type=&&2
define in_object=&&3

-- 
-- Get Base DDL
--
column ddl format a200 word_wrapped heading "Table DDL"
select dbms_metadata.get_ddl(upper('&&in_type'),upper('&&in_object'),upper('&&in_owner')) as ddl 
from dual
where (select count(*) 
       from dba_objects
       where owner = upper('&&in_owner') and
             object_name = upper('&&in_object') and
             object_type = upper('&&in_type')) > 0;

--
-- Get index DDL if they exist
--
column ddl format a200 word_wrapped heading "Index DDL"
select dbms_metadata.get_dependent_ddl('INDEX',upper('&&in_object'),upper('&&in_owner')) as ddl 
from dual
where (select count(*) 
       from dba_indexes 
       where table_owner = upper('&&in_owner') and 
             table_name = upper('&&in_object')) > 0;

--
-- Get trigger DDL if they exist
--
column ddl format a200 word_wrapped heading "Trigger DDL"
select dbms_metadata.get_dependent_ddl('TRIGGER',upper('&&in_object'),upper('&&in_owner')) as ddl 
from dual
where (select count(*) 
       from dba_triggers
       where table_owner = upper('&&in_owner') and 
             table_name = upper('&&in_object')) > 0;

set verify on feedback on heading on
set long 400000 serveroutput on size 400000 lines 250 pages 1000 newpage 1
