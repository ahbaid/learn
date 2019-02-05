select  name, password from user$
where substr(name,1,2) <> 'P_' and password is not null
/
