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









