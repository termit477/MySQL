USE hw_0;
-- 2 Вывести название, производителя и цену для товаров, количество которых превышает 2
SELECT product_name, manufacturer, price 
FROM mobile_phones
WHERE product_count > 2;

-- 3 Вывести весь ассортимент товаров марки Samsung
SELECT *
FROM mobile_phones
WHERE manufacturer = 'samsung';

-- 4.1 Товары, в которых есть упоминание Iphone
SELECT *
FROM mobile_phones
WHERE product_name  LIKE '%iphone%';

-- 4.2 Товары, в которых есть упоминание Samsung
SELECT *
FROM mobile_phones
WHERE manufacturer LIKE '%samsung%';

-- 4.3 Товары, в которых есть ЦИФРЫ
SELECT *
FROM mobile_phones
WHERE product_name REGEXP '[0-9]';

-- 4.4 Товары, в которых есть ЦИФРА 8
SELECT *
FROM mobile_phones
WHERE product_name REGEXP '[8]';