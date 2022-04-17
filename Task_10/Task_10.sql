/* Rasel Mahamud 
ID 172311030
section A
Dept: CSE
*/


create table Worker
(worker_id int primary key,
 first_name varchar(55),
 last_name varchar(55),
 salary int,
 joining_date date,
 department varchar(55)
 )

 create table Bonus
 (worker_ref_id int foreign key references Worker(worker_id),
  bonus_date date,
  bonus_amount int
  )

  insert into Worker values
  (001	,'Monika',	'Arora',	100000,'2014-02-20' ,'HR'),
  (002	,'Niharika',	'Verma'	,80000	,'2014-06-11' 	,'Admin'),
  (003	,'Vishal',	'Singhal'	,300000	,'2014-02-20' 	,'HR'),
  (004,	'Amitabh',	'Singh',	500000	,'2014-02-20' ,	'Admin'),
  (005	,'Vivek',	'Bhati',	500000,	'2014-06-11', 	'Admin'),
  (006	,'Vipul',	'Diwan'	,200000,	'2014-06-11' 	,'Account'),
  (007	,'Satish',	'Kumar'	,75000,	'2014-01-20' ,	'Account'),
  (008	,'Geetika',	'Chauhan',	90000	,'2014-04-11' ,	'Admin')

  select * from Worker

  insert into Bonus values
  (001,	'2016-02-20', 	5000),
(002	,'2016-06-11' 	,3000),
(003	,'2016-02-20' 	,4000),
(001	,'2016-02-20' 	,4500),
(002	,'2016-06-11' 	,3500)
 

select * from Bonus



/* 1.	Create a view like “vwEmployeeSalaryDetails” in this view 
find number of Worker of each department, average and summation of that Amount.*/

create view vwEmployeeSalaryDetails as
select Department, count(worker_id) as Number_of_worker, avg(salary) as Avg_salary,
 sum(salary) as Sum_salary from Worker group by department

/*2.	Create a view like “vwEmployeeDetails” in this view find 
the ‘Amount according to Department,BonusDate, Name, Salary who’s Amountbetween 5000 to 4000.*/

create view vwEmployeeDetails as
select worker_id,Department, Bonus_date,first_name as Name,
 Salary from Worker inner join Bonus on Worker.worker_id = Bonus.worker_ref_id 
 where bonus_amount between 4000 and 5000

/* 3. Using “vwEmployeeDetails”  views Update Name “Hello”whose bonus_amount is 5000.
update vwEmployeeDetails set Name ='Monika' from vwEmployeeDetails join Bonus on
 vwEmployeeDetails.worker_id = Bonus.worker_ref_id where bonus_amount = 5000 */

select * from vwEmployeeDetails

/*4.	Create a view like “vwWorkersBonus” in this view to find the position of the
 alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.*/

create view vwWorkersBonus as
select first_name,charindex('a',first_name,2) as Position_number from Worker

/*5.	Create a view like “vwWorkersBonus1” in this view fetches the unique values of
 DEPARTMENT from Worker table and prints its length.*/

create view vwWorkersBonus1 as 
select distinct department, len(department) as T_length from Worker

/* 6.	Write a SQL query to find the rank of worker within each department.*/

select (first_name+' '+last_name) as Name,department, rank() over(partition by department
 order by salary desc) as R_ank from Worker

/*7.	Write a SQL query to find the rank of management Team according to their joining Date.
select (first_name +' '+last_name) as Name, department, 
Joining_date,rank()over(order by joining_date) as Joining_Rank from worker*/

/*8.	Create a view like “vwWorkersBonus2” in this view
 to print the FIRST_NAME from Worker table afterreplacing ‘a’ with ‘A’.*/

create view vwWorkersBonus2 as
select first_name,replace(first_name,'a','A') as Replacing_name from Worker

/*9.	Create a view like “vwWorkersBonus3” in this view to print the FIRST_NAME and LAST_NAME
 from Worker table into a single column COMPLETE_NAME. A space char should separate them.*/

create view vwWorkersBonus3 as 
select (first_name+' '+last_name) as Complete_Name from Worker

/*10.	Create a view like “vwWorkersBonus4” in this view
 to print all Worker details from the Worker table order by FIRST_NAME Ascending.*/

create view vwWorkersBonus4 as
select Worker_id,First_name, Last_name, Salary, Joining_date, 
Department,rank()over(order by first_name asc) as R_ank from Worker 


/*11.	Create a view like “vwWorkersBonus5” in this view to print 
all Worker details from the Worker tableorder by FIRST_NAME 
Ascending and DEPARTMENT Descending.*/

create view vwWorkersBonus5 as
select Worker_id,First_name, Last_name, Salary, Joining_date, 
Department,rank()over(order by first_name asc) 
as Name_rank,rank()over(order by department desc) as Dpt_rank from Worker 


/*12.	Create a view like “vwWorkersBonus6” in this view to print details
 for Workers with the first name as “Vipul” and “Satish” from Worker table.*/

create view vwWorkersBonus6 as
select Worker_id,First_name, Last_name, Salary, Joining_date,
 Department from Worker where first_name = 'Vipul'or first_name= 'Satish'

/*13.	Write an SQL query to find the position of the alphabet
 (‘a’) in the first name column ‘Alamgir’ from Worker table.*/

select charindex('a',first_name,2)as Position from Worker

/*14.	Write an SQL query to print the FIRST_NAME from Worker 
table after removing white spaces from the right side.*/

select rtrim(first_name) as First_name from Worker

/*15.	Write an SQL query to print the DEPARTMENT from Worker 
table after removing white spaces fromthe left side.*/

select ltrim(department) as Department from Worker

/*16.	Create a view like “vwWorkersBonus7” in this view 
to print details of workers excluding first names, 
“Vipul” and “Satish” from Worker table. */

create view vwWorkersBonus7 as
select Worker_id,First_name, Last_name, Salary, Joining_date, 
Department from Worker where first_name != 'Vipul' and first_name!= 'Satish'

/* 17.	Create a view like “vwWorkersBonus8” in this view to print 
details of Workers with DEPARTMENT name as “Admin”.*/

create view vwWorkersBonus8 as
select Worker_id,First_name, Last_name, Salary, Joining_date, 
Department from Worker where department = 'Admin'

/* 18.	Write a SQL query to show worker name, bonus and Rank 
according to salary and rearrange the
project according to salary ascending order.*/

select (first_name+' '+last_name) as Worker_name,Bonus_amount,Salary,
rank()over(order by salary) as 
Salary_rank from Worker join Bonus on Worker.worker_id = Bonus.worker_ref_id

/*19.	Create a view like “vwWorkersBonus9” in this view to print details 
of the Workers whose SALARY lies between 100000 and 500000.*/

create view vwWorkersBonus9 as
select Worker_id,First_name, Last_name, Salary, Joining_date, 
Department from Worker where salary between 100000 and 500000

/* 20.	Create a view like “vwWorkersBonus10” in this view to print 
details of the Workers who has joined in Feb’2014.*/

create view vwWorkersBonus10 as
select Worker_id,First_name, Last_name, Salary, Joining_date, 
Department from Worker where joining_date like '2014-02%'

