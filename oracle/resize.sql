set echo on                                                                                                                          
set timing on                                                                                                                        
alter database datafile '&&1' resize &&2;                                               
set echo off                                                                                                                         
set timing off                                                                                                                       
