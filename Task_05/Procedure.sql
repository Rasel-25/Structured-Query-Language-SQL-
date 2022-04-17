
use vu15;

select * from tblemployee;
select * from tbldepartment;



update tblemployee 
set name = 'Zakir'
where id = (select min(id) from (select * from tblemployee) x); 




/* 1 */
create or replace view vemployee 
as
select id, name, deptId, deptName
from tblEmployee
inner join tblDepartment
on departmentId = deptId;

select * from vEmployee;


/* 2 */
-- delete from vemployee 
-- where name = 'Sara';

create or replace procedure deleteEmp(ename varchar(10))
begin 
	delete from tblemployee
	where name = ename;
end

call deleteEmp('Sara');

/* 3 */
-- insert into vemployee values
-- (4, 'Sara', 4, 'Admin');

create or replace procedure addEmp(eid int, ename varchar(10), did int, dname varchar(10))
begin 
	insert into tblEmployee(id, name, departmentId)
	values(eid, ename, did);
end

call addEmp(4, 'Sara', 4, 'Admin');


/* 4 */
create or replace procedure updateTblEmployee(eid int, egender varchar(10))
begin
	update tblemployee 
	set gender = egender
	where id = eid;
end

call updateTblEmployee(4, 'Female');


/* 5 */
-- update vemployee
-- set deptName ='IT'
-- where name = 'Jhon';


create procedure vEmployeeUpdateDept(ename varchar(10), dname varchar(10))
begin
	update tblemployee 
	set departmentId = (select deptId from tblDepartment where deptName = dname)
	where name = ename;
end


call vEmployeeUpdateDept('Jhon', 'IT');


select * from vEmployee;



