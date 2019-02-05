define in_owner=&&1
define in_segname=&&2

select 'dbv userid=&&in_owner/passwd segment_id='||ts.ts#||'.'||seg.header_file||'.'||seg.header_block as dbv
from v$tablespace ts, dba_segments seg
where seg.owner = upper('&&in_owner') and
      seg.segment_name = upper('&&in_segname') and
      ts.name = seg.tablespace_name;

REM
REM Total Pages Examined : The number of blocks inspected by dbv.  If the entire 
REM file was scanned, this value will match the BLOCKS column for the file in v$datafile.
REM
REM Total Pages Processed (Data) : REM The number of blocks inspected by dbv 
REM that contained table data.
REM
REM Total Pages Failing (Data) : The number of table blocks that have corruption.
REM
REM Total Pages Processed (Index) :The number of blocks inspected by dbv that 
REM contained index data.
REM
REM Total Pages Failing (Index) : The number of index blocks that are corrupted.
REM
REM Total Pages Processed (Seg) : This output is new to 9i and allows the 
REM command to specify a segment that spans multiple files. 
REM
REM Total Pages Failing (Seg) : The number of segment data blocks that are corrupted.
REM
REM Total Pages Empty : Number of unused blocks discovered in the file.
REM
REM Total Pages Marked Corrupt : This is the most important one.  It shows the number 
REM of corrupt blocks discovered during the scan.
REM
REM Total Pages Influx : The number of pages that were re-read due to the page being 
REM in use.  This should only occur when executing dbv against hot datafiles and 
REM should never occur when running dbv against cold backup files.
REM
