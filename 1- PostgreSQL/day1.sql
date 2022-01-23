select * from student;

-- set schema
set path 

/*
add comments
*/

-- DDL command --> Alter
alter table student add column age integer;

-- Drop a column
alter table student
drop
column age;

select * from student1;

-- Rename
alter table student
rename
column age to newage;

-- Rename the table name
alter table student rename to student1;

-- Change column type
alter table student1
alter column age type varchar (10)

-- constraints (add not null constraints)
alter table student1 alter column age set not null;

-- drop the not null constraint
alter table student1 alter column age drop not null;

-- primary key add constraint
alter table student1 
add 
primary key (stu_id);

-- (student1_pkey-> default constraint name)
alter table student1 drop constraint student1_pkey; 









