/* Rasel Mahamud 
ID 172311030
section A
Dept: CSE
*/

Create database VU

create table sectionA(
ID int,
Name varchar(10),
Email varchar(30)
);


create table sectionB(
ID int,
Name varchar(10),
Email varchar(30)
);

 insert into sectionA values
 (1, 'fariha', 'fariha@gmail.com'),
 (2, 'afrida', 'afrida@yahoo.com'),
 (3, 'jamil', 'jamil@gmail.com'),
 (4, 'jubair', 'jubair@gmail.com'),
 (5, 'habibur', 'habibur@yahoo.com'),
 (6, 'mearey', 'mearey@yandex.com');

  insert into sectionB values
 (1, 'jiban', 'jiban@gmail.com'),
 (2, 'sagor', 'sagor@yahoo.com'),
 (3, 'shahnur', 'shahnur@gmail.com'),
 (4, 'jubair', 'jubair@gmail.com'),
 (5, 'shahfir', 'shahfir@yahoo.com'),
 (6, 'mearey', 'mearey@yahoo.com');

select *from sectionA
select *from sectionB


/* 1 Show all the information of the students from both section. */

select * from sectionA
Union all
select *  from sectionB

/* 2 Show all the information of the students without duplicate. */

select * from sectionA
Union 
select *  from sectionB

/* 3 Show all the students from both table which id is less than 4. */

select * from sectionA
where id < 4
Union all
select * from sectionB
where id < 4;

/*4 Show all the students name and email from sectionA.*/

select name, email from sectionA

/* 5 Show all the students name and email from sectionB 
which id between 2 and 5. */

select name, email from sectionB
where Id between 2 and 5

/* 6 Show all the student name and mail 
server name form both table. */

select charindex('a', 'rasel');
select substring(' Show all the student name', 1,5)

select id, name, email, 
substring(email,charindex('@',email)+1, len(email)) as
ServerName from SectionA 
union all
select id, name, email,
substring(email,charindex('@',email)+1, len(email))
as ServerName from SectionB

select len(email) from sectionA 
where id = 1;

/* 7 Show all the students which name length is 5. */

 select name from sectionA
 where len(name)=5
 union all
 select name from sectionB
 where len(name)=5;


 /* 8 Show all the students which name start with s. */

select * from sectionA
where name like 's%'
Union all
select * from sectionB
 where name like 's%'

  /* 9 Show all the students which name end with r. */

 select * from sectionA
 where name like 'r%'
 Union all
 select * from sectionB
 where name like '%r'

 /* 10 Add a new column age. */
 alter table  sectionA
 add age int

 alter table  sectionB
 add age int

 /* 11 Add age for the students in such a way age will be 21 if id 1
 , age will be 26 if id 6 using only two query for two tables. */

 update sectionA
set Age = 20 + ID

update sectionB 
set Age = 20 + ID;

 
select *from sectionA
select *from sectionB