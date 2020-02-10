-- Credit: https://www.red-gate.com/simple-talk/blogs/hierarchical-queries-with-common-table-expressions/ 
-- See also: https://docs.microsoft.com/en-us/sql/t-sql/queries/with-common-table-expression-transact-sql?view=sql-server-2017

-- Create Table
CREATE TABLE EMP ( 
EmpID   int    PRIMARY KEY, 
EmpName varchar(30), 
MgrID   int FOREIGN KEY REFERENCES Emp(EmpID) 
);
    
-- Index for performance on foregin key
CREATE NONCLUSTERED INDEX emp_empid ON Emp(MgrID) ;
    
-- Populate the table with data 
insert into emp values(1, ‘President’, NULL );
insert into emp values(2, ‘Vice President’, 1 );
insert into emp values(3, ‘CEO’, 2 );
insert into emp values(4, ‘CTO’, 2 );
insert into emp values(5, ‘Group Project Manager’, 4 );
insert into emp values(6, ‘Project Manager 1’, 5 );
insert into emp values(7, ‘Project Manager 2’, 5 );
insert into emp values(8, ‘Team Leader 1’, 6 );
insert into emp values(9, ‘Software Engineer 1’, 8 );
insert into emp values(10, ‘Software Engineer 2’, 8 );
insert into emp values(11, ‘Test Lead 1’, 6 );
insert into emp values(12, ‘Tester 1’, 11 );
insert into emp values(13, ‘Tester 2’, 11 );
insert into emp values(14, ‘Team Leader 2’, 7 );
insert into emp values(15, ‘Software Engineer 3’, 14 );
insert into emp values(16, ‘Software Engineer 4’, 14 );
insert into emp values(17, ‘Test Lead 2’, 7 );
insert into emp values(18, ‘Tester 3’, 17 );
insert into emp values(19, ‘Tester 4’, 17 );
insert into emp values(20, ‘Tester 5’, 17 );

-- CTE Hierarchical Query Example
WITH ReportingTree (EmpID, EmpName, MgrID, Lvl) 
AS 
( 
    -- Anchor Member 
    SELECT *, 0 as Lvl FROM emp WHERE MgrId IS NULL 
    UNION ALL 
    -- Recusive Member 
    SELECT emp.EmpID, emp.EmpName, emp.MgrId, ReportingTree.Lvl+1 
    FROM emp INNER JOIN ReportingTree 
        on emp.MgrID = ReportingTree.EmpID 
) 
SELECT * FROM ReportingTree;
