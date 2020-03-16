/* 1.Составьте список пользователей users, которые осуществили 
хотя бы один заказ orders в интернет магазине.*/

-- вставим данные в табл orders для user_id 1,3 и 5
INSERT orders(user_id, created_at, updated_at) VALUES
(1, '2018-03-25 15:00:11', NOW()),
(3, '2019-11-01 22:43:56', NOW()),
(5, NOW(), NOW());
SELECT * FROM orders;

-- выполним сам запрос
SELECT * FROM users
WHERE EXISTS (SELECT * FROM orders WHERE user_id = users.id);

/* 2. Выведите список товаров products и разделов catalogs, который 
соответствует товару*/

SELECT id, name, price, description,
(SELECT name FROM catalogs WHERE id = products.catalog_id) 
AS catalogs_name,
created_at, updated_at
FROM products
ORDER BY catalogs_name;

/* 3.(по желанию) Пусть имеется таблица рейсов flights (id, from, to)
и таблица городов cities (label, name). Поля from, to и label 
содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.*/

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
id SERIAL PRIMARY KEY,
from_ VARCHAR(50) NOT NULL,
to_ VARCHAR(50) NOT NULL
);

INSERT flights (from_, to_) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
lable VARCHAR(50),
name VARCHAR(50)
);

INSERT cities (lable, name) VALUES
('moscow', 'Москва'),
('novgorod', 'Новгород'),
('irkutsk', 'Иркутск'),
('kazan', 'Казань'),
('omsk', 'Омск');

-- сам запрос

SELECT id,
(SELECT name from cities WHERE cities.lable = flights.from_ ) AS 'from'
, (SELECT name from cities WHERE cities.lable = flights.to_) AS 'to'
FROM flights;














