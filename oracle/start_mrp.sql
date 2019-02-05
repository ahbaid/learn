undefine in_parallel
define in_parallel=&&1

set echo on
alter database recover managed standby database parallel &&in_parallel disconnect;
set echo off
