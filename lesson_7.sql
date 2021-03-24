USE shop_7les;

-- 1
SELECT name FROM users
JOIN orders ON users.id  = orders.user_id;

-- 2 
SELECT products.id, products.name, catalogs.name AS catalog_name 
FROM products
JOIN catalogs ON products.catalog_id = catalogs.id

-- 3
SELECT id, C1.name AS 'from', C2.name as 'to'
FROM flights
JOIN cities C1 ON C1.label = flights.'from'
JOIN cities C2 ON C2.label = flights.'to'
ORDER BY flights.id 



SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM catalogs;
SELECT * FROM products;
