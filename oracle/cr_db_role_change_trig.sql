CREATE OR REPLACE TRIGGER post_role_change AFTER DB_ROLE_CHANGE ON DATABASE 
DECLARE
  l_set_cname CONSTANT VARCHAR2(100) := '/opt/ocpdba/oracle/admin/bin/set-orasvr-cname-to-localhost';
  l_name VARCHAR2(9);
  l_role VARCHAR2(16);

  set_cname_failure EXCEPTION;
  PRAGMA EXCEPTION_INIT (set_cname_failure, -27369);

  trigger_failure EXCEPTION;
  PRAGMA EXCEPTION_INIT (trigger_failure, -20101);

BEGIN
  SELECT DATABASE_ROLE INTO l_role FROM V$DATABASE;
  SELECT INSTANCE_NAME INTO l_name FROM V$INSTANCE;

  IF l_role = 'PRIMARY' THEN
    BEGIN
      dbms_scheduler.drop_job('ROLE_CHANGE');
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;

    dbms_scheduler.create_job(
      job_name => 'ROLE_CHANGE',
      job_type => 'EXECUTABLE',
      number_of_arguments => 1,
      job_action => l_set_cname,
      enabled => false,
      auto_drop => true);

    dbms_scheduler.set_job_argument_value(
      job_name => 'ROLE_CHANGE',
      argument_position => 1,
      argument_value => l_name);

    BEGIN
      dbms_scheduler.run_job('ROLE_CHANGE');
    EXCEPTION
    WHEN set_cname_failure THEN
      raise_application_error(-20101, 'CNAME flip failed due to error in ' || l_set_cname);
    END;
    
  END IF;
EXCEPTION
  WHEN trigger_failure THEN
    RAISE;
  WHEN OTHERS THEN
    raise_application_error(-20102, 'CNAME flip failed due to error in DB_ROLE_CHANGE trigger.        ' || SQLERRM);
END;
/
