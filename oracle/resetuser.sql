set echo off
set verify off

define in_user=&&1
define in_password=&&2
define in_profile=&&3

select user, account_status, profile from dba_users where username = upper('&&in_user');

alter user &&in_user profile default;
alter user &&in_user identified by &&in_password;
alter user &&in_user password expire;
alter user &&in_user profile &&in_profile;

select user, account_status, profile from dba_users where username = upper('&&in_user');
