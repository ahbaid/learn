select a.file#, a.name, nvl(to_char(max(completion_time)), 'NOT BACKED UP') last_backup
from v$datafile a left outer join v$backup_datafile b
on a.file# = b.file# and
   a.creation_change# = b.creation_change# and
   b.incremental_level = 0 and
   b.completion_time > sysdate - 4
group by a.file#, a.name
order by a.file#
/
