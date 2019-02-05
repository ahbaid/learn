-- Author:		Ahbaid Gaffoor
-- File:		clients.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

column client_info format a25 heading "Client"
select client_info, count(*) from v$session group by client_info;
