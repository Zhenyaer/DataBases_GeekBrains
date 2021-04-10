-- Оптимизация запросов
-- 1

CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(100) NOT NULL,
	str_id BIGINT(10) NOT NULL,
	name_value VARCHAR(75) NOT NULL) 
ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS watchlog_users;
delimiter //
CREATE TRIGGER watchlog_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS watchlog_catalogs;
delimiter //
CREATE TRIGGER watchlog_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS watchlog_products;
delimiter //
CREATE TRIGGER watchlog_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;



-- NoSQL
-- 1

HSET ipaddr 127.0.0.1 1

-- 2

SET Alex mail@mail.ru
SET mail@mail Alex
GET Alex
GET mail@mail.ru

-- 3

db.shop.insert({category: 'Молочка'})
db.shop.insert({category: 'Мясо'})
db.shop.update({category: 'Молочка'}, {$set: { products:['сыр', 'йогурт', 'молоко'] }})
db.shop.update({category: 'Мясо'}, {$set: { products:['свинина', 'говядина', 'барранина'] }})