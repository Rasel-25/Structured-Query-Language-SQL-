
create table Worker(
worker_ID int primary key,
First_Name varchar(10),
Last_Name varchar(10),
salary int, 
joinong_date datetime,
Department varchar(20)
);


create table Title(
worker_ref_id int foreign key references Worker(WORKER_ID),
worker_title varchar(20), 
affected_from datetime
);

create table Bonus( 
worker_ref_id int foreign key references Worker(WORKER_ID),
bonus_date datetime,
bonus_amount int
);


insert into Worker values
(1,'Monika','Kabir',100000,'2014-02-20 09:00:00','HR'),
(2,'Naznin','Akhter',80000,'2014-06-11 09:00:00','Admin'),
(3,'Anik','Muktadir',300000,'2014-02-20 09:00:00','HR'),
(4,'Bishal','kumar',500000,'2014-02-20 09:00:00','Admin'),
(5,'Bijoya','Biswas',500000,'2014-06-11 09:00:00','Admin'),
(6,'Shakil','Ahmed',200000,'2014-06-11 09:00:00','Account'),
(7,'Zakaria','Islam',75000,'2014-01-20 09:00:00','Account'),
(8,'Nusrat','Zereen',90000,'2014-04-11 09:00:00','Admin')

insert into Bonus values
(1,'2016-02-20 00:00:00',5000),
(2,'2016-06-11 00:00:00',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500)


insert into Title values
(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst. Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00')


select *from Worker
select *from Bonus
select *from Title

/* Q-1. Write an SQL query to fetch “FIRST_NAME” 
from Worker table using the alias name as <WORKER_NAME>. */

select First_Name as WORKER_NAME from Worker

/* Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker
table in upper case. */
select upper(First_Name) as  First_Name from Worker


/* Q-3. Write an SQL query to fetch unique 
values of DEPARTMENT from Worker table. */

select distinct department  from worker;

 

/* Q-4. Write an SQL query to print the first 
three characters of  FIRST_NAME from Worker table. */
select substring(first_name,1,3) as first_name from worker; 

 

/* Q-5. Write an SQL query to find the position 
of the alphabet (‘a’) in the first name column
‘Naznin’ from Worker table. */

select charindex('a',first_name) from worker
where first_name='Naznin';


/*  Q-6. Write an SQL query to print the FIRST_NAME
from Worker table after removing white 
spaces from the right side. */

SELECT RTRIM(first_name) FROM worker;


/* Q-7. Write an SQL query to print the DEPARTMENT 
from Worker table after removing 
white spaces from the left side. */

Select LTRIM(department) from worker;

 
/* Q-8. Write an SQL query that fetches the unique
values of DEPARTMENT from Worker table
and prints its length. */

Select distinct len(department) from worker;

 
/* Q-9. Write an SQL query to print the FIRST_NAME 
from Worker table after replacing ‘a’ with ‘A’. */

Select REPLACE(first_name,'a','A') from worker;

 
/* Q-10. Write an SQL query to print the FIRST_NAME 
and LAST_NAME from Worker table into a single column 
COMPLETE_NAME. A space char should separate them. */

Select CONCAT(first_name, ' ', last_name) AS 'COMPLETE_NAME'
from worker;



