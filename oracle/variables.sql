set echo on feedback off

variable x number
exec :x := 1;
var x
print :x

variable s varchar2(10)
exec :s := 'test';
var s
print :s

set echo off feedback on
