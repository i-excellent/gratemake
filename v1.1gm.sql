-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.28 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных greatmake
CREATE DATABASE IF NOT EXISTS `greatmake` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `greatmake`;


-- Дамп структуры для таблица greatmake.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) DEFAULT NULL,
  `id_work` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `text` mediumtext,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.comment: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.menu: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `name`, `count`) VALUES
	(0, 'Наука в целом', NULL),
	(1, '	Философия. Психология', NULL),
	(2, 'Религия. Теология', NULL),
	(3, 'Теория и методы общественных наук', NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Дамп данных таблицы greatmake.migration: ~12 rows (приблизительно)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1470775707),
	('m140209_132017_init', 1470775715),
	('m140403_174025_create_account_table', 1470775715),
	('m140504_113157_update_tables', 1470775715),
	('m140504_130429_create_token_table', 1470775715),
	('m140830_171933_fix_ip_field', 1470775715),
	('m140830_172703_change_account_table_name', 1470775715),
	('m141222_110026_update_ip_field', 1470775716),
	('m141222_135246_alter_username_length', 1470775716),
	('m150614_103145_update_social_account_table', 1470775716),
	('m150623_212711_fix_username_notnull', 1470775716),
	('m151218_234654_add_timezone_to_profile', 1470775716);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы greatmake.profile: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
	(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.social_account
CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы greatmake.social_account: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subject_menu` (`id_menu`),
  CONSTRAINT `FK_subject_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.subject: ~13 rows (приблизительно)
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`id`, `id_menu`, `name`, `count`) VALUES
	(9, 1, 'Сущность и задачи философии', NULL),
	(10, 1, 'Психология', NULL),
	(11, 1, 'Логика. Теория познания. Методология и логика наук', NULL),
	(12, 1, 'Этика. Учение о морали. Практическая философия', NULL),
	(13, 1, 'Эстетика', NULL),
	(14, 3, 'Демография. Социология. Статистика', NULL),
	(15, 3, 'Политика', NULL),
	(16, 3, 'Экономика. Народное хозяйство. Экономические науки', NULL),
	(17, 3, 'Право. Юридические науки', NULL),
	(18, 3, 'Государственное административное управление. Военн', NULL),
	(19, 3, 'Социальное обеспечение. Социальная помощь. Обеспеч', NULL),
	(20, 3, 'Народное образование. Воспитание. Обучение. Органи', NULL),
	(21, 3, 'Этнография. Нравы. Обычаи. Жизнь народа. Фольклора', NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.token
CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы greatmake.token: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.trade
CREATE TABLE IF NOT EXISTS `trade` (
  `id` int(11) DEFAULT NULL,
  `id_user_seller` int(11) DEFAULT NULL,
  `id_user_buyer` int(11) DEFAULT NULL,
  `id_work` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.trade: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.type
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) DEFAULT NULL,
  `name` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.type: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_email` (`email`),
  UNIQUE KEY `user_unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы greatmake.user: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
	(1, 'excellent', 'freemen@pochta.ru', '$2y$10$IGW.pXhC9a6rO3HA1vw9R.Z4qPbMS4j/8P65byyj3EPXphXzpkcnG', '9Bw60Jdk6tUbkkxk8TX6nvAo3s5rkXC0', 1470776808, NULL, NULL, '127.0.0.1', 1470776422, 1470776422, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.work
CREATE TABLE IF NOT EXISTS `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `id_subject` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `name_file` varchar(255) DEFAULT NULL,
  `count_page` int(11) DEFAULT NULL,
  `description` mediumtext,
  `price` float unsigned zerofill DEFAULT NULL,
  `time_public` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `file_name` varchar(50) DEFAULT NULL,
  `year` year(4) DEFAULT '2016',
  `bibliography` mediumtext,
  `content` mediumtext,
  `views` int(11) DEFAULT NULL,
  `crypte_views` mediumtext,
  `theme` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.work: 4 rows
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` (`id`, `id_menu`, `id_subject`, `id_user`, `id_type`, `name_file`, `count_page`, `description`, `price`, `time_public`, `file_name`, `year`, `bibliography`, `content`, `views`, `crypte_views`, `theme`) VALUES
	(15, 3, 17, 1, 1, 'hard sql.txt', NULL, '<p>4444444444444444444444444444444444444444444444444444444444222222222222222</p>', 000000005555, NULL, NULL, '2016', NULL, '<p>42222222222222222222222222222222222222222222222222222222222222222222222222222222</p>', NULL, NULL, '"истроия рыцаря"'),
	(14, 3, 17, 1, 1, 'hard sql.txt', NULL, '<p>4444444444444444444444444444444444444444444444444444444444222222222222222</p>', 000000005555, NULL, NULL, '2016', NULL, '<p>42222222222222222222222222222222222222222222222222222222222222222222222222222222</p>', NULL, NULL, '"истроия рыцаря"'),
	(16, 0, 9, 1, 1, 'testemail.txt', NULL, '<p>veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeererrrrrrrrrrrrrre</p>', 000000000000, NULL, NULL, '2016', NULL, '<p>reeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee</p>', NULL, NULL, '"истроия рыцаря"'),
	(17, 0, 9, 1, 3, 'hard sql.txt', NULL, '<p>&nbsp;</p><ol><li>213123123123</li><li>u76u67u67u</li><li>k8k78k7k87k</li><li>k78k8k7k78k78</li><li>213123123123</li><li>u76u67u67u</li><li>k8k78k7k87k</li><li>k78k8k7k78k78</li><li>213123123123</li><li>u76u67u67u</li><li>k8k78k7k87k</li><li>k78k8k7k78k78</li></ol>', 000000000000, NULL, NULL, '2016', NULL, '<p>&nbsp;</p><ol><li>213123123123</li><li>u76u67u67u</li><li>k8k78k7k87k</li><li>k78k8k7k78k78</li><li>213123123123</li><li>u76u67u67u</li><li>k8k78k7k87k</li><li>k78k8k7k78k78</li><li>213123123123</li><li>u76u67u67u</li><li>k8k78k7k87k</li><li>k78k8k7k78k78</li></ol>', NULL, NULL, '"истроия рыцаря"'),
	(18, 3, 9, 1, 1, 'Novyiy tekstovyiy dokument (2).txt', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$$file_name$file_name$file_name$file_name$file_name$file_namefile_name$file_name$file_name$file_name$file_name</p>', 000000000000, '2016-08-13 10:34:44', NULL, '2016', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_nam$file_name$file_name$file_namee$file_name$file_name$file_name$file_name</p>', NULL, NULL, '"истроия рыцаря"'),
	(19, 3, 9, 1, 1, 'Novyiy tekstovyiy dokument (2).txt', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$$file_name$file_name$file_name$file_name$file_name$file_namefile_name$file_name$file_name$file_name$file_name</p>', 000000000000, '2016-08-13 10:35:51', NULL, '2016', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_nam$file_name$file_name$file_namee$file_name$file_name$file_name$file_name</p>', NULL, NULL, '"истроия рыцаря"'),
	(20, 3, 9, 1, 1, 'Novyiy tekstovyiy dokument (2).txt', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$$file_name$file_name$file_name$file_name$file_name$file_namefile_name$file_name$file_name$file_name$file_name</p>', 000000000000, '2016-08-13 10:36:01', NULL, '2016', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_nam$file_name$file_name$file_namee$file_name$file_name$file_name$file_name</p>', NULL, NULL, '"истроия рыцаря"'),
	(21, 3, 9, 1, 1, 'Novyiy tekstovyiy dokument (2).txt', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$$file_name$file_name$file_name$file_name$file_name$file_namefile_name$file_name$file_name$file_name$file_name</p>', 000000000000, '2016-08-13 10:37:44', NULL, '2016', NULL, '<p>$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_name$file_nam$file_name$file_name$file_namee$file_name$file_name$file_name$file_name</p>', NULL, NULL, '"истроия рыцаря"');
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
