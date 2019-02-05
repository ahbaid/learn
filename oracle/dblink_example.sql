drop database link testdt;

create database link testdt
connect to test identified by test
using 'testdt';
