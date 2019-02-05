SELECT s.sid, bgp.name 
    FROM V$SESSION s, V$BGPROCESS bgp 
   WHERE bgp.name LIKE '%DBW%' 
     AND bgp.paddr = s.paddr; 
