-- Employee Table
create table employee1 (empid int not null primary key,
					   fname text,
					    mid int not null,
						project text,
						city text
					   );
					 
insert into employee1 (empid, fname, mid, project, city) values (1, 'Shashank', 100, 'P1', 'Etawah');
insert into employee1 (empid, fname, mid, project, city) values (2, 'Mihir', 101, 'P2', 'Delhi');
insert into employee1 (empid, fname, mid, project, city) values (3, 'Pranav', 102, 'P1', 'Agra');
insert into employee1 (empid, fname, mid, project, city) values (4, 'Gaurav', 103, 'P1', 'Lucknow');

select * from employee1;

drop table employee1;

-- Salary Table
create table salary (sid int not null primary key,
					 sal real,
					 empid int,
					 constraint fk_emp foreign key (empid) references employee1(empid)
					   );

insert into salary (sid, sal, empid) values (100, 11000, 1);
insert into salary (sid, sal, empid) values (101, 18000, 2);
insert into salary (sid, sal, empid) values (102, 14000, 3);
insert into salary (sid, sal, empid) values (103, 20000, 4);

select * from salary;

drop table salary;




-- Questions-

-- Ques-1
select empid, fname from employee1 where mid=101;

-- Ques-2
select count(*) from employee1 group by project having project='P1';

-- Ques-3
select max(sal) from salary;
select min(sal) from salary;
select avg(sal) from salary;

-- Ques-4
select empid from salary where sal>10000 and sal<15000;

-- Ques-5
alter table salary add column variable real;
update salary set variable=sal*0.45;
select empid, sal+variable as Total_Salary from salary;

-- Ques-6
select empid from employee1 where empid in (select empid from salary);

-- Ques-7
select upper(fname), lower(city) from employee1;

-- Ques-8
select project, count(*) as pcount from employee1 group by project order by pcount desc;

-- Ques-9
select * from 
	(	 select *, 
		 Row_Number() over(order by empid) as rn 
		 from employee1
	)as newtable 
	 where newtable.rn%2!=0;
	
-- Ques-10
select sal from salary s1 where 2=(select count(distinct(sal)) from salary s2 where s2.sal>s1.sal);

