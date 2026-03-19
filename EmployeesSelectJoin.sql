--Creating new database
CREATE DATABASE Samrjakov1903;
USE Samrjakov1903;

--Creating Department table
create table Department
(
ID int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)

--Creating Employees table
create table Employees
(
ID int primary key,
Name nvarchar(50),
Gender nvarchar(10),
Salary nvarchar(50),
DepartmentID int
)

--Inserting data into Department table
insert into Department (ID, DepartmentName, Location, DepartmentHead)
values (1, 'IT', 'London', 'Rick')
insert into Department (ID, DepartmentName, Location, DepartmentHead)
values (2, 'Payroll', 'Delhi', 'Ron')
insert into Department (ID, DepartmentName, Location, DepartmentHead)
values (3, 'HR', 'New York', 'Christie')
insert into Department (ID, DepartmentName, Location, DepartmentHead)
values (4, 'Other Deparment', 'Sydney', 'Cindrella')

select * from Department --Checking results from Department

--Inserting data into Employees table
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (1, 'Tom', 'Male', 4000, 1)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (2, 'Pam', 'Female', 3000, 1)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (3, 'John', 'Male', 3500, 1)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (4, 'Sam', 'Male', 4500, 2)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (5, 'Todd', 'Male', 2800, 1)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (6, 'Ben', 'Male', 7000, 1)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (7, 'Sara', 'Female', 4800, 3)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (8, 'Valarie', 'Female', 5500, 1)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (9, 'James', 'Male', 6500, NULL)
insert into Employees (ID, Name, Gender, Salary, DepartmentID)
values (10, 'Russell', 'Male', 8800, NULL)

select * from Employees

--Selecting Names and DepartmentIDs from Employees
select distinct FirstName, DepartmentID from Employees

--Selecting total salary of all employees
select sum(cast(Salary as int)) AS CombinedSalary from Employees
--Selecting minimal salary from all employees
select min(cast(Salary as int)) AS MinimalSalary from Employees

alter table Employees
add City nvarchar(25)


alter table Employees
add DepartmentId
int null


--Adds MiddleName column to Employees table
alter table Employees
add MiddleName nvarchar(30)

--Adds LastName column to Employees table
alter table Employees
add LastName nvarchar(30)

--Renames Name from Employees table to FirstName.
Exec sp_rename 'Employees.Name', 'FirstName', 'Column';


--Updating Data in Employees table
update Employees set FirstName = 'Tom', MiddleName = 'Nick', LastName = 'Jones'
where ID = 1
update Employees set FirstName = 'Pam', MiddleName = NULL, LastName = 'Anderson'
where ID = 2
update Employees set FirstName = 'John', MiddleName = NULL, LastName = NULL
where ID = 3
update Employees set FirstName = 'Sam', MiddleName = NULL, LastName = 'Smith'
where ID = 4
update Employees set FirstName = NULL, MiddleName = 'Todd', LastName = 'Someone'
where ID = 5
update Employees set FirstName = 'Ben', MiddleName = 'Ten', LastName = 'Sven'
where ID = 6
update Employees set FirstName = 'Sara', MiddleName = NULL, LastName = 'Connor'
where ID = 7
update Employees set FirstName = 'Valarie', MiddleName = 'Balerine', LastName = NULL
where ID = 8
update Employees set FirstName = 'James', MiddleName = '007', LastName = 'Bond'
where ID = 9
update Employees set FirstName = NULL, MiddleName = NULL, LastName = 'Crowe'
where ID = 10


--Takes the filled cell in the first column from each row and displays only that cell
select ID, coalesce(FirstName, MiddleName, LastName) as Name
from Employees

select * from Employees
select * from Department
select * from Employees
select * from Department

--seosed - join
--füüsiline seos - on lisatud Foreign key (constraint - piirang näiteks kontrollida diagrammil)
--loogiline seos - kui õigesti kirjutatada select joiniga


--JOIN
SELECT * FROM Employees JOIN Department
ON Employees.DepartmentId=Department.Id;

--kirjutame lihtsamaks
SELECT e.FirstName, e.Salary, d.DepartmentName
FROM Employees e JOIN Department d
ON e.DepartmentId=d.Id;

--inner join sama nagu lihtne join
--näitab kõik department, kus on olemas väärtus
SELECT e.FirstName, e.Salary, d.DepartmentName
FROM Employees e  INNER JOIN Department d
ON e.DepartmentId=d.Id;

--left join
--näitab kõike DepartmentName (Null väärtused)
SELECT e.FirstName, e.Salary, d.DepartmentName
FROM Employees e  LEFT JOIN Department d
ON e.DepartmentId=d.Id;

--right join
--näitab Detartname, kus Name on null 
--RIGHT JOIN =RIGHT OUTER JOIN
SELECT e.FirstName, e.Salary, d.DepartmentName
FROM Employees e  RIGHT JOIN Department d
ON e.DepartmentId=d.Id

--outer join = full outer join 
--näitab kõik väärtused kahest tabelist
SELECT e.FirstName, e.Salary, d.DepartmentName
FROM Employees e  FULL OUTER JOIN Department d
ON e.DepartmentId=d.Id
--cross join - Näitab nii, et 1.tabeli väärtused * 2.tabeli väärtused
SELECT FirstName, Salary, DepartmentName
FROM Employees CROSS JOIN Department;

-- Näidata ainult need isikud, kellel departmentName on null
CREATE VIEW IsikudIlmaDepartmenta AS
SELECT e.FirstName, e.Salary, d.DepartmentName
FROM Employees e  LEFT JOIN Department d
ON e.DepartmentId=d.Id
WHERE d.DepartmentName is Null;

Select * From IsikudIlmaDepartmenta;


Alter table employees ADD managerID int;

Select * from employees;

Update employees set managerID=2
Where Gender='Male';

--tabel Manager
CREATE TABLE manager(
id int primary key,
managerName varchar(25))

INSERT INTO manager(id, managerName)
VALUES (1, 'Roman'), (2, 'Nikita');
select * from manager;
Select * from employees;

--teha kõik join'id
--ja kirjutada mida nad näitavad
--Näitab ainult need töötajad kellel on olemas manager
SELECT e.FirstName, m.ManagerName
FROM Employees e INNER JOIN manager m
ON e.managerID = m.ID;
--Näitab töötajaid ka null värtusega
Select e.FirstName, m.managerName m
FROM Employees e LEFT JOIN manager m
ON e.managerID = e.ID;
