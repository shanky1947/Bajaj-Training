-- DAY 2

-- drop will basically drop the whole data as well as the table itself
drop table students;

-- truncate will only delete all the data inside the table
truncate table students;

------------------------------------------------------------------------------------------
-- DML

create table employee(eid int not null primary key, ename varchar(20), age int not null);
-- insert
insert into employee (eid, ename, age) values (10, 'Shashank', 22);

insert into employee (eid, ename, age) values (11, 'Mihir', 22), (12, 'Pranav', 23), (13, 'Gaurav', 20);

-- add one column 'joining_date' (datatype date)
alter table employee add column joining_date date;
alter table employee add column joining_date date default current_date;
alter table employee drop column joining_date;

select * from employee;

------------------------------------------------------------------------------------------
-- FOREIGN KEY
create table department (dep_id int primary key not null,
						dep_name text not null,
						salary real check (salary>10000),
						eid int,
						constraint fk_emp foreign key (eid) references employee(eid));
-- drop foreign key
alter table department drop constraint fk_emp;

insert into department (dep_id, dep_name, salary, eid) values ()

drop table department;

alter table employee add column salary real;
update employee set salary=10000;

-- retrieve name of employee whose salary is 20000 and age is 23
select ename from employee where salary=10000 and age=23;

-- retrieve names of employee having S as starting name
select ename from employee where ename like 'S%'; 
-- _S% -> means only 1 character will come before S and it could be anything and any number of 
-- characters after S

select * from employee where age in (22, 23);

select * from employee where age between 22 and 25;

select age from employee
where exists (select age from employee where salary=10000);

-- retrieve all the information of employees having salary as 100000 and age>22;
select * from employee where salary=10000 and age in (select age from employee where age>22);

-- delete command
-- delete Pranav record
delete from employee where ename='Pranav';

update employee set  salary=30000 where eid=10;

update employee set salary=40000 
where eid in (select eid from employee where salary=10000);

select * from employee limit 2;
-- offset how many rows skip from start
select * from employee limit 3 offset 1;

-- Order by
select age, ename from employee order by ename desc;
-- by default order by condition uses the asc function
insert into employee (eid, ename, age, salary) values (12, 'Mihir', 23, 10000);
select * from employee order by ename asc, salary desc;

------------------------------------------------------------------------------------------
-- Group By
-- it will group together records in a table having indentical data
select age, sum(salary) from employee group by age order by age desc; 

select * from employee;

select ename, sum(salary) from employee group by ename order by sum(salary);


-- having and where
-- having is always used with group by
select age, sum(salary) from employee group by age having age>20;


-- distinct
select distinct ename from employee; 

-- Alias
select age, sum(salary) as Sum_of_salary from employee group by age having age>22;


------------------------------------------------------------------------------------------

-- DAY 3
---------JOIN-----------
select * from employee;

create table employee2 (empid int primary key not null, dept text);
select * from employee2;

insert into employee2 (empid, dept) values (10, 'CSE'), (11, 'MECH'), (12, 'IT'), (14, 'EEE'),(15, 'ECE');

---Inner Join----
select employee.ename, employee2.dept 
from employee inner join employee2 
on employee.eid=employee2.empid;

--Inner Join using Alias
select e.ename, e1.dept 
from employee e inner join employee2 e1 
on e.eid=e1.empid;

-- Inner Join with 'Using keyword' if both tables have same column name
select employee.ename, employee2.dep from employee inner join employee2
using (eid);

select employee.ename, employee2.dept from employee inner join employee2
on employee.eid=employee2.empid where employee2.dept='CSE';

select employee.ename, employee2.dept from employee, employee2
where employee.eid=employee2.empid;


create table designation (des_id int primary key, des_details varchar not null);
insert into designation (des_id, des_details) values (10, 'Training'), (11, 'Project1'), (12, 'Operations');
select * from designation;

--Using inner join in 3 tables
select employee.ename, employee2.dept, designation.des_details 
from employee inner join employee2
on employee.eid=employee2.empid 
inner join designation 
on employee2.empid=designation.des_id;

-- Left join
select employee.ename, employee2.dept from employee left join employee2
on employee.eid=employee2.empid;

-- Left Join with Alias
select e.ename, e1.dept from employee e left join employee2 e1
on e.eid=e1.empid;

-- Right join
select employee.ename, employee2.dept from employee right join employee2
on employee.eid=employee2.empid;

-- full join / full outer join
select employee.ename, employee2.dept from employee full join employee2
on employee.eid=employee2.empid;

-- Union Operator (want to combine two or more select statements)
select employee.ename, employee2.dept from employee inner join employee2 
on employee.eid=employee2.empid
union
select employee.ename, employee2.dept from employee left join employee2
on employee.eid=employee2.empid;

-- Cross Join
select * from employee2 cross join designation;
select employee2.empid, designation.des_details from employee2 cross join designation;

-- Natural join- intersection without any condition, common columns takes
-- Self Join- customer names from same city names 
-- Equi join- like inner join but compares using only equal operator, in inner join any opertor

-------------------------------------------------------------------------------------------
-- Aggregate Functions
-- count(), sum(), max(), min(), avg()

-- User defined functions
create or replace function total_emp()
returns integer as 
$$
declare total integer;
begin
select count(*) into total from employee;
return total;
end;
$$ language plpgsql;

-- once the function is created, we can use it
select total_emp();

-- function to find sum of 2 values
create function sum (a integer, b integer)
returns integer as $$
begin
return a+b;
end;
$$ language plpgsql;

select sum(2,3);
----------------
create function test()
returns text as $$
begin
return 'Shashank';
end;
$$ language plpgsql;

select test();
-------------------
create function get_film_count(len_from int, len_to int)
returns int
language plpgsql
as
$$
declare
   film_count integer;
begin
   select count(*) 
   into film_count
   from film
   where length between len_from and len_to;
   
   return film_count;
end;
$$;
---------------------------------------------------------------------------------

-- TRIGGER --
create table employee3 (id int primary key, name text, salary int not null);
create table audit (id int primary key, name text, entry_date text);

-- new function, it will run as soon as new value is inserted in to employee table
create or replace function audit_log()
returns trigger as 
$$
begin 
insert into audit (id, name, entry_date) values (new.id, new.name, current_timestamp);
return new;
end;
$$ language plpgsql;

-- finally we create our trigger
create trigger audit_trigger after insert on employee3
for each row execute procedure audit_log();

-- checking if trigger is working on inserting data into the employee table
insert into employee3 (id, name, salary) values (10, 'Shashank', 10000);

-- in audit table we have stored log of time when data is inserted into the employee table
select * from employee3;
select * from audit;
---------------------------- 

-- Show message in output
create or replace function audit_insert()
returns trigger as $$
begin
RAISE NOTICE 'Inserted';
return new;
end;
$$ language plpgsql;

create trigger audit_trigger_insert after insert on employee3
for each row execute procedure audit_insert();

insert into employee3 (id, name, salary) values (11, 'Mihir', 20000);

-- drop trigger----
drop trigger audit_trigger on employee3;

------------------------------------------------------------------------------------------

------Index--------
select * from employee3;
select * from employee3 where name='Mihir';

explain select * from employee3 where name='Mihir';
-- Seq Scan on employee3  (cost=0.00..25.00 rows=6 width=40), time=25

-- now let's see with index
create index index_emp on employee3(name);
explain select * from employee3 where name='Mihir';
-- Seq Scan on employee3  (cost=0.00..1.02 rows=1 width=40), time has reduced to 1.02

-- drop index
drop index index_emp;

























