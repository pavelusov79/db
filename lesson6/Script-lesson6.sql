/*1. Пусть задан некоторый пользователь user_id=1. Из всех друзей этого 
пользователя найдите человека, который больше всех общался с нашим 
пользователем.*/

SELECT from_user_id, COUNT(*) as quantity FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY quantity DESC;

/* 2. Подсчитать общее количество лайков, которые получили 
пользователи младше 10 лет..*/

SELECT COUNT(user_id) AS children FROM likes
WHERE user_id IN(
SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) 
< 10
);

/*3. Определить кто больше поставил лайков (всего) 
мужчины или женщины?*/
select count(*) as count_likes,
(select IF(gender = 'm', 'male', 'female') 
from profiles where user_id =
	(select id from users where id = likes.user_id)
) as gender
from likes
group by gender
order by  count_likes DESC; 
-- или можно еще дописать limit 1
















