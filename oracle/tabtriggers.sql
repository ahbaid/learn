-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/tabtriggers.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

define in_owner=&&1
define in_table_name=&&2

set verify off

column c1 format a20 word_wrapped heading TRIGGERING_EVENT
column c2 format a20 word_wrapped heading WHEN_CLAUSE

select trigger_name, 
       TRIGGERING_EVENT c1, 
       WHEN_CLAUSE c2, 
       trigger_type, 
       status 
from dba_triggers
where table_owner = upper('&&in_owner') and 
      table_name = upper('&&in_table_name')
order by 5,1;

set verify on
