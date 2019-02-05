set echo on
alter table SYS.AUD$ storage (next 10M maxextents unlimited pctincrease 0);
alter index SYS.I_AUD1 storage (next 10M maxextents unlimited pctincrease 0);
set echo off
