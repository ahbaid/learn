set echo on
SELECT COUNT(*) "should decrease" FROM obj$ WHERE status IN (4, 5, 6);
SELECT COUNT(*) "should increase" FROM UTL_RECOMP_COMPILED;
set echo off

