-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/fileid.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

define in_file_name=&&1

column name format A50 word_wrapped

select file#, status, name
from v$datafile 
where name = '&&in_file_name';

undef in_file_name
