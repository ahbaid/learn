set echo on
  CREATE TABLESPACE "ITMS_BOOK_INDEX_TS" DATAFILE
  '/oradata/gcat/data56/itms_book_index_ts_01.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_02.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_03.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_04.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_05.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_06.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_07.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_08.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_09.dbf' SIZE 2000M,
  '/oradata/gcat/data56/itms_book_index_ts_10.dbf' SIZE 2000M
  LOGGING ONLINE PERMANENT BLOCKSIZE 16K
  EXTENT MANAGEMENT LOCAL UNIFORM SIZE 100M SEGMENT SPACE MANAGEMENT MANUAL;
