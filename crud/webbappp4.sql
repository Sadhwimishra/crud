create database HRDB;
use HRDB;


create table Departments (id int primary key identity,name varchar(max))


create table Employees (id int primary key identity,
name varchar (max),
email varchar (max),
gender varchar(20),
mobile varchar(15),
department_id int foreign key references Departments(id)
)

select * from Departments;
select * from Employees;

exec SP_Department 'select'
exec SP_Department 'create',2,'sales'
exec SP_Department 'update',2,'manager'
exec SP_Department 'delete',2


create proc SP_Department
@action varchar (20),
@id int =0,
@name varchar(100)=null
as
begin
if(@action='create')
begin
insert into Departments(name) values (@name)
select 1 as result
end
else if(@action='delete')
begin
delete from Departments where id=@id
select 1 as result
end
else if(@action='select')
begin
select * from Departments
end
else if (@action='update')
begin
update Departments set name=@name where id=@id
select 1 as result
end
end



-------------------------------------------------------------------------------------------------------------
exec SP_Employee 'select'
exec SP_Employee 'create',0,'rahul','rahul@gmail.com','5285296314','male',1
exec SP_Employee 'select_join'



create proc SP_EMPLOYEE
@action varchar (20),
@id int =0,
@name varchar(100)=null,
@email varchar(100)=null,
@mobile varchar(15)=null,
@gender varchar(10)=null,
@dept_id int=0
as
begin
if(@action='create')
begin
insert into employees( name ,email,mobile,gender,department_id) values (@name,@email,@mobile,@gender,@dept_id)
select 1 as result
end
else if(@action='delete')
begin
delete from Employees where id=@id
select 1 as result
end
else if(@action='select')
begin
select * from Employees
end
else if(@action='select_join')
begin
select e.id, e.name,e.email,e.mobile,e.gender,d.name 
from Employees e
full outer join
Departments d
on e.department_id=d.id
end
else if (@action='update')
begin
update Employees set name=@name, email=@email, mobile=@mobile, gender=@gender, department_id=@dept_id  where id=@id
select 1 as result
end
end