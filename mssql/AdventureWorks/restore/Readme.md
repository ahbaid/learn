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

