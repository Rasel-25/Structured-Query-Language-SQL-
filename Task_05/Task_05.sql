
create table Teacher(
TID int primary key,
FirstName varchar(10),
LastName varchar(10),
Dept  varchar(10),
Age int,
salary int

);

select *from teacher 



create table Student(
ID int primary key,
Name varchar(10),
Dept  varchar(10),
Semester int,
CourseCode  varchar(10),
Age int,
CreditTaken int,
TeacherID int foreign key references Teacher(TID)
);


select *from Student 

insert into teacher values
(1,'Meraj','Ali','CES',25,30000),
(2,'Sanjir','Shishir','CES',24,31000),
(3,'Moshiur','Rahman','EEE',23,29000),
(4,'Symun','Islam','EEE',24,36000),
(5,'Sazzed','Islam','ECE',22,28000),
(6,'Samia','Sultana','CES',26,30000),
(7,'Arifa','Ferdoushi','ECE',30,50000)


insert into Student values 	
(1,'Noor','CSE',7,'CSE-313',22,3,1), 
(2,'Arko','EEE',6,'EEE-231',21,4,7), 
(3,'Raul','ECE',8,'ECE-341',23,3,5), 	
(4,'Tonu','EEE',5,'EEE-221',20,4,4), 	
(5,'Rashmi','CSE',7,'CSE-314',23,1,1), 	
(6,'Sanjida','ECE',6,'ECE-231',22,3,7), 
(7,'Mamun','CSE',7,'ECE-316',24,4,NULL);

select *from Teacher; 
select *from Student;

/* 1 */
select  FirstName, LastName, teacher.Dept,
Salary, semester, CourseCode, CreditTaken
from  Teacher inner join Student 
on Teacher.Tid=student.Teacherid
where CreditTaken>1


/* 2.	List the number of students,
assign teacher name with credit those 
who taken salary according to their department. */

select  count(id) as Students_Number, FirstName,
LastName, Salary, Teacher.Dept, 
sum(CreditTaken) as Total_Credit from Teacher inner join Student 
on Teacher.TID=Student.TeacherID 
 group by  Teacher.Dept, FirstName, LastName, Salary

 /* 3.	Write an SQL Query to print the FirstName,
 LastName, Dept, Salary, CourseCode and
 CreditTaken of the Teacher who’s Salary 
 between 30000 to 40000. */ 

select FirstName, LastName, Teacher.Dept, Salary,  CourseCode, CreditTaken 
 from Teacher left join Student
 on Teacher.TID=Student.TeacherID
 where Salary>=30000 and Salary<=40000

 /* 4 */

 select FirstName, Teacher.Dept ,Salary,  semester,
 CourseCode, CreditTaken from 
 Teacher left join Student
 on Teacher.TID=Student.TeacherID
 order by Teacher.Dept asc

 /* 5.	Write down the query to show the following 
 result where semester is asending order.
Output is: */
select FirstName, Teacher.Dept ,Salary,  semester,
 CourseCode, CreditTaken from 
 Teacher inner join Student
 on Teacher.TID=Student.TeacherID
 order by semester asc

 /* 6*/

 select FirstName, Teacher.Dept ,Salary,  semester,
 CourseCode, CreditTaken from 
 Teacher inner join Student
 on Teacher.TID=Student.TeacherID
 order by CreditTaken desc

 /* 7.	Delete all student whose name is 
 ‘Arko and semester is 6.*/

 delete from Student
where name='Arko' or semester= 6


/* 8.	Delete all teacher whose Firstname is ‘Faruk’.*/
 delete from Teacher
where FirstName='Symun'

/* 9.	Find max Salary, FirstName,CreditTaken from each
department where max salary is rename to “TotalSalary” 
and Dept whose CourseCode name end with “31”.*/

 select max(Salary) as TotalSalary, FirstName,
 CreditTaken,Teacher.Dept  from 
 Teacher inner join Student
 on Teacher.TID=Student.TeacherID
where CourseCode  like '%31'
group by  Teacher.Dept, FirstName,CreditTaken

