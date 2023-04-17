USE hw_1;

-- Задание 1
CREATE TABLE sales(
	id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
    );
    
    INSERT INTO sales(order_date, count_product)
    VALUES
    ('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
    
-- Задание 2
SELECT id,
	CASE 
		WHEN count_product < 100 THEN 'Маленький заказ'
        WHEN count_product > 300 THEN 'Большой заказ'
        ELSE 'Средний заказ'
	END AS 'Тип заказа'
FROM sales;

SELECT * FROM sales;

-- Задание 3
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
    employee_id VARCHAR (5) NOT NULL,
    amount DOUBLE NOT NULL,
    order_status TEXT NOT NULL
    );
    
INSERT INTO orders(employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT id, employee_id, amount,
	CASE order_status
		WHEN 'OPEN' THEN 'Order is in open state'
        WHEN 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Order is closed'
	END AS 'full_order_status'
FROM orders;

SELECT * FROM orders;
    