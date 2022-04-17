create database sohan;

create table Worker(
	WORKER_ID int primary key,
	FIRST_NAME varchar(50),
	LAST_NAME varchar(50),
	SALARY float,
	JOINING_DATE datetime,
	DEPARTMENT varchar(50)
)

create table Bonus(
	WORKER_ID int,
	BONUS_DATE datetime,
	BONUS_AMOUNT float,
	foreign key(WORKER_ID) references Worker
)

create table Title(
	WORKER_ID int,
	WORKER_TITLE varchar(50),
	AFFECTED_FROM datetime,
	foreign key (WORKER_ID) references Worker
)


insert into Worker values
(1,'Rana','Hamid',100000,'2014-02-20 09:00:00','HR'),
(2,'Sanjoy','Saha',80000,'2014-06-11 09:00:00','Admin'),
(3,'Mahmudul','Hasan',300000,'2014-02-20 09:00:00','HR'),
(4,'Asad','Zaman',500000,'2014-02-20 09:00:00','Admin'),
(5,'Sajib','Mia',500000,'2014-06-11 09:00:00','Admin'),
(6,'Alamgir','Kabir',200000,'2014-06-11 09:00:00','Account')

select * from Worker

insert into Bonus values
(1,'2016-02-20 00:00:00',5000),
(2,'2016-06-11 00:00:00',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(5,'2016-06-12 00:00:00',NULL)

insert into Title values
(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst. Manager','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00')


/**Problem - 1***/
select FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT,
WORKER_TITLE, BONUS_AMOUNT  from worker inner join Bonus
on worker.WORKER_ID = Bonus.WORKER_ID inner join Title
on Bonus.WORKER_ID = Title.WORKER_ID
where WORKER_TITLE = 'Executive'


/**Problem - 2***/
select FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT,
WORKER_TITLE, BONUS_AMOUNT  from worker inner join Bonus 
on worker.WORKER_ID = Bonus.WORKER_ID inner join Title 
on Bonus.WORKER_ID = Title.WORKER_ID 
where WORKER_TITLE = WORKER_TITLE


/**Problem - 3***/
select FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT,
WORKER_TITLE, BONUS_AMOUNT  from worker inner join 
Bonus on worker.WORKER_ID = Bonus.WORKER_ID inner join Title 
on Bonus.WORKER_ID = Title.WORKER_ID 
where BONUS_AMOUNT!=0




/**Problem - 4***/
update Worker set SALARY = 10000 from worker inner join Bonus 
on worker.WORKER_ID = Bonus.WORKER_ID inner join Title 
on Bonus.WORKER_ID = Title.WORKER_ID where WORKER_TITLE = 'Manager'

/**Problem - 5***/
Delete from Bonus where BONUS_AMOUNT=NULL

/**Problem - 6***/
select FIRST_NAME+' '+LAST_NAME as Complete_Name  from Worker

/**Problem - 7***/
select FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT,
WORKER_TITLE, BONUS_AMOUNT  from worker inner join Bonus 
on worker.WORKER_ID = Bonus.WORKER_ID inner join Title
on Bonus.WORKER_ID = Title.WORKER_ID 
where FIRST_NAME = 'Rana'  or FIRST_NAME = 'Sajib'

/**Problem - 8***/
select FIRST_NAME from Worker where FIRST_NAME like '%______r' 
and len(FIRST_NAME)=7

/**Problem - 9***/
select FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT 
from Worker 
where SALARY>=100000 and SALARY<=500000

/**Problem - 10***/
select DEPARTMENT,SUM(SALARY) from Worker group by (DEPARTMENT)

/**Problem - 11***/
select FIRST_NAME,SALARY from Worker where SALARY
in (select max(SALARY) from Worker)
