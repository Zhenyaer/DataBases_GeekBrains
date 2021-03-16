-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

-- 1.
UPDATE users SET created_at = NOW()
UPDATE users SET updated_at = NOW()

-- 2.
ALTER TABLE users ADD created_at_temp;
UPDATE users SET created_at_temp = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i');
ALTER TABLE users DROP created_at;
ALTER TABLE users RENAME COLUMN created_at_temp TO created_at;

ALTER TABLE users ADD updated_at_temp;
UPDATE users SET updated_at_temp = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE users DROP updated_at;
ALTER TABLE users RENAME COLUMN updated_at_temp TO updated_at;

-- 3.
SELECT * FROM storehouses_products ORDER BY CASE WHEN value > 0 THEN FALSE ELSE TRUE END, value;

-- 4.
SELECT * FROM users WHERE DATE_FORMAT(birthday,'%M') IN ('may', 'august');

-- 5.
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);


-- Практическое задание теме «Агрегация данных»

-- 1.
SELECT AVG(age) FROM users;

-- 2.
SELECT COUNT(*) as day_of_week from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as day_of_week where date=1;
SELECT COUNT(*) as day_of_week from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as day_of_week where date=2;
SELECT COUNT(*) as day_of_week from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as day_of_week where date=3;
SELECT COUNT(*) as day_of_week from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as day_of_week where date=4;
SELECT COUNT(*) as day_of_week from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as day_of_week where date=5;
SELECT COUNT(*) as day_of_week from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as day_of_week where date=6;
SELECT COUNT(*) as day_of_week from (SELECT DAYOFWEEK(CONCAT(YEAR(NOW()),'-',MONTH(birthday),'-',DAYOFMONTH(birthday))) as date from profiles) as day_of_week where date=7;

-- 3.
SELECT EXP(SUM(LOG(value))) FROM unknown_table;



