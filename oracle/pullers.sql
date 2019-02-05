select nvl(client_info, nvl(module, program)) as c0, count(*)
from v$session
where nvl(client_info, nvl(module, program)) = 'SearchQueuePuller'
group by nvl(client_info, nvl(module, program))
/
