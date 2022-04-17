

create table Worker(
worker_ID int primary key,
First_Name varchar(10),
Last_Name varchar(10),
salary int, 
joining_date datetime,
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

/*Q-11. Write an SQL query to print all 
Worker details from the Worker table order 
by FIRST_NAME Ascending. */

Select * from Worker
order by FIRST_NAME asc;



/* Q-12. Write an SQL query to print all Worker
details from the Worker table
order by FIRST_NAME Ascending and DEPARTMENT Descending. */

Select * from Worker 
order by FIRST_NAME asc,DEPARTMENT desc;


/* Q-13. Write an SQL query to print details 
for Workers with the first
name as “Bishal” and “Shakil” from Worker */

Select * from Worker 
where FIRST_NAME in ('Bishal','Shakil');

/* Q-14. Write an SQL query to print
details of workers excluding 
first names, “Bishal” and “Shakil” from Worker */

Select * from Worker
where FIRST_NAME not in ('Bishal','Shakil');

/* Q-15. Write an SQL query to print 
details of Workers with DEPARTMENT name as “Admin”. */

Select * from Worker
where DEPARTMENT = 'Admin';

/* Q-16. Write an SQL query 
to print details of the Workers whose 
FIRST_NAME contains ‘a’. */

Select * from Worker 
where FIRST_NAME like '%a%';

/* Q-17. Write an SQL query to print details
of the Workers whose FIRST_NAME ends with ‘a’.*/

Select * from Worker 
where FIRST_NAME like '%a';

/* Q-18. Write an SQL query to print
details of the Workers whose 
FIRST_NAME ends with ‘n’ and contains six alphabets.*/

Select * from Worker
where FIRST_NAME like '_____n';

/* Q-19. Write an SQL query to print details of
the Workers whose SALARY lies between 100000 and 500000. */

Select * from Worker
where SALARY between 100000 and 500000;

/* Q-20. Write an SQL 
query to print details of the 
Workers who have joined in Feb’2014. */

Select * from Worker
where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

 
 /* Q-21. Write an SQL query to 
 fetch the count of employees 
 working in the department ‘Admin’. */

 SELECT COUNT(*) FROM worker 
 WHERE DEPARTMENT = 'Admin';

 /* Q-22. Write an SQL query to
 fetch worker names with salaries >= 50000 and <= 100000.*/
 
 SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary FROM worker 
WHERE WORKER_ID IN (SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

/*Q-23. Write an SQL query to fetch the 
no. of workers for each department in the descending order. */

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers desc ;

/* Q-24. Write an SQL query to print details
of the Workers who are also Managers. */

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE FROM Worker W JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
where T.WORKER_TITLE in ('Manager');

/* Q-25. Write an SQL query to fetch 
duplicate records having 
matching data in some fields of a table. */

SELECT worker_title, affected_from, COUNT(*) FROM title
GROUP BY worker_title, affected_from
HAVING COUNT(*) > 1;

/* Q-26. Write an SQL query to show 
only odd rows from a table. */

SELECT * FROM Worker
WHERE MOD(WORKER_ID, 2)<> 0;

/* Q-27. Write an SQL query to show 
only even rows from a table. */
SELECT * FROM Worker WHERE MOD (WORKER_ID,2) = 0;

/* Q-28. Write an SQL query to 
clone a new table from another table.*/

SELECT * INTO WorkerClone FROM Worker;

/* Q-29. Write an SQL query to 
fetch intersecting records of two tables. */

(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

/* Q-30. Write an SQL query to show records
from one table that another table does not have.*/

SELECT * FROM Worker
MINUS
SELECT * FROM Title;










