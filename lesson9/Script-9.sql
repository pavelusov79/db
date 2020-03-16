/*1.В базе данных shop и sample присутствуют одни и те же таблицы,
 учебной базы данных. Переместите запись id = 1 из таблицы 
 shop.users в таблицу sample.users. Используйте транзакции.*/

use sample;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';


-- выполняем транзакию (у меня база данных shop называлась lesson7)
start transaction;
insert into sample.users select * from lesson7.users 
where id = 1;
delete from lesson7.users where id = 1;
commit;

/* 2. Создайте представление, которое выводит название name 
товарной позиции из таблицы products и соответствующее название
каталога name из таблицы catalogs.*/

use lesson7;

create view catalog_name as 
select products.id, products.name, catalogs.name as category
from products
join catalogs on catalogs.id = products.catalog_id;

select * from catalog_name;

/* 1.Создайте хранимую функцию hello(), которая будет возвращать 
 приветствие, в зависимости от текущего времени суток. 
 С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
 с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 с 18:00 до 00:00 — "Добрый вечер", 
 с 00:00 до 6:00 — "Доброй ночи".*/

delimiter //
drop function if exists hello//
create function hello() 
returns varchar(50) deterministic
begin
	if hour(current_time()) between 06 and 12 then 
	return 'доброе утро';
	elseif hour(current_time()) between 12 and 18 then 
	return 'добрый день';
	elseif hour(current_time()) between 18 and 24 then 
	return 'добрый вечер';
	else 
	return 'доброй ночи';
	end if;
end //
select hello() //

delimiter ;

/* 2.В таблице products есть два текстовых поля: name с названием
 товара и description с его описанием. Допустимо присутствие обоих 
 полей или одно из них. Ситуация, когда оба поля принимают
  неопределенное значение NULL неприемлема. Используя триггеры, 
  добейтесь того, чтобы одно из этих полей или оба поля были 
  заполнены. При попытке присвоить полям NULL-значение необходимо 
  отменить операцию.*/

drop trigger if exists check_name_desc;
delimiter //
create trigger check_name_desc before insert on products
for each row
begin
	if new.name is null or new.description is null then 
	signal sqlstate '45000' set message_text = 'недопустимо оставлять пустые поля name и description'; 
	end if;
end//

-- проверяем, оставим поле description пустым
insert products (name, description, price, catalog_id, created_at,
updated_at) values 
('Intel Core i3-8000', null, 13000, 1, now(), now());

show triggers;

/* (по желанию) Пусть имеется любая таблица с календарным
 полем created_at. Создайте запрос, который удаляет устаревшие 
 записи из таблицы, оставляя только 5 самых свежих записей.*/

-- вариант доработал
select @ctn := created_at from products
order by created_at desc limit 5;
delete from products where created_at < @ctn;

-- вариант решения взят из интернета
DELETE from products WHERE created_at < 
  (SELECT created_at FROM 
    (SELECT created_at FROM products ORDER BY created_at DESC LIMIT 5) as t 
  ORDER BY created_at asc limit 1)
 ;
  
  
  

