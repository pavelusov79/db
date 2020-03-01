INSERT users (firstname, lastname, email, phone) VALUES
('Маша','Петрова', 'petrova@mail.ru', 9147937800),
('Лена','Иванова', 'l.ivanova@mail.ru', 9147937807),
('Михаил','Козлов', 'micha1@mail.ru', 9147937806),
('Михаил','Петров', 'petrov111@mail.ru', 9147937804),
('Надя','Падеждова', 'nadya333@mail.ru', 9147937810),
('Таня','Иванесян', 'tanya1974@mail.ru', 9147937844),
('Андрей','Незлобный', 'nezl@mail.ru', 9147937805),
('Тимур','Данильянц', 'timoty@mail.ru', 9147937801),
('Егор','Кривенко', 'ekriv@mail.ru', 9147937855),
('Артур','Чернов', 'art1@mail.ru', 9147937820),
('Артур','Найденов', 'arturyan@mail.ru', 9147937822),
('Маша','Страшная', 'strach@mail.ru', 9147937700),
('Даша','Петрова', 'petrova.dasha@mail.ru', 9147937701),
('Семен','Слепаков', 'senya@mail.ru', 9147937702),
('Данил','Козлов', 'danya111@mail.ru', 9147937703);

-- TRUNCATE TABLE profiles;
INSERT profiles (gender, birthday, photo_id, created_at, hometown) VALUES
('ж', '1983-02-23', 2, '2012-01-28', 'Москва'),
('ж', '1980-01-02', 99, '2011-01-20', 'Москва'),
('м', '1980-03-05', 3, '2015-07-01', 'Санкт-Петербург'),
('м', '1983-03-20', 5, '2009-12-25', 'Оренбург'),
('ж', '1978-02-23', 7, '2010-04-20', 'Казань'),
('ж', '1985-10-10', 4, '2013-06-14', 'Хабаровск'),
('м', '1985-02-23', 6, '2010-07-14', 'Санкт-Петербург'),
('м', '1982-02-10', 8, '2013-09-21', 'Москва'),
('м', '1980-04-04', 9, '2014-05-20', 'Санкт-Петербург'),
('м', '1986-07-16', 10, '2016-06-21', 'Кривой Рог'),
('м', '1985-06-27', 11, '2011-01-06', 'Астрахань'),
('ж', '1983-02-23', 12, '2016-07-28', 'Москва'),
('ж', '1980-02-23', 13, '2014-09-08', 'Владивосток'),
('м', '1973-02-03', 15, '2012-01-28', 'Москва'),
('м', '1985-12-03', 14, '2017-08-24', 'КАлуга');

INSERT messages (from_user_id, to_user_id, body, created_at) VALUES
(1, 2, ')))))', '2020-01-15'),
(1, 3, ')))))', '2020-01-17'),
(4, 2, 'hi, how are you?', '2020-01-15'),
(2, 15, 'hi, how are you?', '2020-02-10'),
(15, 2, 'ok', '2020-02-12'),
(2, 5, ')))))', '2020-01-10'),
(6, 3, 'bla-bla-bla', '2019-12-15'),
(7, 10, ')))))', '2020-01-11'),
(10, 13, 'привет, как дела?', '2020-02-02'),
(13, 10, 'хорошо', '2020-02-05'),
(8, 15, '-------------', '2019-03-15'),
(14, 4, ')))))', '2020-03-15'),
(6, 11, '............', '2020-01-29'),
(9, 8, ')))))', '2020-04-15'),
(11, 5, ')))))', '2020-01-15');

INSERT friend_requests (initiator_user_id, target_user_id, status, requested_at, confirmed_at) VALUES
(2, 4, 'requested', '2019-12-24', null),
(4, 2, 'approved', '2019-12-28', null),
(1, 6, 'requested', '2020-01-01', null),
(3, 7, 'requested', '2019-11-22', null),
(15, 5, 'requested', '2019-12-05', null),
(5, 15, 'approved', '2019-12-05', '2020-01-02'),
(7, 3, 'declined', '2019-11-22', '2019-12-12'),
(14, 13, 'requested', '2020-02-20', null),
(12, 11, 'requested', '2019-12-31', null),
(11, 12, 'approved', '2019-12-31', '2020-01-18'),
(6, 8, 'requested', '2019-12-01', null),
(7, 9, 'requested', '2019-12-24', null),
(8, 6, 'declined', '2019-12-01', '2020-01-20'),
(9, 7, 'approved', '2019-12-24', '2020-01-29'),
(7, 1, 'requested', '2020-01-31', null);

INSERT communities (name) VALUES
('cats'),
('pets'),
('auto'),
('finance'),
('python'),
('c+'),
('c#'),
('java'),
('javascript'),
('ruby'),
('php'),
('sysadmin'),
('bikes'),
('shopping'),
('cinema'),
('reading'),
('forex');

INSERT users_communities VALUES
(1, 16),
(1, 4),
(2, 7),
(3, 16),
(3, 4),
(2, 5),
(4, 8),
(4, 12),
(5, 16),
(5, 8),
(5, 7),
(6, 2),
(6, 13),
(6, 15),
(7, 15),
(7, 5),
(7, 12),
(8, 4),
(8, 5),
(9, 2),
(9, 3),
(9, 4),
(10, 13),
(10, 10),
(10, 8),
(11, 5),
(11, 13),
(11, 3),
(12, 2),
(12, 1),
(12, 6),
(13, 7),
(13, 9),
(13, 8),
(14, 3),
(14, 4),
(14, 5),
(15, 11),
(15, 12);

INSERT media_types (name, created_at, updated_at) VALUES
('photo', '2019-11-01', DEFAULT),
('video', '2019-11-20', DEFAULT),
('live_stream', DEFAULT, DEFAULT);

INSERT media (media_type_id, user_id, body, filename, size, metadata, created_at, updated_at) VALUES
(1, 1, null, 'photo1', 1024, NULL, '2019-11-01', default),
(2, 1, null, 'video1', 254000, NULL, '2019-11-10', default),
(1, 2, null, 'photo2', 10240, NULL, '2019-11-05', default),
(2, 2, null, 'video2', 222222, NULL, '2019-11-30', default),
(3, 2, null, 'sunday morning', 2223445, NULL, '2019-12-01', default),
(1, 3, null, 'photo3', 1024, NULL, '2019-01-01', default),
(1, 3, null, 'photo4', 1024, NULL, '2019-12-01', default),
(1, 3, null, 'photo1', 1024, NULL, '2011-11-01', default),
(2, 4, null, 'cool_video', 349955, NULL, '2019-11-01', '2020-02-10'),
(2, 4, null, 'proso_video', 3333334, NULL, '2019-12-31', default),
(3, 5, null, 'skating', 3334455, NULL, '2020-01-15', default),
(1, 5, null, 'photo5', 1024, NULL, '2020-02-02', default),
(1, 6, null, 'photo1', 1024, NULL, '2019-11-01', default),
(2, 6, null, 'video1', 254000, NULL, '2019-11-10', default),
(1, 7, null, 'photo2', 10240, NULL, '2019-11-05', default),
(2, 7, null, 'video2', 222222, NULL, '2019-11-30', default),
(3, 7, null, 'sunday morning', 2223445, NULL, '2019-12-01', default),
(1, 8, null, 'photo3', 1024, NULL, '2019-01-01', default),
(1, 8, null, 'photo4', 1024, NULL, '2019-12-01', default),
(1, 8, null, 'photo1', 1024, NULL, '2011-11-01', default),
(2, 9, null, 'cool_video', 349955, NULL, '2019-11-01', '2020-02-10'),
(2, 9, null, 'proso_video', 3333334, NULL, '2019-12-31', default),
(3, 10, null, 'skating', 3334455, NULL, '2020-01-15', default),
(1, 10, null, 'photo5', 1024, NULL, '2020-02-02', default),
(1, 11, null, 'photo1', 1024, NULL, '2019-11-01', default),
(2, 11, null, 'video1', 254000, NULL, '2019-11-10', default),
(1, 12, null, 'photo2', 10240, NULL, '2019-11-05', default),
(2, 12, null, 'video2', 222222, NULL, '2019-11-30', default),
(3, 12, null, 'sunday morning', 2223445, NULL, '2019-12-01', default),
(1, 13, null, 'photo3', 1024, NULL, '2019-01-01', default),
(1, 13, null, 'photo4', 1024, NULL, '2019-12-01', default),
(1, 13, null, 'photo1', 1024, NULL, '2011-11-01', default),
(2, 14, null, 'cool_video', 349955, NULL, '2019-11-01', '2020-02-10'),
(2, 14, null, 'proso_video', 3333334, NULL, '2019-12-31', default),
(3, 15, null, 'skating', 3334455, NULL, '2020-01-15', default),
(1, 15, null, 'photo5', 1024, NULL, '2020-02-02', default);

INSERT likes (user_id, media_id, created_at) VALUES
(1, 37, '2020-02-01'),
(2, 38, '2020-02-01'),
(3, 40, '2020-01-01'),
(1, 55, '2020-02-01'),
(2, 60, '2020-02-01'),
(3, 72, '2020-01-01'),
(4, 57, '2020-02-01'),
(4, 38, '2020-02-01'),
(5, 44, '2020-01-01'),
(5, 49, '2020-02-01'),
(6, 51, '2020-02-01'),
(6, 70, '2020-01-01'),
(7, 37, '2020-02-01'),
(7, 39, '2020-02-01'),
(8, 41, '2020-01-01'),
(8, 54, '2020-01-25'),
(9, 64, '2020-01-21'),
(9, 71, '2020-01-01'),
(10, 57, '2020-01-11'),
(11, 38, '2020-02-05'),
(11, 45, '2020-01-14'),
(12, 48, '2020-02-23'),
(12, 68, '2020-02-14'),
(13, 69, '2020-01-12'),
(14, 61, '2020-02-05'),
(14, 66, '2020-01-14'),
(15, 58, DEFAULT),
(15, 70, DEFAULT);

INSERT photo_albums (name, user_id) VALUES
('photo1', 1),
('photo2', 2),
('photo3', 3),
('photo4', 3),
('photo1', 3),
('photo5', 5),
('photo1', 6),
('photo2', 7),
('photo3', 8),
('photo4', 8),
('photo1', 8),
('photo5', 10),
('photo1', 11),
('photo2', 12),
('photo1', 13),
('photo3', 13),
('photo4', 13),
('photo5', 15);

INSERT photos (album_id, media_id) VALUES
(1, 37),
(2, 39),
(3, 42),
(4, 43),
(5, 44),
(6, 48),
(7, 49),
(8, 51),
(9, 54),
(10, 55),
(11, 56),
(12, 60),
(13, 61),
(14, 63),
(15, 68),
(16, 66),
(17, 67),
(18, 72);

INSERT live_strim (user_id, media_id, name) VALUES
(2, 41, 'sunday morning'),
(5, 47, 'skating'),
(7, 53, 'sunday morning'),
(10, 59, 'skating'),
(12, 65, 'sunday morning'),
(15, 71, 'skating');

INSERT users_posts (user_id, community_id, name_post, body, created_at) VALUES
(12, 1, 'post1', 'blablabla', '2019-12-31'),
(6, 2, 'post1', 'blablabla', '2019-12-15'),
(9, 2, 'post2', 'blablabla', '2019-12-19'),
(12, 2, 'post3', 'blablabla', '2020-01-04'),
(9, 3, 'post1', 'blablabla', '2020-01-01'),
(11, 3, 'post2', 'blablabla', '2019-01-05'),
(14, 3, 'post3', 'blablabla', '2020-02-02'),
(1, 4, 'post2', 'blablabla', '2020-01-18'),
(3, 4, 'post3', 'blablabla', '2020-01-24'),
(8, 4, 'post1', 'blablabla', '2019-12-31'),
(9, 4, 'post10', 'blablabla', '2020-02-16'),
(14, 4, 'post11', 'blablabla', '2019-12-11'),
(2, 5, 'post1', 'blablabla', '2019-12-31'),
(7, 5, 'post2', 'blablabla', '2020-01-28'),
(8, 5, 'post3', 'blablabla', '2020-02-14'),
(11, 5, 'post12', 'blablabla', '2019-12-14'),
(14, 5, 'post13', 'blablabla', '2019-12-27'),
(12, 6, 'post14', 'blablabla', '2020-01-29'),
(2, 7, 'post1', 'blablabla', '2020-02-10'),
(5, 7, 'post2', 'blablabla', '2020-02-15'),
(13, 7, 'post3', 'blablabla', DEFAULT),
(4, 8, 'post33', 'blablabla', '2019-12-31'),
(12, 1, 'post1', 'blablabla', '2019-12-31'),
(5, 8, 'post2', 'blablabla', '2020-01-16'),
(10, 8, 'post3', 'blablabla', '2020-01-17'),
(13, 8, 'post4', 'blablabla', '2020-02-16'),
(13, 9, 'post20', 'blablabla', '2019-12-31'),
(10, 10, 'post1', 'blablabla', '2020-01-30'),
(15, 11, 'post21', 'blablabla', '2020-02-01'),
(4, 12, 'post1', 'blablabla', '2019-12-25'),
(7, 12, 'post2', 'blablabla', '2019-12-30'),
(15, 12, 'post3', 'blablabla', '2020-02-11'),
(6, 13, 'post100', 'blablabla', '2019-12-01'),
(10, 13, 'post101', 'blablabla', '2020-01-31'),
(11, 13, 'post102', 'blablabla', DEFAULT),
(6, 15, 'post2', 'blablabla', DEFAULT),
(7, 15, 'post1', 'blablabla', '2020-01-31'),
(1, 16, 'post16', 'blablabla', '2019-12-11'),
(3, 16, 'post1', 'blablabla', '2020-01-17'),
(5, 16, 'post3', 'blablabla', DEFAULT);

INSERT types_news (topic_news) VALUES
('it'),
('cinema'),
('gadgets'),
('politics'),
('economics'),
('health'),
('education'),
('linux'),
('world news'),
('pollution'),
('global worming'),
('cars');

INSERT news (topic_news_id, user_id, community_id, name_news, body, created_at) VALUES
(1, 1, 4, 'news1', 'body of it news', '2019-12-24'),
(2, 6, 2, 'news2', 'body of cinema news', '2019-12-25'),
(3, 14, 3, 'news3', 'body of gadgets news', '2019-12-26'),
(4, 8, 5, 'news4', 'body of politics news', '2019-12-04'),
(5, 12, 6, 'news5', 'body of economics news', '2020-01-01'),
(6, 9, 2, 'news6', 'body of health news', '2020-01-14'),
(7, 7, 5, 'news7', 'body of edication news', '2020-01-30'),
(8, 11, 5, 'news8', 'body of linux news', '2020-02-02'),
(9, 4, 12, 'news9', 'body of world news', '2020-02-24'),
(10, 9, 2, 'news10', 'body of pollution news', '2020-01-26'),
(11, 10, 13, 'news11', 'body of global worming news', DEFAULT);
