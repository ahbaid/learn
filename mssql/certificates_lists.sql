/* {{{ 
Author: 	Ahbaid Gaffoor
File:		certificates_list.sql
Date:		Sun Dec 9th 2018
Notes:	certificates management - list
}}} */

-- Always use master
:setvar inDbname master

use $(inDbname)
go

-- Check if query store is enabled
select name, certificate_id, issuer_name, cert_serial_number, expiry_date from master.sys.certificates;
go

