select count(*) from DBA_PARTIAL_DROP_TABS
union
select count(*) from DBA_PART_COL_STATISTICS
union
select count(*) from DBA_PART_HISTOGRAMS
union
select count(*) from DBA_PART_INDEXES
union
select count(*) from DBA_PART_KEY_COLUMNS
union
select count(*) from DBA_PART_LOBS
union
select count(*) from DBA_PART_TABLES;

