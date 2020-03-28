/*
 Практическое задание по теме “Оптимизация запросов”
Создайте таблицу logs типа Archive. Пусть при каждом создании записи 
в таблицах users, catalogs и products в таблицу logs помещается 
время и дата создания записи, название таблицы, идентификатор 
первичного ключа и содержимое поля name.
 */

use vk;

drop table if exists logs;
create table logs(
	`date` datetime default now(),
	table_name varchar (100),
	id_field bigint,
	name varchar(100)
) engine=ARCHIVE;

drop trigger if exists users_logs;
delimiter //
create trigger users_logs after insert on users
for each row
BEGIN 
	insert logs(table_name, id_field, name) values ('users', LAST_INSERT_ID(), concat(new.firstname, ' ', new.lastname ));
END;//

delimiter ;

insert users(firstname, lastname, email, phone) values
('Коля', 'Васечкин', '4495m22@yandex.ru', 791400003233)  ;

insert users(firstname, lastname, email, phone) values
('Маша', 'Нарядная', 'naryad1109@yandex.ru', 791400005533)  ;

select * from logs;

/*
 для таблиц products, catalogs должны быть созданы также триггеры
 
 я брал за основу базу vk там нет данных таблиц
 */


