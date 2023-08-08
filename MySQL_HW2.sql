-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными;
CREATE TABLE sales (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	order_date DATE,
	bucket INT DEFAULT '0');
    
INSERT INTO sales(order_date, bucket)
VALUES
	('2021-01-01', 105),
	('2021-01-02', 250),
	('2021-01-03', 80),
	('2021-01-04', 160),
	('2021-01-05', 480);

SELECT * FROM sales;

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	id AS 'id заказа',
	IF (bucket < 100, 'Маленький заказ', 
		IF (bucket BETWEEN 100 AND 300, 'Средний заказ', 'Большой заказ')
	) AS 'Тип заказа'	
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	employee_id VARCHAR(5) NOT NULL UNIQUE DEFAULT 'e00',
	amount FLOAT(7,2) NOT NULL DEFAULT '0.00',
    order_status VARCHAR(15) NOT NULL DEFAULT 'OPEN'
);

INSERT INTO `orders` (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e06', 99.99, 'OPEN');

SELECT * FROM orders;

SELECT 
	employee_id AS 'Номер заказа',
	amount AS 'Сумма заказа',
    CASE order_status 
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full_order_status'	
FROM orders;

-- 4. Чем NULL отличается от 0?
/* NULL это отсутсвие значений в ячейке, а 0 это цифра (арифметическое значение).*/