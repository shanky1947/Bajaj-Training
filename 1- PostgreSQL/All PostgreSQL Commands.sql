-- Order of Execution->
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> LIMIT

-- SELECT
select first_name from customer;
select first_name, last_name, email from customer;

-- (*) not preferred, decreases performance in big databases
select * from customer;  

-- || uses for concatenation, output- 'Shashank Shukla' as one column
select first_name || ' ' ||  last_name, email from customer;
---------------------------------------------------------------------------

-- ALIAS
select first_name, last_name AS surname from customer;
select first_name, last_name AS "column aliass" from customer;
select first_name || ' ' ||  last_name as full_name from customer;
---------------------------------------------------------------------------

-- ORDER BY
-- will first order by first_name, if same first_name then go to last_name
select first_name, last_name from customer order by first_name ASC, last_name DESC;

-- sort by expression
select first_name, LENGTH(first_name) AS len from customer order by len DESC;

-- places null values in num at first
select num from sort_demo order by num NULLS FIRST;
-------------------------------------------------------------------------------

-- DISTINCT
select distinct column1 from table;

-- distinct based on combination of column1 and column2
select distinct column1, colunm2 from table;

-- distinct based on combination of column1 and column2 but only first row of combination
select distinct on (column1) column_alias, column2 from table order by column1, column2;
-----------------------------------------------------------------------------------

-- WHERE
-- Cannot column alias in where clause but can be used in order by
select first_name, LENGTH(first_name) name_length FROM Customer 
WHERE
first_name LIKE 'A%' AND
LENGTH(first_name) BETWEEN 3 AND 5 
ORDER BY name_length;
-----------------------------------------------------------------------------------

-- LIMIT
selet select_list from table_name ORDER BY sort_expression LIMIT row_count;

-- OFFSET is used to skip number of rows from starting
select select_list from table_name LIMIT row_count OFFSET row_to_skip;

-- FETCH
select film_id , title from film ORDER BY title FETCH FIRST 1 ROW ONLY;
select film_id , title from film ORDER BY title FETCH FIRST 5 ROWS ONLY;
select film_id , title from film ORDER BY title OFFSET 5 ROWS FETCH FIRST 4 ROWS ONLY;
---------------------------------------------------------------------------------------

-- CAST - to change datatype
select customer_id 
from rental 
where CAST (return_date as DATE) = '2005-05-27' 
ORDER BY customer_id;

-- SUBQUERY
-- IN
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST (return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;
-------------------------------------------------------------------------------

--LIKE
-- _->single character, %->any characters, ~~-> similar to LIKE
select ename from table where ename LIKE "S_a%"
-- ILIKE
-- macthes with cases insestively, BAR matches Bar, BAR, bar, bAR, bAr
select ename from table where ename ILIKE "BAR%"
-------------------------------------------------------------------------------

-- NULL
-- No output result as --> NULL == NULL -> will return false
SELECT first_name, last_name, email, phone FROM contacts WHERE phone = NULL;
-- Correct way to check for NULL
SELECT first_name, last_name, email, phone FROM contacts WHERE phone IS NULL;
-------------------------------------------------------------------------------

-- INNER JOIN ON 3 TABLES
SELECT
	c.customer_id,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	s.first_name staff_first_name,
	s.last_name staff_last_name,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p 
    ON p.customer_id = c.customer_id
INNER JOIN staff s 
    ON p.staff_id = s.staff_id
ORDER BY payment_date;

-- INNER JOIN
select p.name, c.name from parrot p INNER JOIN carrot c USING (key);
select p.name, c.name from parrot p INNER JOIN carrot c ON p.key=c.key;

--NATURAL JOIN
-- It joins with common column name(eg id in both tables p and c)
select p.name, c.name from parrot p NATURAL JOIN carrot c;
-----------------------------------------------------------------------------

-- SELF JOIN
-- Gives Employee Name, Manager Name, table has eid and mid, both are in one table
SELECT
    e.first_name || ' ' || e.last_name employee_name,
    m.first_name || ' ' || m.last_name manager_name
FROM
    employee e
LEFT JOIN employee m ON m.employee_id = e.manager_id
ORDER BY manager;

-- Another example of self join, movie that have same length
SELECT
    f1.title,
    f2.title,
    f1.length
FROM
    film f1
INNER JOIN film f2 
    ON f1.film_id <> f2.film_id AND 
       f1.length = f2.length;
-----------------------------------------------------------------------------

-- CROSS JOIN
select select_list from t1 CROSS JOIN t2;
select select_list from t1, t2;
select * from t1 INNER JOIN t2 ON true;

-- Natural join- intersection without any condition, common columns takes
-- Self Join- customer names from same city names 
-- Equi join- like inner join but compares using only equal operator, in inner join any opertor
-----------------------------------------------------------------------------

-- GROUP BY
-- It also works like DISTINCT clause that removes duplicate
select customer_id, SUM(amount) from payment GROUP BY customer_id ORDER BY SUM(amount) DESC;
SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM
	payment
INNER JOIN customer USING (customer_id)    	
GROUP BY
	full_name
ORDER BY amount DESC;	

-- Will group by combining cid and sid- all possible combinations
SELECT customer_id, staff_id, SUM(amount) FROM payment GROUP BY staff_id, customer_id ORDER BY customer_id;
-- Converting payment_date into date as it is timestamp
SELECT DATE(payment_date) paid_date, SUM(amount) sum FROM payment GROUP BY DATE(payment_date);
------------------------------------------------------------------------------------------------

-- HAVING
-- where -> for filtering rows, having -> for filtering groups
select column1, aggregate_function(column2) FROM table_name GROUP BY column1 HAVING condition;
select customer_id, SUM (amount) FROM payment GROUP BY customer_id HAVING SUM (amount) > 200;
------------------------------------------------------------------------------------------------

-- UNION
-- The number, data type and the order of the columns in the select list of both queries must be the same
-- The UNION operator removes all duplicate rows from the combined data set
-- To retain the duplicate rows, you use the the UNION ALL instead
-- To sort rows in the final result set, you use the ORDER BY clause in the second query
select select_list1 FROM table_expression1 
UNION
select select_list2 FROM table_expression2 ORDER BY sort_expression

-- INTERSECT
-- All properties same as UNION, it just gives common columns
select select_list1 FROM table_expression1 
INTERSECT
select select_list2 FROM table_expression2 ORDER BY sort_expression

-- EXCEPT
-- All properties same as UNION, it just gives columns of table A which are not in table B
select select_list1 FROM table_expression1 
EXCEPT
select select_list2 FROM table_expression2 ORDER BY sort_expression
------------------------------------------------------------------------------------------------

-- GROUPING SETS
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    GROUPING SETS (
        (brand, segment),
        (brand),
        (segment),
        ()
    );
	
-- GROUPING FUNCTION
-- The GROUPING() function returns bit 0 if the argument is a member of the current grouping set and 1 otherwise.
SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
HAVING GROUPING(brand) = 0	
ORDER BY
	brand,
	segment;
------------------------------------------------------------------------------------------------

-- SUBQUERY
SELECT film_id, title, rental_rate FROM film WHERE rental_rate > (SELECT AVG (rental_rate) FROM film);

SELECT film_id, title FROM film WHERE film_id IN 
(SELECT inventory.film_id FROM rental INNER JOIN inventory 
ON inventory.inventory_id = rental.inventory_id WHERE
return_date BETWEEN '2005-05-29' AND '2005-05-30');

SELECT first_name, last_name FROM customer WHERE EXISTS 
(SELECT 1 FROM payment WHERE payment.customer_id = customer.customer_id);
------------------------------------------------------------------------------------------------

-- ANY similar to any sign (>,<,!=,==)
-- ALL -> col>ALL(subquery)-> col greater than greates value subquery
-- col<ALL(subuery)-> col less than smallest value by the subquery
-- EXIST-> If the subquery returns NULL, EXISTS returns true
-- WITH cte_name AS (subquery)-> select something from cte_name->similar to view;
------------------------------------------------------------------------------------------------

-- UPDATE
UPDATE table_name SET column1 = value1, column2 = values WHERE condition;

-- UPDATE in JOIN
UPDATE t1 SET t1.c1 = new_value FROM t2 WHERE t1.c2 = t2.c2;

-- DELELT in JOIN
DELETE FROM t1 USING t2 WHERE t1.id = t2.id;

-- COPY CSV file into the table
COPY persons(first_name, last_name, dob, email)
FROM 'C:\sampledb\persons.csv'
DELIMITER ','
CSV HEADER;
------------------------------------------------------------------------------------------------

-- SELECT INTO
SELECT film_id, title, rental_rate INTO TABLE film_r FROM film 
WHERE rating = 'R' AND rental_duration = 5 ORDER BY title;

-- CREATE TABLE AS
CREATE TABLE new_table_name AS query;
-- If you want the table columns to have different names
CREATE TABLE new_table_name ( column_name_list) AS query;

-- SERIAL
CREATE TABLE table_name(id SERIAL, name VARCHAR NOT NULL);
INSERT INTO fruits(name) VALUES('Orange');
-- OR
INSERT INTO fruits(id,name) VALUES(DEFAULT,'Apple');
------------------------------------------------------------------------------------------------

-- ALTER
ALTER TABLE links ADD COLUMN active VARCHAR(10) SET active=somevalue;
ALTER TABLE customers ADD COLUMN fax VARCHAR, ADD COLUMN email VARCHAR;
ALTER TABLE assets ALTER COLUMN location TYPE VARCHAR, ALTER COLUMN description TYPE VARCHAR;
ALTER TABLE links DROP COLUMN active;
ALTER TABLE links RENAME COLUMN title TO link_title;
ALTER TABLE links ADD CONSTRAINT unique_url UNIQUE ( url );
ALTER TABLE links RENAME TO urls;
------------------------------------------------------------------------------------------------

-- TRUNCATE
TRUNCATE TABLE table_name;

-- COPY TABLE
CREATE TABLE contact_backup AS TABLE contacts;

-- PRIMARY KEY
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
ALTER TABLE Persons ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

ALTER TABLE table_name ADD PRIMARY KEY (column_1, column_2);
ALTER TABLE vendors ADD COLUMN ID SERIAL PRIMARY KEY;

ALTER TABLE table_name DROP CONSTRAINT primary_key_constraint;
------------------------------------------------------------------------------------------------

-- FOREIGN KEY
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);
ALTER TABLE Persons ADD CONSTRAINT FK_Person FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE table_name DROP CONSTRAINT FK_Person;

-- ON DELETE CASCADE
-- The ON DELETE CASCADE automatically deletes all the referencing rows in the child table when the referenced rows in the parent table are deleted
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID) ON DELETE CASCADE
);
------------------------------------------------------------------------------------------------

-- NUMERIC
-- NUMERIC(precision, scale)
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(5,2)
);
INSERT INTO products (name, price) VALUES ('Phone',500.215), ('Tablet',500.214);
------------------------------------------------------------------------------------------------

-- DATE 
-- uses 4 bytes
CREATE TABLE documents (posting_date DATE DEFAULT CURRENT_DATE);
INSERT INTO documents (posting_date)VALUES ('2005-01-01'),

SELECT NOW()::date;
SELECT TO_CHAR(NOW() :: DATE, 'dd/mm/yyyy');
SELECT TO_CHAR(NOW() :: DATE, 'Mon dd, yyyy');

SELECT first_name, last_name, now() - hire_date as diff FROM employees;

SELECT first_name, last_name, AGE(birth_date) FROM employees;
SELECT first_name, last_name, AGE('2015-01-01',birth_date) FROM employees;

SELECT first_name, last_name, EXTRACT (YEAR FROM birth_date) AS YEAR,
EXTRACT (MONTH FROM birth_date) AS MONTH,
EXTRACT (DAY FROM birth_date) AS DAY FROM employees;
------------------------------------------------------------------------------------------------

-- TIMESTAMP
SELECT NOW();
SELECT CURRENT_TIMESTAMP;
INSERT INTO timestamp_demo (ts, tstz) VALUES('2016-06-22 19:10:25-07','2016-06-22 19:10:25-07');
------------------------------------------------------------------------------------------------

-- UUID
CREATE TABLE contacts (contact_id uuid DEFAULT uuid_generate_v4 (),);

-- ARRAY
CREATE TABLE contacts (name VARCHAR (100), phones TEXT []);
INSERT INTO contacts (name, phones) VALUES('John Doe',ARRAY [ '(408)-589-5846','(408)-589-5555' ]);

SELECT name, phones [ 1 ] FROM contacts;
SELECT name, phones FROM contacts WHERE '(408)-589-5555' = ANY (phones);
------------------------------------------------------------------------------------------------

-- CREATE DOMAIN
-- creates a user-defined data type with constraints such as NOT NULL, CHECK, etc.
CREATE DOMAIN contact_name AS VARCHAR NOT NULL CHECK (value !~ '\s');

CREATE TABLE mailing_list (id serial PRIMARY KEY, first_name contact_name, last_name contact_name);

-- CREATE TYPE
-- creates a composite type used in stored procedures as the data types of returned values.
CREATE OR REPLACE FUNCTION get_film_summary (f_id INT) 
    RETURNS film_summary AS 
$$ 
SELECT film_id, title, release_year FROM film WHERE film_id = f_id ; 
$$ 
LANGUAGE SQL;

SELECT * FROM get_film_summary (40);
------------------------------------------------------------------------------------------------

-- DELETE DUPLICATE FROM TABLE
DELETE FROM
    basket a
        USING basket b
WHERE
    a.id < b.id
    AND a.fruit = b.fruit;
------------------------------------------------------------------------------------------------

-- CASE
SELECT title,
       length,
       CASE
           WHEN length> 0
                AND length <= 50 THEN 'Short'
           WHEN length > 50
                AND length <= 120 THEN 'Medium'
           WHEN length> 120 THEN 'Long'
       END duration
FROM film
ORDER BY title;
	
-- COALESCE
-- takes first value which is not null
SELECT product, (price - COALESCE(discount,0)) AS net_price FROM items;
------------------------------------------------------------------------------------------------

-- CAST
SELECT '100'::INTEGER, '01-OCT-2015'::DATE;
SELECT CAST ('100' AS INTEGER);
SELECT CAST ('2015-01-01' AS DATE);
SELECT CAST ('10.2' AS DOUBLE);
SELECT CAST('true' AS BOOLEAN);
SELECT '2019-06-15 14:30:20'::timestamp;
   
-- EXPLAIN
EXPLAIN SELECT * FROM film;
------------------------------------------------------------------------------------------------

-- VIEW
CREATE OR REPLACE VIEW view_name AS query;
ALTER VIEW customer_master RENAME TO customer_info;
DROP VIEW IF EXISTS customer_info;

-- TRIGGER
CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   -- trigger logic
END;
$$

CREATE TRIGGER trigger_name 
   {BEFORE | AFTER} { event }
   ON table_name
   [FOR [EACH] { ROW | STATEMENT }]
       EXECUTE PROCEDURE trigger_function
------------------------------------------------------------------------------------------------

-- EXAMPLE
-- OLD and NEW represent the states of the row in the table before or after the triggering event
-- one or more trigger events such as INSERT, UPDATE, and DELETE
CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$

CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();
  
DROP TRIGGER last_name_changes;

ALTER TRIGGER last_name_changes
ON employees
RENAME TO last_name_changes_new;
------------------------------------------------------------------------------------------------

-- ON CONFLICT
INSERT INTO person (id, first_name) VALUES (2017, 'shashank');
-- above query will give error if id as 2017 already exists
INSERT INTO person (id, first_name) VALUES (2017, 'shashank') ON CONFLICT (id) DO NOTHING;
------------------------------------------------------------------------------------------------

-- UPSERT
-- update email with latest added value
-- email is the old one, EXCLUDED email is the new one going to be inserted
INSERT INTO person (id, email) VALUES (2017, 'shashank@abc.com') 
ON CONFLICT (email) DO UPDATE SET email = EXCLUDED.email;

INSERT INTO person (id, email) VALUES (2017, 'shashank@abc.com') 
ON CONFLICT (email) DO UPDATE SET email = EXCLUDED.email, id = EXCLUDED.id;
------------------------------------------------------------------------------------------------

-- WINDOW FUNCTION




















   

