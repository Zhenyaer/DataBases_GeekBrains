CREATE DATABASE Lostfilm;
USE Lostfilm;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  email varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  UNIQUE KEY email (email)
 );


DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  first_name varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  last_name varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  nickname varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Отчество пользователя',
  gender_id int unsigned DEFAULT NULL,
  birthday date DEFAULT NULL COMMENT 'Дата рождения',
  country varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Страна проживания', 
  city varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (user_id),
  KEY profiles_fk_gender_id (gender_id),
  CONSTRAINT profiles_fk_gender_id FOREIGN KEY (gender_id) REFERENCES gender (`id`) ON DELETE SET NULL,
  CONSTRAINT `profiles_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);


DROP TABLE IF EXISTS gender;
CREATE TABLE gender (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  gender varchar(25) DEFAULT NULL COMMENT 'Название пола',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id)
);


DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  from_user_id int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  to_user_id int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  body text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  is_delivered tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  is_read tinyint(1) DEFAULT NULL COMMENT 'Признак прочтения',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY messages_fk_from_user_id (from_user_id),
  KEY messages_fk_to_user_id (to_user_id),
  CONSTRAINT messages_fk_from_user_id FOREIGN KEY (from_user_id) REFERENCES users (id),
  CONSTRAINT messages_fk_to_user_id FOREIGN KEY (to_user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS notification;
CREATE TABLE notification (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  user_id int unsigned NOT NULL COMMENT 'Ссылка на получателя уведомления',
  serial_id int unsigned NOT NULL COMMENT 'Ссылка на содержимое видеофайла',
  is_read tinyint(1) DEFAULT NULL COMMENT 'Признак прочтения',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  KEY notification_fk_user_id (user_id),
  KEY notification_fk_serial_id (serial_id),
  CONSTRAINT notification_fk_user_id FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT notification_fk_serial_id FOREIGN KEY (serial_id) REFERENCES serials (id)
);


DROP TABLE IF EXISTS media;
CREATE TABLE media (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  user_id int unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил видеофайл',
  serial_id int unsigned NOT NULL COMMENT 'Ссылка на видеофайл',
  schedule_id int unsigned NOT NULL COMMENT 'Ссылка описание видеофайла',
  filename varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя файлу',
  size int NOT NULL COMMENT 'Размер файла',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  KEY media_fk_serial_id (serial_id),
  KEY media_fk_schedule_id (schedule_id),
  KEY media_fk_user_id (user_id),
  CONSTRAINT media_fk_user_id FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT media_fk_serial_id FOREIGN KEY (serial_id) REFERENCES serials (id),
  CONSTRAINT media_fk_schedule_id FOREIGN KEY (schedule_id) REFERENCES schedule (id)
);


DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  serial_id int unsigned NOT NULL COMMENT 'Ссылка место видеофайла',
  release_date datetime COMMENT 'Дата выхода',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  KEY notification_fk_serial_id (serial_id),
  CONSTRAINT schedule_fk_serial_id FOREIGN KEY (serial_id) REFERENCES serials (id)
  );


DROP TABLE IF EXISTS serials;
CREATE TABLE serials (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  news_id int unsigned NOT NULL COMMENT 'Ссылка на новости',
  review_id int unsigned NOT NULL COMMENT 'Ссылка на описание',
  serial_name varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название сериала',
  season_name varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название сезона',
  epizode_name varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название эпизода',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  KEY serials_fk_news_id (news_id),
  KEY serials_fk_review_id (review_id),
  CONSTRAINT notification_fk_news_id FOREIGN KEY (news_id) REFERENCES news (id),
  CONSTRAINT notification_fk_review_id FOREIGN KEY (review_id) REFERENCES review (id)
);


DROP TABLE IF EXISTS news;
CREATE TABLE news (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  post text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текст новости',
  actor text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Биография актера',
  interview text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текстовое интервью',
  article text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текст статьи',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS review;
CREATE TABLE review (
  id int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  release_date datetime COMMENT 'Дата выхода',
  actors text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Перечень актеров',
  description text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание',
  created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
);





