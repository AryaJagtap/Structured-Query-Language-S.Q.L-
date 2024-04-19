-- create table
create table classroom (
    rollno int,
    name varchar (50),
    house char (12),
    grade char (1)
);

-- select all
select * from classroom  -- to select all

-- insert 
insert into classroom (rollno,name,house,grade) values ('1','sam','akash','b');
insert into classroom (rollno,name,house,grade) values ('2','ram','agni','a');
insert into classroom (rollno,name,house,grade) values ('3','tam','jal','b');
insert into classroom (rollno,name,house,grade) values ('4','ham','agni','a');
insert into classroom (rollno,name,house,grade) values ('5','dam','yayu','b');

-- using select in different forms
select * from classroom  -- to select all
select rollno , name from classroom -- to select specific columns
select distinct grade from classroom -- to find all unique entries from a column

-- where clause
select name from classroom
where grade ='a'

-- operators
-- where clause mai ek se jyada conditions use karne ho to operators ka use karte hai

-- arithmatic operator : addition + , subtraction - , multiplication * , division / , modulus %
-- comparison operator :equal  = , not equal != , greater than > , greater than equal to >=
-- logical operator    : ALL , IN , BETWEEN , LIKE , AND , OR , NOT , ANY
-- bitwise operator    : bitwise AND (&) , bitwise OR (|)

select name from classroom
where grade = 'a' and rollno > 3

-- order clause
-- used to sort the result-set ascending (ASC) or decsending order (DESC)
-- matlab used to sort the data in table
select * from classroom 
order by name asc

select * from classroom 
order by grade ,house asc

-- limit clause 
-- used to set up upper limit on the number of tuples returned by sql
-- iska matlab limit clause apko help karta hai kitne no. of rows aap output mai dekhna chate ho
    
-- in oracle this is the syntax for using limit clause
select * from classroom 
fetch first 3 rows only;

------------------------------------------------------------------------------------
-- importing data from a csv file
-- use csv to sql converter for oracle live 
-- https://www.convertcsv.com/csv-to-sql.htm

create table customer
    (
    customer_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    address_id int
    );

select * from customer

-- copy customer (customer_id, first_name, last_name, email, address_id,)
-- from 'C:\Users\Mansi Kadam\Desktop\js\customer.csv'
-- delimiter ','
-- csv header;

-- LOAD DATA
-- INFILE 'C:\Users\Mansi Kadam\Desktop\js\customer.csv'
-- INTO TABLE customer
-- FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"'
-- TRAILING NULLCOLS
-- (
--     customer_id,
--     first_name,
--     last_name,
--     email,
--     address_id
-- ) this method not supported in oracle 

CREATE TABLE customer(
   customer_id INTEGER  NOT NULL PRIMARY KEY 
  ,first_name  VARCHAR(9) NOT NULL
  ,last_name   VARCHAR(8) NOT NULL
  ,email       VARCHAR(27) NOT NULL
  ,address_id  INTEGER  NOT NULL
);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (1,'Mary','Smith','mary.smith@mailid.com',5);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (2,'Patricia','Johnson','patricia.johnson@mailid.com',6);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (3,'Madan','Mohan','madan.mohan@mailid.com',7);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (4,'Barbara','Jones','barbara.jones@mailid.com',8);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (5,'Elizabeth','Brown','elizabeth.brown@mailid.com',9);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (6,'Jennifer','Davis','jennifer.davis@mailid.com',10);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (7,'Maria','Miller','maria.miller@mailid.com',11);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (8,'Susan','Wilson','susan.wilson@mailid.com',12);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (9,'R','Madhav','r.madhav@mailid.com',13);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (10,'Dorothy','Taylor','dorothy.taylor@mailid.com',14);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (11,'Lisa','Anderson','lisa.anderson@mailid.com',15);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (12,'Nancy','Thomas','nancy.thomas@mailid.com',16);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (13,'Karen','Jackson','karen.jackson@mailid.com',17);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (14,'Betty','White','betty.white@mailid.com',18);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (15,'Helen','Harris','helen.harris@mailid.com',19);

select * from customer
select upper(first_name) from customer
select length(email) , email from customer order by email asc
select length(email) , email from customer order by length(email) asc
select substr (first_name, 1 , 3) , first_name from customer -- substring syntax
select concat (first_name, last_name) , first_name , last_name from customer -- to join two strings // concatinate string
select replace(first_name , 'mary', 'mohan') , first_name , last_name from customer -- not working
SELECT REPLACE(first_name, 'madan', 'mohan'), first_name, last_name FROM customer;-- not working

------------------------------------------------------------------------------------------------------------------------------------

/*
Most Used Aggregate Functions
Aggregate function performs a calculation on multiple values and returns a single value.
And Aggregate functiona are often used with GROUP BY & SELECT statement
• COUNT() returns number of values
• SUM() returns sum of all values
• AVG() returns average value
• MAX() returns maximum value
• MIN() returns minimum value
• ROUND() Rounds a number to a specified number of decimal places
*/

CREATE TABLE payment (
    customer_id  INT NOT NULL PRIMARY KEY,
    amount       INT NOT NULL,
    mode_        VARCHAR(20) NOT NULL, -- Assuming 20 characters is sufficient for the payment mode
    payment_date DATE NOT NULL
);

INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (1, 60, 'Cash', TO_DATE('2020-09-24', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (2, 30, 'Credit Card', TO_DATE('2020-04-27', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (3, 90, 'Credit Card', TO_DATE('2020-07-07', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (4, 50, 'Debit Card', TO_DATE('2020-02-12', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (5, 40, 'Mobile Payment', TO_DATE('2020-11-20', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (6, 40, 'Debit Card', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (7, 10, 'Cash', TO_DATE('2021-08-25', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (8, 30, 'Mobile Payment', TO_DATE('2021-06-17', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (9, 80, 'Cash', TO_DATE('2021-08-25', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (10, 50, 'Mobile Payment', TO_DATE('2021-11-03', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (11, 70, 'Cash', TO_DATE('2022-11-01', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (12, 60, 'Netbanking', TO_DATE('2022-09-11', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (13, 30, 'Netbanking', TO_DATE('2022-12-10', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (14, 50, 'Credit Card', TO_DATE('2022-05-14', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (15, 30, 'Credit Card', TO_DATE('2022-09-25', 'YYYY-MM-DD'));

select * from payment
select count (*) from payment
select sum (amount) from payment
select max(amount) from payment
select min(amount) from payment
select avg(amount) from payment
select round(amount , 2) from payment -- round of till 2 digits

--------------------------------------------------------------------------------
/*
GROUP BY Statement
The GROUP BY statement group rows that have the same values into summary rows.
It is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns

• Syntax
SELECT column_name(s)
FROM table_name
GROUP BY column_name(s);

• Example
SELECT mode, SUM(amount) AS total
FROM payment
GROUP BY mode
 */

select mode_ , sum(amount) as total 
from payment
group by mode_
order by total asc -- used for sorting

select * from payment 

/*
HAVING Clause
The HAVING clause is used to apply a filter on the result of GROUP BY based on the specified condition.
The WHERE clause places conditions on the selected columns, whereas the HAVING clause places conditions on groups created by the GROUP BY clause
select   ==> where clause
group by ==> having clause

Syntax
SELECT column_name(s)
FROM table_name
WHERE condition(s)
GROUP BY column_name(s)
HAVING condition(s)

• Example
SELECT mode, COUNT(amount) AS total
FROM payment
GROUP BY mode
HAVING COUNT(amount) >= 3
ORDER BY total DESC
*/
-- having clause is always written below group by clause
    
select mode_, count(amount) as apple_total
from payment 
group by mode_
having count (amount) >= 2 -- using single condition
order by apple_total desc

select mode_, count(amount) as apple_total
from payment 
group by mode_
having count (amount) >= 2 and  count (amount) < 4 -- using multiple condtiotns
order by apple_total desc

select mode_, count(amount) as apple_total
from payment 
group by mode_
having count (amount) =2 or  count (amount) = 4
order by apple_total asc

--------------------------------------------------------------------------------
/*
TIMESTAMP
The TIMESTAMP data type is used for values that contain both date and time parts

• TIME contains only time, format HH:MI:SS
• DATE contains on date, format YYYY-MM-DD
• YEAR contains on year, format YYYY or YY
• TIMESTAMP contains date and time, format YYYY-MM-DD HH:MI:SS
• TIMESTAMPTZ contains date, time and time zone

TIMESTAMP functions/operators
Below are the TIMESTAMP functions and operators in SQL:

• SHOW TIMEZONE
• SELECT NOW()
• SELECT TIMEOFDAY()
• SELECT CURRENT_TIME
• SELECT CURRENT_DATE
*/

-- not used in oracle
-- SHOW TIMEZONE
-- SELECT NOW()
-- SELECT TIMEOFDAY()
-- SELECT CURRENT_TIME
-- SELECT CURRENT_DATE

-- commands used in oracle
SELECT SYSDATE FROM DUAL; -- to see current date
SELECT DBTIMEZONE FROM DUAL; -- to see current timezone

SELECT TO_CHAR 
    (SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "NOW" 
     FROM DUAL
    
ALTER SESSION SET TIME_ZONE = '5:30'
    
SELECT TO_CHAR 
    (SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "NOW" 
     FROM DUAL
    
ALTER SESSION SET TIME_ZONE = '+5:30'
    
SELECT TO_CHAR 
    (SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "NOW" 
     FROM DUAL
    
ALTER SESSION SET TIME_ZONE = '+5:30'
    
SELECT TO_CHAR 
    (SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "NOW" 
     FROM DUAL
    
SELECT SESSIONTIMEZONE, CURRENT_TIMESTAMP FROM DUAL

------------------------------------------------------------

-- Retrieve current date and time in the default time zone
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS') AS "NOW"
FROM DUAL;

-- Set the session time zone to '5:30'
ALTER SESSION SET TIME_ZONE = '5:30';

-- Retrieve current date and time after changing the session time zone to '5:30'
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS') AS "NOW"
FROM DUAL;

-- Set the session time zone to '+5:30'
ALTER SESSION SET TIME_ZONE = '+5:30';

-- Retrieve current date and time after changing the session time zone to '+5:30'
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS') AS "NOW"
FROM DUAL;

-- Retrieve the session time zone and current timestamp
SELECT SESSIONTIMEZONE, CURRENT_TIMESTAMP
FROM DUAL;

---------------------------------------------------------------------------------------
/*
EXTRACT Function
The EXTRACT() function extracts a part from a given date value.

Syntax: SELECT EXTRACT(MONTH FROM date_field) FROM Table

• YEAR
• QUARTER
• MONTH
• WEEK
• DAY
• HOUR
• MINUTE
• DOW - day of week
• DOY - day of year
*/

select extract (month from payment_date) as payment_month, payment_date from payment
select extract (year from payment_date) as payment_year, payment_date from payment
-- select extract (quarter from payment_date) as payment_time, payment_date from payment
SELECT 
    CEIL(EXTRACT(MONTH FROM payment_date) / 3) AS payment_quarter,
    payment_date
FROM payment;

    -- select extract (DAY OF WEEK from payment_date) as payment_year, payment_date from payment
SELECT TO_CHAR(payment_date, 'D') AS day_of_week, payment_date FROM payment; -- for DOW
SELECT TO_CHAR(payment_date, 'DY') AS day_of_week_name, payment_date FROM payment;
-- SELECT DAYNAME(payment_date) FROM payment
SELECT TO_CHAR(payment_date, 'DAY') AS day_of_week FROM payment; -- FOR DAYNAME
SELECT TO_CHAR(payment_date, 'DY') AS day_of_week_abbr FROM payment;
select to_char(payment_date , 'year') as year_of_week from payment
select to_char(payment_date ,'month') as month_of_week , payment_date from payment
select to_Char(payment_date,'day','date','month','year') as day_of_week, date_of_week, month_of_week, year_of_week, payment_date from payment;
-- select 
--     to_char(payment_date, 'day') as day_of_week,
--     to_char(payment_date, 'date') as date_of_week,
--     to_char(payment_date, 'month') as month_of_week,
--     to_char(payment_date, 'year') as year_of_week,
-- 	payment_date
-- from payment;

SELECT 
    TO_CHAR(payment_date, 'DAY') AS day_of_week,
    TO_CHAR(payment_date, 'DD') AS date_of_week,
    TO_CHAR(payment_date, 'MONTH') AS month_of_week,
    TO_CHAR(payment_date, 'YYYY') AS year_of_week,
    payment_date
FROM payment;

select 
    extract(day from payment_date) as payment_day,
    -- extract(date from payment_date) as payment_date, // extract dosen't have date parameter
    extract(month from payment_date) as payment_month,
    extract(year from payment_date) as payment_year,
	payment_date
from payment;

SELECT 
    EXTRACT(DAY FROM payment_date) AS payment_day,
    EXTRACT(MONTH FROM payment_date) AS payment_month,
    EXTRACT(YEAR FROM payment_date) AS payment_year,
    payment_date
FROM payment;

-------------------------------------------------------------------------------------------------------------------------

/*
1.TOPICS IN JOIN

2.WHAT IS JOIN? AND WHAT IS USE OF JOIN ?
SQL JOIN
• JOIN means to combine something.
• A JOIN clause is used to combine data from two or more tables, based on a related column between them

3.WHAT ARE TYPES OF JOIN ?
TYPES OF JOINS
• INNER JOIN
• LEFT JOIN
• RIGHT JOIN
• FULL JOIN

4.Which JOIN To Use
• INNER JOIN: Returns records that have matching values in both tables
• LEFT JOIN: Returns all records from the left table, and the matched records from the right table
• RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
• FULL JOIN: Returns all records when there is a match in either left or right table

5.JOIN SYNTAX AND EXAMPLES IN SQL

INNER JOIN
• Returns records that have matching values in both tables

• Syntax
SELECT column_name(s)
FROM TableA
INNER JOIN TableB
ON TableA.col_name = TableB.col_name

• Example
SELECT *
FROM customer AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id


LEFT JOIN
• Returns all records from the left table, and the matched records from the right table
• Syntax
SELECT column_name(s)
FROM TableA
LEFT JOIN TableB
ON TableA.col_name = TableB.col_name

• Example
SELECT *
FROM customer AS c
LEFT JOIN payment AS p
ON c.customer_id = p.customer_id

RIGHT JOIN
• Returns all records from the right table, and the matched records from the left table
• Syntax
SELECT column_name(s)
FROM TableA
RIGHT JOIN TableB
ON TableA.col_name = TableB.col_name

• Example
SELECT *
FROM customer AS c
RIGHT JOIN payment AS p
ON c.customer_id = p.customer_id

FULL JOIN
• Returns all records when there is a match in either left or right table
• Syntax
SELECT column_name(s)
FROM TableA
FULL OUTER JOIN TableB
ON TableA.col_name = TableB.col_name

• Example
SELECT *
FROM customer AS c
FULL OUTER JOIN payment AS p
ON c.customer_id = p.customer_id

*/

CREATE TABLE customer(
   customer_id INTEGER  NOT NULL PRIMARY KEY 
  ,first_name  VARCHAR(9) NOT NULL
  ,last_name   VARCHAR(8) NOT NULL
  ,email       VARCHAR(27) NOT NULL
  ,address_id  INTEGER  NOT NULL
);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (1,'Mary','Smith','mary.smith@mailid.com',5);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (2,'Patricia','Johnson','patricia.johnson@mailid.com',6);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (3,'Madan','Mohan','madan.mohan@mailid.com',7);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (4,'Barbara','Jones','barbara.jones@mailid.com',8);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (5,'Elizabeth','Brown','elizabeth.brown@mailid.com',9);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (6,'Jennifer','Davis','jennifer.davis@mailid.com',10);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (7,'Maria','Miller','maria.miller@mailid.com',11);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (8,'Susan','Wilson','susan.wilson@mailid.com',12);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (9,'R','Madhav','r.madhav@mailid.com',13);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (10,'Dorothy','Taylor','dorothy.taylor@mailid.com',14);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (11,'Lisa','Anderson','lisa.anderson@mailid.com',15);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (12,'Nancy','Thomas','nancy.thomas@mailid.com',16);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (13,'Karen','Jackson','karen.jackson@mailid.com',17);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (14,'Betty','White','betty.white@mailid.com',18);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (15,'Helen','Harris','helen.harris@mailid.com',19);



select * from customer
select * from payment

DELETE FROM customer
WHERE customer_id BETWEEN 5 AND 11;

DELETE FROM payment
WHERE customer_id in (12,13,14);

select *
from customer as c
inner join payment as p
on c.customer_id = p.customer_id 
-- In Oracle SQL, you don't use the AS keyword for table aliases in the FROM clause. The correct syntax is to simply provide the alias after the table name. Here's the corrected query:

SELECT *
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id;

SELECT *
FROM customer c
left JOIN payment p
ON c.customer_id = p.customer_id;

SELECT *
FROM customer c
RIGHT JOIN payment p
ON c.customer_id = p.customer_id;

SELECT *
FROM customer c
FULL OUTER JOIN payment p
ON c.customer_id = p.customer_id
order by payment_date

-- if we directly use order by customer_id then it will give error
-- The error you're encountering suggests that there's ambiguity in the column names between the customer and payment tables, especially since you're using * to select all columns. To resolve this, you need to explicitly specify the columns you want to retrieve, or use table aliases to disambiguate column names.
-- Here's the corrected query using explicit column selection:
SELECT 
c.customer_id, c.first_name, c.last_name, c.email, c.address_id, p.customer_id
AS payment_customer_id, p.amount, p.payment_date
FROM customer c
FULL OUTER JOIN payment p
ON c.customer_id = p.customer_id
ORDER BY c.customer_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
SELF JOIN
• A self join is a regular join in which a table is joined to itself
• SELF Joins are powerful for comparing values in a column of rows with the same table

• Syntax
SELECT column_name(s)
FROM Table AS T1
JOIN Table AS T2
ON T1.col_name = T2.col_name

UNION
The SQL UNION clause/operator is used to combine/concatenate the results of two or more SELECT statements without returning any duplicate rows and keeps unique records
To use this UNION clause, each SELECT statement must have
• The same number of columns selected and expressions
• The same data type and
• Have them in the same order

Syntax
SELECT column_name(s) FROM TableA
UNION
SELECT column_name(s) FROM TableB

Example
SELECT cust_name, cust_amount from custA
UNION
SELECT cust name, cust amount from custB

UNION ALL
In UNION ALL everything is same as UNION, it combines/concatenate two or more table but keeps all records, including duplicates

• Syntax
SELECT column_name(s) FROM TableA
UNION ALL
SELECT column_name(s) FROM TableB

. Example
SELECT cust_name, cust_amount from custA UNION ALL
SELECT cust_name, cust_amount from custB
*/

create table employee
(
    emp_Id int ,
    emp_name varchar(50),
    manager_id int 
);

insert into employee (emp_id,emp_name,manager_id) values ('1','agni','3');
insert into employee (emp_id,emp_name,manager_id) values ('2','akash','4');
insert into employee (emp_id,emp_name,manager_id) values ('3','dharti','2');
insert into employee (emp_id,emp_name,manager_id) values ('4','vayu','3');

select * from employee

-- select t1.* , t2.*
-- from employee as t1
-- join employee as t2
-- on t2.emp_name = t1.manager_id;

-- SELECT e1.employee emp_name , e2.employee manager_id
-- FROM employee e1 join emp e2 on e1.mgr = e2.empno
-- order by e2.ename

SELECT e1.emp_name AS emp_name, e2.mgr_name AS manager_name
FROM employee e1 
JOIN employee e2 ON e1.manager_id = e2.emp_Id
ORDER BY e2.emp_name;

create table custA 
(
    cust_name char(30),
    cust_amount int
);

create table custb 
(
    cust_name char(30),
    cust_amount int
);

insert into custA (cust_name , cust_amount) values ('madan mohan','2100');
insert into custA (cust_name , cust_amount) values ('gopi nath','1200');
insert into custA (cust_name , cust_amount) values ('govind dev','5000');

insert into custB (cust_name , cust_amount) values ('GOPAL BHAT','1500');
insert into custB (cust_name , cust_amount) values ('madan mohan','2100');

select * from custA
select * from custB
    
-- union
select cust_name , cust_amount from custA
union
select cust_name , cust_amount from custB

-- union all
select cust_name , cust_amount from custA
union all
select cust_name , cust_amount from custB

update custB
set cust_name = 'MADAN MOHAN'
where cust_amount = '2100'
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
SUB QUERY
-- a subquery allows us to create complex query on the output of another query
A Subquery or Inner query or a Nested query allows us to create complex query on the output of another query
• Sub query syntax involves two SELECT statements
• Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name operator
(SELECT column_name FROM table_name WHERE ...);
*/

CREATE TABLE payment (
    customer_id  INT NOT NULL PRIMARY KEY,
    amount       INT NOT NULL,
    mode_        VARCHAR(20) NOT NULL, -- Assuming 20 characters is sufficient for the payment mode
    payment_date DATE NOT NULL
);

INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (1, 60, 'Cash', TO_DATE('2020-09-24', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (2, 30, 'Credit Card', TO_DATE('2020-04-27', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (3, 90, 'Credit Card', TO_DATE('2020-07-07', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (4, 50, 'Debit Card', TO_DATE('2020-02-12', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (5, 40, 'Mobile Payment', TO_DATE('2020-11-20', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (6, 40, 'Debit Card', TO_DATE('2021-06-28', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (7, 10, 'Cash', TO_DATE('2021-08-25', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (8, 30, 'Mobile Payment', TO_DATE('2021-06-17', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (9, 80, 'Cash', TO_DATE('2021-08-25', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (10, 50, 'Mobile Payment', TO_DATE('2021-11-03', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (11, 70, 'Cash', TO_DATE('2022-11-01', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (12, 60, 'Netbanking', TO_DATE('2022-09-11', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (13, 30, 'Netbanking', TO_DATE('2022-12-10', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (14, 50, 'Credit Card', TO_DATE('2022-05-14', 'YYYY-MM-DD'));
INSERT INTO payment(customer_id, amount, mode_, payment_date) VALUES (15, 30, 'Credit Card', TO_DATE('2022-09-25', 'YYYY-MM-DD'));

select * from payment

-- find the average value
select avg(amount) from payment

-- filter the customer data > avg data
select * from payment
where amount > 48

-- this method is not dynamic as if values are changed then the average is aldso changes , so we cannot change the entered average no. everytime.. so to make it dynamic .i.e if we want that the average value should also get changed automatically according to the data we use subquery.
-- same thing using subquery
select * from payment
where amount > (select avg(amount) from payment)

-- if more than one output values are there then we use Logical IN operator ,below is the example.

CREATE TABLE customer(
   customer_id INTEGER  NOT NULL PRIMARY KEY 
  ,first_name  VARCHAR(9) NOT NULL
  ,last_name   VARCHAR(8) NOT NULL
  ,email       VARCHAR(27) NOT NULL
  ,address_id  INTEGER  NOT NULL
);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (1,'Mary','Smith','mary.smith@mailid.com',5);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (2,'Patricia','Johnson','patricia.johnson@mailid.com',6);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (3,'Madan','Mohan','madan.mohan@mailid.com',7);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (4,'Barbara','Jones','barbara.jones@mailid.com',8);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (5,'Elizabeth','Brown','elizabeth.brown@mailid.com',9);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (6,'Jennifer','Davis','jennifer.davis@mailid.com',10);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (7,'Maria','Miller','maria.miller@mailid.com',11);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (8,'Susan','Wilson','susan.wilson@mailid.com',12);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (9,'R','Madhav','r.madhav@mailid.com',13);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (10,'Dorothy','Taylor','dorothy.taylor@mailid.com',14);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (11,'Lisa','Anderson','lisa.anderson@mailid.com',15);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (12,'Nancy','Thomas','nancy.thomas@mailid.com',16);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (13,'Karen','Jackson','karen.jackson@mailid.com',17);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (14,'Betty','White','betty.white@mailid.com',18);
INSERT INTO customer(customer_id,first_name,last_name,email,address_id) VALUES (15,'Helen','Harris','helen.harris@mailid.com',19);

select * from customer
select * from payment
    
select customer_id , amount , mode_ from payment 
where customer_id in (select customer_id from customer)

-- using logical exists operator
select first_name , last_name from customer c
where exists ( select customer_id , amount from payment p
			   where p.customer_id = c.customer_id
    		   and amount > 70)
    
select customer_id , amount from payment
where amount > 70
/*
WINDOW FUNCTION
• Window functions applies aggregate, ranking and analytic functions over a particular window (set of rows).
• And OVER clause is used with window functions to define that window.

WINDOW FUNCTION SYNTAX
SELECT column_name(s),
function() OVER ([<PARTITION BY Clause>]
				[<ORDER BY Clause>]
				[<ROW or RANGE Clause>] )
FROM table_name

    {funciton()}                    {over}
Select a function               Define a window
• Aggregate functions            • PARTITION BY                
• Ranking functions              • ORDER BY
• Analytic functions             • ROWS

WINDOW FUNCTION TERMS
Let's look at some definitions:
• Window function applies aggregate, ranking and analytic functions over a particular window; for example, sum, avg, or row_number
• Expression is the name of the column that we want the window function operated on. This may not be necessary depending on what window function is used
• OVER is just to signify that this is a window function
• PARTITION BY divides the rows into partitions so we can specify which rows to use to compute the window function
• ORDER BY is used so that we can order the rows within each partition. This is optional and does not have to be specified
• ROWS can be used if we want to further limit the rows within our partition. This is optional and usually not used

WINDOW FUNCTION TYPES
There is no official division of the SQL window functions into categories but high level we can divide into three types

Window Functions
1.Aggregate
•SUM
•AVG
•COUNT
•MIN
•MAX

2.Ranking
•ROW_NUMBER
•RANK
•DENSE_RANK
•PERCENT RANK

3.Value/Analytic
• LEAD
• LAG
• FIRST_VALUE
• LAST_VALUE

CASE Expression
• The CASE expression goes through conditions and returns a value when the first condition is met (like if-then-else statement). If no conditions are true, it returns the value in the ELSE clause.
• If there is no ELSE part and no conditions are true, it returns NULL.
• Also called CASE STATEMENT

CASE Statement Syntax
• General CASE Syntax

CASE
	WHEN condition1 THEN result1
	WHEN condition2 THEN result2
	WHEN conditionN THEN resultN
	ELSE other_result
END;

Example:
SELECT customer_id, amount, CASE
	WHEN amount > 100 THEN 'Expensive product'
	WHEN amount = 100 THEN 'Moderate product'
	ELSE 'Inexpensive product'
END AS ProductStatus
FROM payment

CASE Expression Syntax
• CASE Expression Syntax

CASE Expression
	WHEN value 1 THEN result1
	WHEN value2 THEN result2
	WHEN valueN THEN resultN
	ELSE other_result
END;

SELECT customer_id, CASE amount
	WHEN 500 THEN 'Prime Customer'
	WHEN 100 THEN 'Plus Customer'
	ELSE 'Regular Customer'
END AS CustomerStatus
FROM payment

Common Table Expression (CTE)
• A common table expression, or CTE, is a temporary named result set created from a simple SELECT statement that can be used in a subsequent SELECT statement
• We can define CTEs by adding a WITH clause directly before SELECT, INSERT, UPDATE, DELETE, or MERGE statement.
• The WITH clause can include one or more CTEs separated by commas

Common Table Expression (CTE)
• Syntax

WITH my_cte AS (
	SELECT a,b,c        --  }	CTE query
	FROM Table1)        --  }
SELECT a,c           --   }	MAIN query
FROM my_cte          --   }

The name of this CTE is my_cte, and the CTE query is SELECT a,b,c FROM Table1.
The CTE starts with the WITH keyword, after which you specify the name of your CTE, then the content of the query in parentheses.
The main query comes after the closing parenthesis and refers to the CTE.
Here, the main query (also known as the outer query) is SELECT a,c FROM my_cte

Recursive СТЕ
• A recursive CTE references itself. It returns the result subset, then it repeatedly (recursively) references itself, and stops when it returns all the results.
• A recursive CTE has three elements:
• Non-recursive term: It's a CTE query definition that forms the base result set of the CTE structure.
• Recursive term: One or more CTE query definitior joined with non-recursive term using UNION or UNION ALL operator
• Termination check: the recursion stops when no row are returned from the previous iteration.

• Syntax
WITH RECURSIVE cte_name AS (
	CTE_query_definition          -- non recursive term  which is a  base query / ANCHOR MEMBER
	
	UNION ALL

	recursive_query_definition     -- recursive term    which is a recursive query / RECURSIVE MEMBER
)
SELECT * FROM cte_name

Example:
WITH RECURSIVE my_CTE AS (
	SELECT 1 AS n                 -- BASE QUERY / ANCHOR MEMBER

	UNION ALL

	SELECT n+1 FROM my_CTE         -- RECURSIVE QUERY / RECURSIVE MEMBER
	WHERE n < 3 )                  --
SELECT * FROM my_CTE

Recursive СТЕ
Use cases
• COUNT UP UNTIL THREE
• Finding Bosses and Hierarchical Level for All Employees
• Finding Routes Between Cities
• FINDING ANCESTORS

*/
