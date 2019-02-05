/*
SQL> desc v$latch
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 ADDR                                                                                                                       RAW(8)
 LATCH#                                                                                                                     NUMBER
 LEVEL#                                                                                                                     NUMBER
 NAME                                                                                                                       VARCHAR2(64)
 HASH                                                                                                                       NUMBER
 GETS                                                                                                                       NUMBER
 MISSES                                                                                                                     NUMBER
 SLEEPS                                                                                                                     NUMBER
 IMMEDIATE_GETS                                                                                                             NUMBER
 IMMEDIATE_MISSES                                                                                                           NUMBER
 WAITERS_WOKEN                                                                                                              NUMBER
 WAITS_HOLDING_LATCH                                                                                                        NUMBER
 SPIN_GETS                                                                                                                  NUMBER
 SLEEP1                                                                                                                     NUMBER
 SLEEP2                                                                                                                     NUMBER
 SLEEP3                                                                                                                     NUMBER
 SLEEP4                                                                                                                     NUMBER
 SLEEP5                                                                                                                     NUMBER
 SLEEP6                                                                                                                     NUMBER
 SLEEP7                                                                                                                     NUMBER
 SLEEP8                                                                                                                     NUMBER
 SLEEP9                                                                                                                     NUMBER
 SLEEP10                                                                                                                    NUMBER
 SLEEP11                                                                                                                    NUMBER
 WAIT_TIME                                                                                                                  NUMBER

*/

select latch#, level#, name ,
       misses, sleeps, spin_gets
from v$latch 
where lower(name) = 'shared pool'
order by 3
/
