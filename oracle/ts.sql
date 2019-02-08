set echo on

  CREATE TABLESPACE "PART_DATA2_TS" DATAFILE
  '/oradata/gcat/data49/part_data2_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_10.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_11.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_12.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_13.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_14.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_15.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_16.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_17.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_18.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_19.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_20.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_21.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_22.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_23.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_24.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_25.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_26.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_27.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_28.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_29.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_30.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_31.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_32.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_33.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_34.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_35.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_36.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_37.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_38.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_39.dbf' SIZE 2000M,
  '/oradata/gcat/data49/part_data2_ts_40.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 100M SEGMENT SPACE MANAGEMENT MANUAL;

CREATE TABLESPACE "PART_DATA3_TS" DATAFILE
  '/oradata/gcat/data50/part_data3_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_10.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_11.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_12.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_13.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_14.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_15.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_16.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_17.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_18.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_19.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_20.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_21.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_22.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_23.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_24.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_25.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_26.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_27.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_28.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_29.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_30.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_31.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_32.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_33.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_34.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_35.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_36.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_37.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_38.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_39.dbf' SIZE 2000M,
  '/oradata/gcat/data50/part_data3_ts_40.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 100M SEGMENT SPACE MANAGEMENT MANUAL;

  CREATE TABLESPACE "PART_DATA4_TS" DATAFILE
  '/oradata/gcat/data51/part_data4_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_10.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_11.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_12.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_13.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_14.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_15.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_16.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_17.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_18.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_19.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_20.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_21.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_22.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_23.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_24.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_25.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_26.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_27.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_28.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_29.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_30.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_31.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_32.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_33.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_34.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_35.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_36.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_37.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_38.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_39.dbf' SIZE 2000M,
  '/oradata/gcat/data51/part_data4_ts_40.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 100M SEGMENT SPACE MANAGEMENT MANUAL;
  
  CREATE TABLESPACE "PART_DATA5_TS" DATAFILE
  '/oradata/gcat/data52/part_data5_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_10.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_11.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_12.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_13.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_14.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_15.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_16.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_17.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_18.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_19.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_20.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_21.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_22.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_23.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_24.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_25.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_26.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_27.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_28.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_29.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_30.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_31.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_32.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_33.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_34.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_35.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_36.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_37.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_38.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_39.dbf' SIZE 2000M,
  '/oradata/gcat/data52/part_data5_ts_40.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 100M SEGMENT SPACE MANAGEMENT MANUAL;
  

  CREATE TABLESPACE "PART_DATA6_TS" DATAFILE
  '/oradata/gcat/data53/part_data6_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_10.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_11.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_12.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_13.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_14.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_15.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_16.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_17.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_18.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_19.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_20.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_21.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_22.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_23.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_24.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_25.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_26.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_27.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_28.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_29.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_30.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_31.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_32.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_33.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_34.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_35.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_36.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_37.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_38.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_39.dbf' SIZE 2000M,
  '/oradata/gcat/data53/part_data6_ts_40.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 100M SEGMENT SPACE MANAGEMENT MANUAL;

  CREATE TABLESPACE "PART_INDEX1_TS" DATAFILE
  '/oradata/gcat/data54/part_index1_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_10.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_11.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_12.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_13.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_14.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_15.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_16.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_17.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_18.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_19.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_20.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_21.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_22.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_23.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_24.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_25.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_26.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_27.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_28.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_29.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_30.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_31.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_32.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_33.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_34.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_35.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_36.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_37.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_38.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_39.dbf' SIZE 2000M,
  '/oradata/gcat/data54/part_index1_ts_40.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 50M SEGMENT SPACE MANAGEMENT MANUAL;

  CREATE TABLESPACE "PART_INDEX2_TS" DATAFILE
  '/oradata/gcat/data55/part_index2_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_10.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_11.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_12.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_13.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_14.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_15.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_16.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_17.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_18.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_19.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_20.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_21.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_22.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_23.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_24.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_25.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_26.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_27.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_28.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_29.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_30.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_31.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_32.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_33.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_34.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_35.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_36.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_37.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_38.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_39.dbf' SIZE 2000M,
  '/oradata/gcat/data55/part_index2_ts_40.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 50M SEGMENT SPACE MANAGEMENT MANUAL;

alter user gca_user quota unlimited on PART_DATA1_TS;
alter user gca_user quota unlimited on PART_DATA2_TS;
alter user gca_user quota unlimited on PART_DATA3_TS;
alter user gca_user quota unlimited on PART_DATA4_TS;
alter user gca_user quota unlimited on PART_DATA5_TS;
alter user gca_user quota unlimited on PART_DATA6_TS;
alter user gca_user quota unlimited on PART_INDEX1_TS;
alter user gca_user quota unlimited on PART_INDEX2_TS;