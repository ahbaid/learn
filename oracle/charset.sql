column parameter format A30
column value format A50

select parameter, value from nls_database_parameters
where parameter like '%CHARACTER%'
/
