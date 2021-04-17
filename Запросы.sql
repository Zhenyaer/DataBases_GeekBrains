USE Lostfilm;
-- Проверка наполнения данными 

SELECT * FROM users u;
SELECT * FROM profiles p;
SELECT * FROM messages;
SELECT * FROM review r;
SELECT * FROM media m;
SELECT * FROM serials s;
SELECT * FROM notification n;
SELECT * FROM news n;
SELECT * FROM gender g;
SELECT * FROM schedule s; 

SELECT * FROM profiles WHERE first_name = 'Esta' OR last_name = 'Larson';