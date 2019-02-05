set lines 8000
set pages 0
set heading off
set feedback off
set verify off
set long 900000000

column rskd_results format a8000 word_wrapped

set termout off
spool xmldump2.log

select xmlelement("RSKD",
   xmlelement("RSKD_ID",RLVNT_SHORTCUT_KYWRD_DEST_ID),
   xmlelement("MARKETPLACE_ID",MARKETPLACE_ID),
   xmlelement("SEARCH_KEYWORD",SEARCH_KEYWORD),
   xmlelement("SEARCH_INDEX",SEARCH_INDEX),
   xmlelement("GURUPA",GURUPA_CONTENT),
   xmlelement("OBIDOS",OBIDOS_CONTENT)
) as rskd_results
from RELEVANT_SHORTCUT_KEYWORD_DEST
order by RLVNT_SHORTCUT_KYWRD_DEST_ID;

spool off
set termout on

set lines 80
set heading on
set feedback on
set verify on
set pages 10

