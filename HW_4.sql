USE hw_4;

-- Задание 1

CREATE TABLE cars (
id SERIAL PRIMARY KEY, 
name VARCHAR(50) NOT NULL,
cost INT NOT NULL);

INSERT INTO cars (name, cost)
VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

SELECT * FROM cars;

CREATE VIEW car_price AS
SELECT * FROM cars
WHERE cost < 25000;

SELECT * FROM car_price;

ALTER VIEW car_price AS
SELECT * FROM cars
WHERE cost <30000;

CREATE VIEW name_cars AS
SELECT * FROM cars
WHERE name = 'Skoda' OR name = 'Audi';

SELECT * FROM name_cars;

-- Задание 2
CREATE TABLE analisis (
an_id SERIAL PRIMARY KEY, 
an_name VARCHAR(50) NOT NULL,
an_cost INT NOT NULL,
an_price INT NOT NULL,
an_group VARCHAR(50) NOT NULL);

INSERT INTO analisis (an_name, an_cost, an_price, an_group)
VALUES
('WBC', 300, 500, 1),
('RBC', 120, 250, 1),
('HGB', 700, 1100, 2),
('PLT', 450, 660, 3),
('MPV', 330, 570, 1);

SELECT * FROM analisis;

CREATE TABLE groups1 (
gr_id SERIAL PRIMARY KEY, 
gr_name VARCHAR(50) NOT NULL,
gr_temp INT NOT NULL);

INSERT INTO groups1 (gr_name, gr_temp)
VALUES
('-циты', 5),
('-глобин', 15),
('-крит', 25);

SELECT * FROM groups1;

CREATE TABLE orders (
ord_id SERIAL PRIMARY KEY, 
ord_datatime DATE NOT NULL,
ord_an INT NOT NULL);

INSERT INTO orders (ord_datatime, ord_an)
VALUES
('2020-02-01', 2),
('2020-02-02', 5),
('2020-02-02', 1),
('2020-02-03', 4),
('2020-02-03', 4),
('2020-02-03', 2),
('2020-02-05', 1),
('2020-02-05', 5),
('2020-02-05', 3),
('2020-02-06', 3),
('2020-02-07', 3),
('2020-02-07', 5),
('2020-02-08', 4),
('2020-02-08', 1),
('2020-02-09', 2),
('2020-02-10', 4),
('2020-02-11', 5),
('2020-02-12', 3),
('2020-02-13', 1),
('2020-02-13', 1),
('2020-02-14', 2);

SELECT * FROM orders;

CREATE VIEW price AS
SELECT an_name, an_cost, an_price, ord_datatime FROM analisis
INNER JOIN orders ON analisis.an_id = orders.ord_an
WHERE ord_datatime BETWEEN '2020-02-05' AND '2020-02-11';

SELECT * FROM price;

-- Задание 3
CREATE TABLE station (
train_id INT NOT NULL, 
station_character VARCHAR(50) NOT NULL,
station_time TIME NOT NULL);

INSERT INTO station (train_id, station_character, station_time)
VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

SELECT * FROM station;

SELECT *,
TIMEDIFF(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY station_time),
 LEAD (station_time, 0) OVER(PARTITION BY train_id)) time_to_next_station
FROM station;






