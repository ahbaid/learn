-- Author:		Ahbaid Gaffoor
-- File:		viewdef.sql
-- Date:		Thursday 29th November 2007
-- Revision:		$Revision$
-- Use:		        Extract view definition from data dictionary

undefine in_view_name
define in_view_name=&&1

clear columns
clear breaks

set lines 100
set pages 40

define column vd format A100 word_wrapped heading "View Definition"

select view_definition from GV_$FIXED_VIEW_DEFINITION
where inst_id = 1 and upper(view_name) = upper('&&in_view_name');

