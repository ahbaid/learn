set termout off
column name new_value dbname noprint;
column uname new_value dbuname noprint;
select lower(DB_UNIQUE_NAME) as uname, lower(name) as name from v$database;
set termout on
