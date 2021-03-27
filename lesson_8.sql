USE vk

-- num_3
SELECT gender_id FROM profiles p
JOIN likes l ON l.user_id = p.user_id
GROUP BY gender_id
ORDER BY COUNT(l.user_id) DESC
LIMIT 1;


-- num_4
SELECT SUM(target_id) FROM likes l
JOIN profiles p ON l.user_id = p.user_id
ORDER BY p.birthday DESC LIMIT 10;


-- num_5 Критерий - количество лайков
SELECT p.first_name, p.last_name, p.patronymic_name, l.target_id AS unactive_users FROM profiles p
JOIN likes l ON p.user_id = l.user_id
ORDER BY unactive_users LIMIT 10;
	




