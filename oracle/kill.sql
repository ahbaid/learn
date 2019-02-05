define in_sid=&&1
define in_serial=&&2

alter system kill session '&&in_sid,&&in_serial'
/
