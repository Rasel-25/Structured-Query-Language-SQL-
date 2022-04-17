
create table Student(
Student_ID int primary key,	
Name varchar(30),
Address varchar(30),
Marks int
);
 
 insert into Student values
(1,	'Billie',	'NY',220),
(2,	'Eilish',	'London',190),
(3,	'Ariana',	'Miami',180),
(4,	'Alizeh',	'Maldives',	210);

 insert into Student values
(5,	'Jhon',	'sidny', 220)

DELETE FROM Student
WHERE Student_ID=3 ;



select *from Student

/*  1.	Create a procedure updateMark to update mark that will take id and marks.  */


create proc updateMark
@SID int,
@mark int
as
begin 
	update Student
	set Marks = @mark
	where Student_ID=@SID;
end 

exec updateMark  4, 210

select * from Student

/* 2.	Create a procedure to update Address that will take id and address.  */


create proc update_Address 
@SID int,
@SAddress varchar(30)
as
begin 
	update Student
	set Address = @SAddress
	where Student_ID=@SID;
end 

exec update_Address  1, 'Rajshahi'

select * from Student


/* 3.	Create a trigger to save the previous marks and updated marks.  */

CREATE TABLE updated_marks 
	(
	Id int identity(1,1) primary key, 
	Message varchar(100) 
	)

	
select * from updated_marks 


CREATE TRIGGER triggers_updated_marks
ON Student
FOR Update
AS
BEGIN
 insert into updated_marks values('Marks updated');
END

drop TRIGGER triggers_updated_marks

/* 4.	Create a trigger to save new inserted info and date.  */



CREATE TRIGGER triggers_inserted_info
ON Student 
FOR INSERT

AS 
BEGIN 
Declare @Id int 
Select @Id = Student_ID from inserted 

insert into updated_marks 
values('New student Id = ' + Cast(@Id as nvarchar(5))
+ ' is added at ' + cast(Getdate() as nvarchar(20)))
END


/* 5.	Create a trigger to save deleted information.  */


CREATE TRIGGER triggers_Deleteded_info
ON Student 
FOR DELETE 
AS 
BEGIN 
Declare @Id int 
Select @Id = Student_ID from deleted 
insert into updated_marks 
values('Deleted Id = ' + Cast(@Id as nvarchar(5))
+ ' is deleted at ' + cast(Getdate() as nvarchar(20)))
END


