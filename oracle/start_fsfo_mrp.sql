set echo on
alter database recover managed standby database parallel &&in_parallel using current logfile disconnect from session;
set echo off
