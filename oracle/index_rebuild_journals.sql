-- Author:		Ahbaid Gaffoor
-- File:		journals.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:			Show left over journal from index rebuilds

select * from sys.ind$ where bitand(flags,512)=512;

