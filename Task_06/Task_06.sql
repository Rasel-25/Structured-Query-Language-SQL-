 create database VU15

create table Students(
ID int primary key,
Name varchar(10),
CGPA float,
Session varchar(10)
);

select *from Students

insert into Students values
(1,'Jackson',3.56,'Fall-17'),
(2,'Ronald',3.84,'Spring-16'),
(3,'Jemmy',3.96,'Fall-17'),
(4,'Sara',2.88,'Fall-17')

select   distinct Session from Students



 sp_helptext Students 

/* 1 Create a view vStudentInfo that will contain id, name, session */

 create view vStudentInfo 
 as 
 select id, name,session from Students

 select *from vStudentInfo

 sp_helptext vStudentInfo

 /* 2 Update session  spring-15 where ID is 3. */

 update vStudentInfo
 set Session='Fall-17'
 where id=3

 /* 3 Delete from vStudentInfo where
    name is sara and session is Spring-16.  */

 delete from vStudentInfo
 where name = 'sara' and session='Fall-17'


 /* 4  Insert another record containing 
       information (5, ‘Ratul’, 3.88, ‘Spring-15’). 

      a) Note: use vStudentInfo to insert the information 

      b)  Use main table if required but without 
         using id, name, session for condition. */

insert into vStudentInfo values
(6, 'Rasel', 'summer-17')

update Students
set CGPA = 3.65
where CGPA is NULL;

select *from vStudentInfo
select *from Students

/* 5 Modify the view name to vStudent. */

sp_rename 'vStudentInfo', 'vStudent'

select *from vStudent

sp_helptext vStudent


/* 6 Drop the view vStudent but keep the record to another view vSTD */

create view vSTD
 as 
 select id, name,session from vStudent

select *from vSTD

 drop view  vStudent



 create view vStudent
 as
 select name from VUtudents

 sp_helptext vstd



 /* Task 2 */

 
create table Departments(

DeptID int primary key,
DeptName varchar(10)
);


create table EmployeeInfo(
ID int primary key,
Name varchar(50),
Gender varchar(30),
DepartmentID int foreign key  references Departments(DeptID)
);

select *from EmployeeInfo
select *from Departments

insert into Departments values
   (1,'IT'),
   (2,'Payroll'),
   (3,'HR'),
   (4,'Admin');

insert into EmployeeInfo values
(1, 'Jhon',	'Male',	3),
(2,'Mickey','Male',2),
(3,	'Ronald','Male',1),
(4,'Sara','Female',4),
(5,	'Michel', 'Male', 1),
(6,'Smith', 'Male' ,3);




 /* 1 Create a view vEmployee that will contain id,
   name, deptId, deptName. */

create view vEmployee 
as 
select id, name, deptId, deptName  from  EmployeeInfo
inner join Departments 
on Departments.DeptID=EmployeeInfo.DepartmentID

select *from vEmployee



ALTER view vEmployee

drop COLUMN deptId;

ALTER  view dbo.vEmployee
DROP COLUMN  deptId;



 


