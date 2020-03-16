/*Написать скрипт, возвращающий список имен (только firstname)
  пользователей без повторений в алфавитном порядке*/
SELECT DISTINCT firstname FROM users;

/*Написать скрипт, отмечающий несовершеннолетних пользователей
 как неактивных (поле is_active = false). Предварительно
 добавить такое поле в таблицу profiles со значением по
 умолчанию = true (или 1)*/

-- сначала добавим нескольких несовершеннолетних в таблицу users и profiles

INSERT users (firstname, lastname, email, phone) VALUES
('Ася','Васичкина', 'asya000@mail.ru', 9147937600),
('Яна','Малютка', 'yana2005@mail.ru', 9147937507),
('Есения','Есенина', 'yesya_2006@mail.ru', 9147937506);

INSERT profiles (user_id, gender, birthday, photo_id, created_at, hometown) VALUES
(46, 'ж', '2005-02-23', 22, '2019-01-28', 'Москва'),
(47, 'ж', '2006-01-02', 199, '2020-01-20', 'Москва'),
(48, 'ж', '2008-03-05', 33, '2020-02-01', 'Санкт-Петербург');

-- добавляем поле is_active в таблицу profiles со значением true (1) по дефолту

ALTER TABLE profiles ADD COLUMN is_active TINYINT(1) DEFAULT 1;

-- Обновляем таблицу profiles- для несовершеннолетних делаем is_active == 0 

UPDATE profiles 
SET is_active=0
WHERE YEAR(CURRENT_DATE()) - YEAR(profiles.birthday) < 18;


/* Написать скрипт, удаляющий сообщения 
 «из будущего» (дата позже сегодняшней)*/

DELETE FROM messages 
WHERE created_at > NOW(); 

