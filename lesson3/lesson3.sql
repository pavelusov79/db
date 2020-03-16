DROP TABLE IF EXISTS live_strim;
CREATE TABLE live_strim(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(255) DEFAULT NULL,
	
	FOREIGN KEY (media_id) REFERENCES media(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT='таблица прямой эфир';

DROP TABLE IF EXISTS users_posts;
CREATE TABLE users_posts(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	name_post VARCHAR(255) NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (community_id) REFERENCES communities(id)
) COMMENT='таблица посты юзера';

DROP TABLE IF EXISTS types_news;
CREATE TABLE types_news(
	id SERIAL PRIMARY KEY,
	topic_news VARCHAR(255) NOT NULL
) COMMENT='таблица темы новостей';

DROP TABLE IF EXISTS news;
CREATE TABLE news(
	id SERIAL PRIMARY KEY,
	topic_news_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	name_news VARCHAR(255) NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	INDEX(topic_news_id),
	
	FOREIGN  KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (community_id) REFERENCES communities(id),
	FOREIGN KEY (topic_news_id) REFERENCES types_news(id)
) COMMENT='таблица новости';
