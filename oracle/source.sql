clear columns
clear breaks

set lines 120
set pages 0

define in_owner=&&1
define in_source_object=&&2

column text format A110 word_wrapped

select text 
from dba_source
where owner = upper('&&in_owner') and 
      name=upper('&&in_source_object') and 
      type in ('PACKAGE BODY','PROCEDURE','FUNCTION')
order by line;

