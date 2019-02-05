set termout off
column pval new_value db_block_size noprint;
select value as pval from v$parameter where name = 'db_block_size';
set termout on
