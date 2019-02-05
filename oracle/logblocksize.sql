column lbs format 99999 heading "Log Block Size (Bytes)"

select max(lebsz) lbs from sys.x$kccle;
