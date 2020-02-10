# SQL Server Restoration of Microsoft's AdventureWorks database to SQL Server 2019 on Linux
## Problem Statement
* While needing a test database for load testing, Microsoft's AdventureWorks db is a good place to start.
* Instructions are available online at: https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-2017
* However these are geared to Windows.
* This article shows the steps taken to download and restore the SQl Server 2017 version of the AdventureWorks database to SQL Server 2019 (or 2017) on Linux

# Links
* https://docs.microsoft.com/en-us/sql/relational-databases/databases/attach-a-database?view=sql-server-2017
* https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-2017
* https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks
* https://docs.microsoft.com/en-us/sql/t-sql/statements/restore-statements-transact-sql?view=sql-server-2017#restoring_db_n_move_files
* https://docs.microsoft.com/en-us/sql/t-sql/statements/restore-statements-headeronly-transact-sql?view=sql-server-2017
* https://docs.microsoft.com/en-us/sql/t-sql/statements/alter-database-transact-sql-compatibility-level?view=sql-server-2017

# Pre-requisites:
* Download the backup file and put it in a lcoation on the db server, (example: /tmp/AdventureWorks.bak)
* The restore command expects the backup file to be in a physical path on the target database server locally
* Source the ".env.sh" script to get the "scsql" alias setup
* Uncomment the first line and set your "sa" password
~~~~
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ cat env.sh
# export MKPLAB=your_sa_password
export SQLOPTS="-w 120 -W -e"
alias sqlsc='sqlcmd -S 199.1.1.21 -U sa  -P "$MKPLAB" $SQLOPTS'
alias sqlti='sqlcmd -S 199.1.1.22 -U sa  -P "$MKPLAB" $SQLOPTS'

ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ source env.sh

ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ alias scsql
alias scsql='sqlcmd -S 199.1.1.21 -U "$MU" -P "$MK" -w 120 -W -e'
~~~~

# Restoration
## Check the headers
~~~~
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ alias scsql
alias scsql='sqlcmd -S 199.1.1.21 -U "$MU" -P "$MK" -w 120 -W -e'
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ scsql -i restore_AdventureWorks_headers.sql
restore headeronly from disk = '/tmp/AdventureWorks2017.bak' ;

BackupName BackupDescription BackupType ExpirationDate Compressed Position DeviceType UserName ServerName DatabaseName D
atabaseVersion DatabaseCreationDate BackupSize FirstLSN LastLSN CheckpointLSN DatabaseBackupLSN BackupStartDate BackupFi
nishDate SortOrder CodePage UnicodeLocaleId UnicodeComparisonStyle CompatibilityLevel SoftwareVendorId SoftwareVersionMa
jor SoftwareVersionMinor SoftwareVersionBuild MachineName Flags BindingID RecoveryForkID Collation FamilyGUID HasBulkLog
gedData IsSnapshot IsReadOnly IsSingleUser HasBackupChecksums IsDamaged BeginsLogChain HasIncompleteMetaData IsForceOffl
ine IsCopyOnly FirstRecoveryForkID ForkPointLSN RecoveryModel DifferentialBaseLSN DifferentialBaseGUID BackupTypeDescrip
tion BackupSetGUID CompressedBackupSize Containment KeyAlgorithm EncryptorThumbprint EncryptorType
---------- ----------------- ---------- -------------- ---------- -------- ---------- -------- ---------- ------------ -
-------------- -------------------- ---------- -------- ------- ------------- ----------------- --------------- --------
-------- --------- -------- --------------- ---------------------- ------------------ ---------------- -----------------
--- -------------------- -------------------- ----------- ----- --------- -------------- --------- ---------- ----------
------- ---------- ---------- ------------ ------------------ --------- -------------- --------------------- -----------
--- ---------- ------------------- ------------ ------------- ------------------- -------------------- -----------------
---- ------------- -------------------- ----------- ------------ ------------------- -------------
AdventureWorks2017-Full Database Backup NULL 1 NULL 1 1 2 REDMOND\barbkess BARBKESS24\MSSQL2017RTM AdventureWorks2017 86
9 2017-10-27 14:33:00.000 216090624 39000002152700075 39000002156300001 39000002152700075 0 2017-10-27 14:35:38.000 2017
-10-27 14:35:39.000 52 0 1033 196609 140 4608 14 0 1000 BARBKESS24 512 F357995E-9F0D-47D7-ABA1-A699DDBC24C7 66DE2FDA-4D3
9-4A28-91E7-EE24EE910DF4 SQL_Latin1_General_CP1_CI_AS 66DE2FDA-4D39-4A28-91E7-EE24EE910DF4 0 0 0 0 0 0 0 0 0 0 66DE2FDA-
4D39-4A28-91E7-EE24EE910DF4 NULL SIMPLE NULL NULL Database 2864FFA5-F41C-4331-A660-8E8EA1A4A97E 50286931 0 NULL NULL NUL
L

(1 rows affected)
~~~~

## Check files on the server
~~~~
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ sqlsc -i listfiles.sql
select name, filename from sys.sysaltfiles;

name filename
---- --------
master /var/opt/mssql/data/master.mdf
mastlog /var/opt/mssql/data/mastlog.ldf
tempdev /var/opt/mssql/data/tempdb.mdf
templog /var/opt/mssql/data/templog.ldf
tempdev2 /var/opt/mssql/data/tempdb2.ndf
tempdev3 /var/opt/mssql/data/tempdb3.ndf
tempdev4 /var/opt/mssql/data/tempdb4.ndf
modeldev /var/opt/mssql/data/model.mdf
modellog /var/opt/mssql/data/modellog.ldf
MSDBData /var/opt/mssql/data/MSDBData.mdf
MSDBLog /var/opt/mssql/data/MSDBLog.ldf
data mssqlsystemresource.mdf
log mssqlsystemresource.ldf

(13 rows affected)
~~~~

## Check filelist on the backup
~~~~
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ scsql -i restore_AdventureWorks_filelistonly.sql
restore filelistonly from disk = '/tmp/AdventureWorks2017.bak' ;

LogicalName PhysicalName Type FileGroupName Size MaxSize FileId CreateLSN DropLSN UniqueId ReadOnlyLSN ReadWriteLSN Back
upSizeInBytes SourceBlockSize FileGroupId LogGroupGUID DifferentialBaseLSN DifferentialBaseGUID IsReadOnly IsPresent TDE
Thumbprint SnapshotUrl
----------- ------------ ---- ------------- ---- ------- ------ --------- ------- -------- ----------- ------------ ----
------------- --------------- ----------- ------------ ------------------- -------------------- ---------- --------- ---
---------- -----------
AdventureWorks2017 C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017RTM\MSSQL\DATA\AdventureWorks2017.mdf D PRIMAR
Y 276824064 35184372080640 1 0 0 733940A8-D019-4DC5-80F8-13E869A504EC 0 0 215285760 512 1 NULL 0 00000000-0000-0000-0000
-000000000000 0 1 NULL NULL
AdventureWorks2017_log C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017RTM\MSSQL\DATA\AdventureWorks2017_log.ldf
L NULL 75497472 2199023255552 2 0 0 B166C891-E43F-42DA-87FC-8D7F34022B35 0 0 0 512 0 NULL 0 00000000-0000-0000-0000-0000
00000000 0 1 NULL NULL

(2 rows affected)
~~~~

## Run the restore, note the use of the logical not physical file names in the command
~~~~
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ scsql -i restore_AdventureWorks_full.sql
restore database AdventureWorks from disk = '/tmp/AdventureWorks2017.bak'
with recovery,
move 'AdventureWorks2017' to '/var/opt/mssql/data/adventureworks.mdf',
move 'AdventureWorks2017_log' to '/var/opt/mssql/data/adventureworks.ldf'
;

Processed 26280 pages for database 'AdventureWorks', file 'AdventureWorks2017' on file 1.
Processed 3 pages for database 'AdventureWorks', file 'AdventureWorks2017_log' on file 1.
Converting database 'AdventureWorks' from version 869 to the current version 904.
Database 'AdventureWorks' running the upgrade step from version 869 to version 875.
Database 'AdventureWorks' running the upgrade step from version 875 to version 876.
Database 'AdventureWorks' running the upgrade step from version 876 to version 877.
Database 'AdventureWorks' running the upgrade step from version 877 to version 878.
Database 'AdventureWorks' running the upgrade step from version 878 to version 879.
Database 'AdventureWorks' running the upgrade step from version 879 to version 880.
Database 'AdventureWorks' running the upgrade step from version 880 to version 881.
Database 'AdventureWorks' running the upgrade step from version 881 to version 882.
Database 'AdventureWorks' running the upgrade step from version 882 to version 883.
Database 'AdventureWorks' running the upgrade step from version 883 to version 884.
Database 'AdventureWorks' running the upgrade step from version 884 to version 885.
Database 'AdventureWorks' running the upgrade step from version 885 to version 886.
Database 'AdventureWorks' running the upgrade step from version 886 to version 887.
Database 'AdventureWorks' running the upgrade step from version 887 to version 888.
Database 'AdventureWorks' running the upgrade step from version 888 to version 889.
Database 'AdventureWorks' running the upgrade step from version 889 to version 890.
Database 'AdventureWorks' running the upgrade step from version 890 to version 891.
Database 'AdventureWorks' running the upgrade step from version 891 to version 892.
Database 'AdventureWorks' running the upgrade step from version 892 to version 893.
Database 'AdventureWorks' running the upgrade step from version 893 to version 894.
Database 'AdventureWorks' running the upgrade step from version 894 to version 895.
Database 'AdventureWorks' running the upgrade step from version 895 to version 896.
Database 'AdventureWorks' running the upgrade step from version 896 to version 897.
Database 'AdventureWorks' running the upgrade step from version 897 to version 898.
Database 'AdventureWorks' running the upgrade step from version 898 to version 899.
Database 'AdventureWorks' running the upgrade step from version 899 to version 900.
Database 'AdventureWorks' running the upgrade step from version 900 to version 901.
Database 'AdventureWorks' running the upgrade step from version 901 to version 902.
Database 'AdventureWorks' running the upgrade step from version 902 to version 903.
Database 'AdventureWorks' running the upgrade step from version 903 to version 904.
RESTORE DATABASE successfully processed 26283 pages in 2.458 seconds (83.535 MB/sec).
~~~~

## Database has been restored
~~~~
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ scsql -i /home/ahbaidg/github/learn/mssql/databases.sql
select database_id, name, physical_database_name, compatibility_level, state, state_desc from sys.databases;

database_id name physical_database_name compatibility_level state state_desc
----------- ---- ---------------------- ------------------- ----- ----------
1 master master 150 0 ONLINE
2 tempdb tempdb 150 0 ONLINE
3 model model 150 0 ONLINE
4 msdb msdb 150 0 ONLINE
5 AdventureWorks AdventureWorks 140 0 ONLINE

(5 rows affected)
~~~~

## Set compatibility level to 2019 - 150
~~~~
1> alter database AdventureWorks set compatibility_level = 150;
2> go
~~~~

## Validate
~~~~
ahbaidg@safa:~/github/learn/mssql/AdventureWorks/restore$ sqlsc -i /home/ahbaidg/github/learn/mssql/compatibility-settings.sql
set nocount on
use master

Changed database context to 'master'.

select name, compatibility_level, compatibility_setting =
case cast(compatibility_level as varchar)
   when '150' then 'SQL Server 2019 supports 150,140,130,120,110,100'
   when '140' then 'SQL Server 2017 supports 140,130,120,110,100'
   when '130' then 'SQL Server 2016 supports 130,120,110,100'
   when '120' then 'SQL Server 2014 supports 120,110,100'
   when '110' then 'SQL Server 2012 supports 110,100,90'
   when '100' then 'SQL Server 2008 supports 100,90,80'
   when '90'  then 'SQL Server 2005 supports 90,80'
   when '80'  then 'SQL Server 2000 supports 80'
   else cast(compatibility_level as varchar)
end
from sys.databases;

name
         compatibility_level compatibility_setting
------------------------------------------------------------------------------------------------------------------------
-------- ------------------- ------------------------------------------------
master
                         150 SQL Server 2019 supports 150,140,130,120,110,100
tempdb
                         150 SQL Server 2019 supports 150,140,130,120,110,100
model
                         150 SQL Server 2019 supports 150,140,130,120,110,100
msdb
                         150 SQL Server 2019 supports 150,140,130,120,110,100
AdventureWorks
                         150 SQL Server 2019 supports 150,140,130,120,110,100
~~~~
