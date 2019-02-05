set echo on
startup nomount
alter database mount standby database;
@@start_mrp
set echo off
