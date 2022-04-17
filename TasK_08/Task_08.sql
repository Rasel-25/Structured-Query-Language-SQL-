
create database Raj

create table Department(
DeptID int primary key,
DeptName varchar(30)
);


create table Employee(
ID int,	
NAME varchar(30),
AGE int,
ADDRESS varchar(30),
SALARY float,
DepartmentId int foreign key references Department(DeptId)
);

insert into Department values
(1, 'IT'),
(2,	'ECE'),
(3, 'HR'),
(4, 'Admin');

insert into Employee values
(1,	'John',	20,	'US',	2000,	1),
(2,	'Stephan',	26,	'Dubai',	1500,	2),
(3,	'David',	27,	'Bangkok',	2000,	3),
(4,	'Alina',	29,	'UK',	6500,	4),
(5,	'Kathrin',	34,	'Bangalore',	8500,	1),
(6,	'Harry',	42,	'China',	4500,	2),
(7,	'Jackson',	25,	'Mizoram',	10000,	1);

select *from  Department
select *from Employee

/* 1 Find ID, Name, Salary from employee
who have 3rd highest salary  */ 

SELECT id, name, salary from Employee e1 
where  3-1 = (SELECT COUNT(DISTINCT salary) from  Employee e2 
where e2.salary > e1.salary) 

/*  2  Find ID, Name, salary the lowest salary
which salary which salary between 6000 and 9000 */

SELECT ID, Name, salary FROM Employee
WHERE salary IN  ( SELECT MIN(salary) FROM Employee
where SALARY between  6000 and 9000
);

/* 3 Find ID, Name, Salary, Address who not work in Admin. */

select ID, Name, Salary,  Address from 
 Employee inner join Department
on Department.DeptID=Employee.DepartmentId
where DeptName !='Admin'

/* 4 Update Salary 3% who works in Admin department. */

/* create view */
create view Employee_Info   
	as
	select ID, Name, Salary, Address, DeptName from 
	Employee inner join Department
	on Department.DeptID=Employee.DepartmentId;

	select *from Employee_Info

/* create procedure */

create proc Update_Salary   
@EDeptName varchar(20),
@rate float
as
begin 
	update Employee_Info 
	set salary = salary + salary*@rate
	where DeptName=@EDeptName;
end 

exec Update_Salary  'Admin', 0.03

select *from Employee

/* 5 Find the total salary of the IT department. */

SELECT SUM (salary) FROM 
employee inner join Department
on Department.DeptID=Employee.DepartmentId
WHERE DeptName = 'IT';

/* 6 Delete the employee who have higher salary than average salary*/

/*select avg(salary) as AVG_Salary from Employee; */

delete from Employee
where  salary > (select avg(salary) from Employee);

/* 7 Create procedure spEmpById to see employe ID, Name, 
Salary and DeptName find by ID. */

create procedure spEmpById
@Eid int
as 
begin
select ID,Name, salary, DeptName
from Employee  join Department
on Department.DeptId= Employee.DepartmentID 
where ID=@Eid; 
end

exec spEmpById 3;

/* 8 Create procedure spEmpByName to see employe
ID, Name, Salary and DeptName find by Name. */

create procedure spEmpByName
@EName varchar(20)
as 
begin
select ID,Name, salary, DeptName
from Employee  join Department
on Department.DeptId= Employee.DepartmentID 
where Name=@EName; 
end

exec spEmpByName 'Harry';

/* 9 Create procedure spEmpByDeptName to see  
employe ID, Name, Salary and DeptName find by DeptName. */


create procedure spEmpByDeptName
@EDeptName varchar(20)
as 
begin
select ID,Name, salary, DeptName
from Employee  join Department
on Department.DeptId= Employee.DepartmentID 
where DeptName=@EDeptName; 
end

exec spEmpByDeptName 'IT';

/* 10  Create spUpdateSalary procedure to update salary. (id, rate) */

create proc spUpdateSalary
@EID int,
@rate float
as
begin 
	update Employee
	set salary = salary + salary*@rate
	where ID=@EID;
end 

exec spUpdateSalary  '1', 1.5

select * from Employee


/* 11 Create spUpdateAddress procedure to update address.(id, address) */


create proc spUpdateAddress
@EID int,
@Eaddress varchar(20)
as
begin 
	update Employee
	set address=@Eaddress
	where ID=@EID;
end 

exec spUpdateAddress  '1', 'Rajshahi'

select * from Employee

/* 12 Create spUpdateDeptName  
procedure to update department. (id, DeptName)*/ 

create proc spUpdateDeptName
@EID int,
@EDeptName varchar(20)
as
begin 

	update Employee
	set DepartmentID=(Select DeptID from  Department
	                         where DeptName=@EDeptName)
	where ID=@EID;
end 

exec spUpdateDeptName  '1', 'HR'

select * from Employee









