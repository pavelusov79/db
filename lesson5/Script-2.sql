/*Подсчитайте средний возраст пользователей в таблице users*/

SELECT FLOOR(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25)) 
AS 'midle age' FROM profiles;

/*Подсчитайте количество дней рождения, которые приходятся на каждый из 
дней недели. Следует учесть, что необходимы дни недели текущего года, 
а не года рождения.*/

SELECT 
COUNT(*),
WEEKDAY(birthday) as week_day
FROM profiles
GROUP BY week_day
ORDER BY week_day DESC;