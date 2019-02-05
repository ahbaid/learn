create or replace view sys.sox_source as
select u.name, o.name,
decode(o.type#, 7, 'PROCEDURE', 8, 'FUNCTION', 9, 'PACKAGE',
               11, 'PACKAGE BODY', 13, 'TYPE', 14, 'TYPE BODY',
               'UNDEFINED'),
s.line, s.source
from sys.obj$ o, sys.source$ s, sys.user$ u
where o.obj# = s.obj#
  and o.owner# = u.user#
  and o.type# in (7, 8, 9, 11, 13, 14)
  and u.user#=36
union
select u.name, o.name, 'JAVA SOURCE', s.joxftlno, s.joxftsrc
from sys.obj$ o, x$joxfs s, sys.user$ u
where o.obj# = s.joxftobn
  and o.owner# = u.user#
  and o.type# = 28
  and u.user#=36
