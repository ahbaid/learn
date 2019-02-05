-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/tabcomments.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

set verify off
define in_schema=&&1
define in_table_name=&&2

set lines 120
column c0 format a30 heading "Column"
column c1 format a60 heading "Comments"


select a.column_name c0, 
       b.comments c1
from dba_tab_columns a, dba_col_comments b
where a.owner = b.owner and a.owner = upper('&&in_schema') and
      a.table_name = b.table_name and a.table_name = upper('&&in_table_name') and
      a.column_name = b.column_name
order by a.column_id;
