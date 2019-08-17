FLASK 

# Links
* https://docs.microsoft.com/en-us/sql/relational-databases/databases/attach-a-database?view=sql-server-2017
* https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-2017
* https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks
* https://docs.microsoft.com/en-us/sql/t-sql/statements/restore-statements-transact-sql?view=sql-server-2017#restoring_db_n_move_files
* https://docs.microsoft.com/en-us/sql/t-sql/statements/restore-statements-headeronly-transact-sql?view=sql-server-2017

# Pre-requisites:
* Download the backup file and put it in a lcoation on the db server, (example: /tmp/AdventureWorks.bak)
* The restore command expects the file to be physicall on the server

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
