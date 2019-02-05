Rem
Rem    NAME
Rem      pin_std.sql - Pin Standard Packages
Rem
Rem    DESCRIPTION
Rem      SQL*PLUS command file which Pins Standard Packages at database startup
Rem
Rem    NOTES
Rem
Rem    MODIFIED   (MM/DD/YY)

spool pin_std_pkg.lis

PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DBMS_BACKUP_RESTORE','P');
execute dbms_shared_pool.keep('SYS.DBMS_BACKUP_RESTORE','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DBMS_RCVMAN','P');
execute dbms_shared_pool.keep('SYS.DBMS_RCVMAN','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.STANDARD','P');
execute dbms_shared_pool.keep('SYS.STANDARD','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DBMS_STANDARD','P');
execute dbms_shared_pool.keep('SYS.DBMS_STANDARD','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DBMS_UTILITY','P');
execute dbms_shared_pool.keep('SYS.DBMS_UTILITY','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DBMS_AQ','P');
execute dbms_shared_pool.keep('SYS.DBMS_AQ','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DBMS_AQIN','P');
execute dbms_shared_pool.keep('SYS.DBMS_AQIN','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DIUTIL','P');
execute dbms_shared_pool.keep('SYS.DIUTIL','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DIANA','P');
execute dbms_shared_pool.keep('SYS.DIANA','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.DBMS_SYS_SQL','P');
execute dbms_shared_pool.keep('SYS.DBMS_SYS_SQL','P');
  
PROMPT EXECUTING.... dbms_shared_pool.keep('SYS.PIDL','P');
execute dbms_shared_pool.keep('SYS.PIDL','P');
spool off

