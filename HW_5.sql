USE HW_5;

-- Задание 1
DELIMITER //
CREATE FUNCTION seconds_to_time(n INT)
RETURNS CHAR(40)
DETERMINISTIC
BEGIN
DECLARE DD CHAR(3);
DECLARE HH, MI, SS CHAR(2);
DECLARE res CHAR(40);
SET DD = CAST(FLOOR(n/60/60/24) AS CHAR(3));
SET HH = CAST(FLOOR(mod(n/60/60/24,1)*24) AS CHAR(2));
SET MI = CAST(FLOOR(mod(mod(n/60/60/24,1)*24,1)*60) AS CHAR(2));
SET SS = CAST(ROUND(mod(mod(mod(n/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
SET res = concat(DD, ' days, ', HH, ' hours, ', MI, ' minutes, ', SS, ' seconds');
RETURN res;
END //
DELIMITER ;

SELECT seconds_to_time(123456) AS conv;

-- Задание 2
DELIMITER //
CREATE FUNCTION even_numbers(n INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE x INT DEFAULT 2;
    DECLARE res VARCHAR(50) DEFAULT '';
	IF n = 2 THEN
		RETURN x;
	ELSE 
		WHILE x <= n DO
			SET res = CONCAT(res, ' ', x);
			SET x = x + 2;
		END WHILE;
		RETURN res;
	END IF;
END //
DELIMITER ;

SELECT even_numbers(10);