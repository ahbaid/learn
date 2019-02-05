create tablespace tsr_big_data_ts   
datafile '/oradata/gstt/data31/tsr_big_data_ts_01.dbf' size 2000M
extent management local uniform size 100M;

alter tablespace tsr_big_data_ts add datafile  
   '/oradata/gstt/data31/tsr_big_data_ts_02.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_03.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_04.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_05.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_06.dbf' size 2097152000;

alter tablespace tsr_big_data_ts add datafile
   '/oradata/gstt/data31/tsr_big_data_ts_07.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_08.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_09.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_10.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_11.dbf' size 2097152000;
alter tablespace tsr_big_data_ts add datafile
   '/oradata/gstt/data31/tsr_big_data_ts_12.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_13.dbf' size 2097152000,
   '/oradata/gstt/data31/tsr_big_data_ts_14.dbf' size 2097152000,
   '/oradata/gstt/data32/tsr_big_data_ts_15.dbf' size 2000M;
