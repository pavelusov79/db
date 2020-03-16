/*Пусть в таблице users поля created_at и updated_at 
 оказались незаполненными. Заполните их текущими датой 
 и временем.*/

-- таблица users не имеет данных полей. Сначала добавим 
-- пустые поля created_at, updated_at

ALTER TABLE users 
ADD created_at DATETIME DEFAULT NULL, 
ADD updated_at DATETIME DEFAULT NULL;

-- теперь заполним их текущей датой и временем

UPDATE users SET 
created_at=NOW(),
updated_at=NOW();

/*Таблица users была неудачно спроектирована. Записи created_at
 и updated_at были заданы типом VARCHAR и в них долгое время
 помещались значения в формате "20.10.2017 8:10". Необходимо 
 преобразовать поля к типу DATETIME, сохранив введеные ранее 
 значения.*/

-- изменим тип на VARCAR в стобцах created_at. updated_at 

UPDATE users 
SET 
created_at=NULL,
updated_at=NULL;

ALTER TABLE users 
CHANGE created_at created_at VARCHAR(255),
CHANGE updated_at updated_at VARCHAR(255);

-- заполним данными столбцов created_at, updated_at таблицы users

UPDATE users 
SET 
created_at = '20.10.2014 8:10', 
updated_at = '10.05.2018 14:35';

-- изменим тип данных на DATETIME

UPDATE users 
SET
created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE users 
CHANGE 
created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE users 
CHANGE 
updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

/*(по желанию) Из таблицы users (взял из profiles) необходимо извлечь пользователей, 
 родившихся в марте и феврале.*/
 
SELECT * FROM profiles 
WHERE MONTHNAME(birthday) IN ('March', 'February')
ORDER BY MONTHNAME(birthday);

/*В таблице складских запасов storehouses_products в поле value 
могут встречаться самые разные цифры: 0, если товар закончился и 
выше нуля, если на складе имеются запасы. Необходимо отсортировать
записи таким образом, чтобы они выводились в порядке увеличения 
значения value. Однако, нулевые запасы должны выводиться в конце, 
после всех записей.*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT storehouses_products (storehouse_id, product_id, value, created_at, updated_at) VALUES
(1, 1, 0, NOW(), NOW()),
(1, 2, 5, NOW(), NOW()),
(1, 3, 0, NOW(), NOW()),
(1, 4, 12, NOW(), NOW()),
(1, 5, 5, NOW(), NOW()),
(2, 1, 0, NOW(), NOW()),
(2, 2, 5, NOW(), NOW()),
(2, 3, 0, NOW(), NOW()),
(2, 4, 12, NOW(), NOW()),
(2, 5, 5, NOW(), NOW());

SELECT * FROM storehouses_products
ORDER BY IF(value = 0, 13, value);
 






