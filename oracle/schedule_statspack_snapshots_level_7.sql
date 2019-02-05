/*
There are 1440 minutes in a day, this is the sample rate:

1/24 = 60mins
1/48 = 30mins
1/144 = 10mins
1/288 = 5mins

PROCEDURE SUBMIT
 Argument Name                  Type                    In/Out Default?
 ------------------------------ ----------------------- ------ --------
 JOB                            BINARY_INTEGER          OUT
 WHAT                           VARCHAR2                IN
 NEXT_DATE                      DATE                    IN     DEFAULT
 INTERVAL                       VARCHAR2                IN     DEFAULT
 NO_PARSE                       BOOLEAN                 IN     DEFAULT
 INSTANCE                       BINARY_INTEGER          IN     DEFAULT
 FORCE                          BOOLEAN                 IN     DEFAULT

interval=>'trunc(sysdate+1/144),''MI'')', /* DOES NOT WORK! */

*/

set serveroutput on size 200000

PROMPT You must connect as PERFSTAT
accept continue

declare
   jobno number;
   instno number;

   procedure print(s varchar2) is
   begin
       dbms_output.put_line(s);
   end;

   procedure cr is
   begin
      print(chr(11));
   end;

begin

dbms_job.submit(	job=>jobno,
						what=>'statspack.snap(7);',
						next_date=>trunc(sysdate+1/24,'HH'),
						--interval=>'trunc(sysdate+1/24,''MI'')',
						interval=>'trunc(SYSDATE+1/24,''HH'')',
						no_parse=>true);

print('Job Number is: '||jobno);

end;
/


