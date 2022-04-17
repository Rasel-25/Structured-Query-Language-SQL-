 
 create database BD

create table Department(
DeptId int primary key,
DeptName varchar(10), 
Location varchar(10)
);

create table Employee(
ID int primary key,
First_Name varchar(10),
Last_Name varchar(10),
Gender varchar(10),
joining_date datetime,
salary int, 
DepartmentID int foreign key references Department(DeptId)
);


Drop table Department
Drop table Employee


insert into Department values
(1,'IT ','London' ),
(2,'Payrol','Dhaka'),
(3,'CSE','Rajshahi' ),
(4,'Admin','Nator' )


insert into Employee values
	(1,'Sazzad','Hossain','Male','2016-01-04',30000,1),
	(2,'Samia','Sultana','Female','2015-01-01',25000,2),
	(3,'Sania','Zahan','Female','2015-06-07',27000,1),
	(4,'M.','Rasel','Male','2015-01-09',28000,3),
	(5,'Ashraful','Islam','Male','2016-04-05',29000,4),
	(6,'Saddam','Hossain','Male','2016-06-06',24000,3),
	(7,'Tanzila','Zinat','Female','2012-01-01',2900,4);



select *from Employee
select *from Department


/* 1 Create a procedure to get all employees. */ 

create proc employees
as
begin 
	select * from Employee
end 

exec employees

/* 2 Create a procedure to get all employees except gender,
joiningDate, salary, departmentId. */

create proc employees_info
as
begin
select ID, First_Name,Last_Name from  Employee
end

exec employees_info

/* 3 Create a procedure to get all employee 
firstName, lastName, deptName. */

create proc SP_employee
as
begin
select  First_Name,Last_Name,  DeptName
		from Department inner join  Employee
		on Department.DeptId=Employee.DepartmentID
end

exec SP_employee

/* 4 Create a procedure to get employee id,
fullName, salary, dept filter by id. */

create procedure SP_Update_employees
@Eid int
as 
begin

select ID, (First_Name+ ' '+Last_Name) as FullName, salary, DeptName
       from Department  join Employee
            on Department.DeptId= Employee.DepartmentID 

where ID=@Eid; 

end

exec SP_Update_employees 5;


/* 5 Create a procedure to update location matched by deptName. */

create proc SP_update_location

@UP_deptName varchar(20),
@UP_location varchar(20)

as
begin 
	update Department 
	set location=@UP_location
	where deptName=@UP_deptName;
end 

exec SP_update_location  'CSE', 'Rajshahi'

select *from Department

/* 6 Create a  procedure to update deptName matched by id. */

create view Employee_Info as

select ID, First_Name, Last_Name,  DeptName
       from Department  join Employee
            on Department.DeptId= Employee.DepartmentID 

select *from Employee_Info


/* Update deptname */

create proc SP_update_deptName
@Eid int,
@UP_deptName varchar(20)
as
begin 
	update Employee_Info 
	set deptName=@UP_deptName
	where ID=@Eid;
end 

exec SP_update_deptName  3, 'EEE'

select *from Employee_Info


select *from Employee
select *from Department