USE HW_2;

CREATE TABLE salepeople (
	snum INT,
	sname VARCHAR(45),
	city VARCHAR(45),
    comm TEXT
);

INSERT INTO salepeople (snum, sname, city, comm)
VALUES 
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');


CREATE TABLE customers (
	cnum INT,
	cname VARCHAR(45),
	city VARCHAR(45),
    rating INT NOT NULL,
    snum INT
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES 
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

CREATE TABLE orders (
	onum INT,
    amt DOUBLE,
    odate DATE,
	cnum INT,
	snum INT
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES 
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

SELECT * FROM salepeople;
SELECT * FROM customers;
SELECT * FROM orders;

-- 1
SELECT city, sname, snum, comm FROM salepeople;

-- 2
SELECT cname, rating FROM customers WHERE city = 'San Jose';

-- 3
SELECT DISTINCT(snum) FROM salepeople;

-- 4
SELECT cname FROM customers WHERE cname LIKE 'G%';

-- 5
SELECT * FROM orders WHERE amt > 1000;

-- 6
SELECT  MIN(amt) AS 'Минимальный заказ' FROM orders;

-- 7
SELECT * FROM customers WHERE rating > 100 AND city = 'Rome';


CREATE TABLE salary (
	id SERIAL PRIMARY KEY, 	
	name VARCHAR(45),
	surname VARCHAR(45),
	specialty VARCHAR(45),
    seniority INT,
    salary INT,
    age INT
);

INSERT INTO salary (name, surname, specialty, seniority, salary, age)
VALUES 
('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
('Петя', 'Петькин', 'Начальник', 8, 70000, 30),
('Катя', 'Катькина', 'Инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'Рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'Уборщик', 10, 10000, 49);

SELECT * FROM salary;

-- 1
SELECT * FROM salary ORDER BY salary;
SELECT * FROM salary ORDER BY salary DESC;

-- 2
SELECT * FROM salary ORDER BY salary DESC LIMIT 5;

-- 3
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT specialty, SUM(salary) AS 'Сумма' 
FROM salary 
GROUP BY specialty 
HAVING SUM(salary) >100000;





