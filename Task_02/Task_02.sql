

create table Department(
    departmentID int primary key,
    departmentName varchar(15),
    location varchar(50)
);
create table Student(
    ID int primary key ,
    first_name varchar(15),
    last_name varchar(15),
    addrss varchar(50),
    age int,
    deptID int foreign key references Department(departmentID)
);
 
 insert into Department values
    (1,'CSE','Talaimari'),
    (2,'EEE','Kazla'),
    (3,'ECE','Vodra'),
    (4,'IT','Railgate')   
 

insert into Student values
    (1, 'Ruhul', 'Amin','Rajshahi',21,1),
    (2, 'Anayet', 'Sabbir','Dhaka',22,2),
    (3, 'Shahinur', 'Akter','Naoga',23,4),
    (4, 'Israt', 'Jahan','Saidpur',24,1),
    (5, 'Asik','Khan','Rangamati',25,2),
    (6, 'Zahid','Hasan','Natore',26,1);

 
 
select * from Student;
select * from Department;


/* 1.	Show all the information from both table which
are match without joining.*/

select *from Department, Student
where Department.Departmentid=Student.deptID


/*2. Show all the information form both table which 
are match using joining.*/

select *from Department full join Student
on Department.departmentID = Student.DeptID;



/* 3.	Show firstName, lastName, address, deptName 
and location.*/

select first_Name, last_Name,address,departmentName , 
location from Department inner join Student
on Department.departmentID = Student.DeptID;

/* 4.	Show firstName, lastName, age and deptName.*/

select first_Name, last_Name, age ,departmentName 
 from Department inner join Student
on Department.departmentID = Student.DeptID;


/* 5.	Show all the deptName but the students firstName, lastName 
who study in any department.*/

select departmentName, first_name, last_name
from Department full join student 
on Department.departmentID = Student.DeptID;

/* 6. Show all the students fullName,
addresss and their respective departments.*/

select first_name+' '+ last_name as fullName, 
address, departmentName from Student left join Department 
on Department.departmentID = Student.DeptID;


/* 7 Delete all the table completely  */

/*drop table department */
/*drop table Student*/

/* 8.	create again with primary and foreign key. */

create table Department(
    departmentID int primary key,
    departmentName varchar(15),
    location varchar(50)
);
 
create table Student(

    ID int primary key ,
    first_name varchar(15),
    last_name varchar(15),
    address varchar(50),
    age int,
    deptID int foreign key references Department(departmentID)
);


 /* 9.	Show all the information of the student 
 which department is CSE. */

select *from Department inner join Student
on Department.departmentID = Student.DeptID
where  departmentName='CSE';

/*  10.	Show firstName, lastName, age and deptName of the
student which age is minimum from each department.*/

select first_Name, last_Name, age,departmentName
from Student inner join Department
on  Department.departmentID = Student.DeptID
WHERE age IN( SELECT MIN(age) FROM Student
GROUP BY deptID);
