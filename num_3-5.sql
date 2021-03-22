-- num_3
SELECT IF(
	(SELECT COUNT(id) FROM likes WHERE user_id IN (
		SELECT id FROM profiles WHERE gender_id="1")
	) 
	> 
	(SELECT COUNT(id) FROM likes WHERE user_id IN (
		SELECT id FROM profiles WHERE gender_id="2")
	), 
   'Больше лайков поставили мужчины', 'Больше лайков поставили женщины');

  
-- num_4
SELECT COUNT(target_id) FROM likes WHERE user_id IN (
  SELECT * FROM (
    SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10
    ) as temp
);


-- num_5 Критерий - количество лайков
  
SELECT user_id, COUNT(*) AS unactive_users
FROM likes
GROUP BY user_id
ORDER BY unactive_users LIMIT 10;



--

SELECT * FROM gender;
SELECT * FROM likes;
SELECT * FROM profiles;

SELECT id FROM profiles ORDER BY birthday DESC LIMIT 10