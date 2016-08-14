-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.48 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных greatmake
CREATE DATABASE IF NOT EXISTS `greatmake` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `greatmake`;


-- Дамп структуры для таблица greatmake.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_work` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `text` mediumtext,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.comment: ~0 rows (приблизительно)
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.menu: ~26 rows (приблизительно)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `name`, `url`, `count`) VALUES
	(4, 'Безопасность жизнедеятельности и охрана труда', 'bezopasnost_zhiznedeiatelnosti', 0),
	(5, 'Горно-геологическая отрасль', 'gorno-geologicheskaia_otrasl', 0),
	(6, 'Журналистика', 'journalistics', 0),
	(7, 'Информатика', 'informatics', 1),
	(8, 'История', 'history', 0),
	(9, 'Конфликтология', 'conflictology', 0),
	(10, 'Культурология', 'culture', 0),
	(11, 'Маркетинг, реклама и PR', 'marketing_reklama_i_pr', 0),
	(12, 'Математика', 'matematika', 0),
	(13, 'Международные отношения', 'international_relations', 0),
	(14, 'Менеджмент', 'management', 0),
	(15, 'Промышленность и машиностроение ', 'machinery', 0),
	(16, 'Педагогика', 'pedagogika', 0),
	(17, 'Психология', 'psihologiia', 0),
	(19, 'Право и правоведение', 'law', 0),
	(20, 'Политология', 'politology', 0),
	(21, 'Религиоведение', 'religion', 0),
	(22, 'Сельское хозяйство', 'agroculture', 0),
	(23, 'Сервис и туризм', 'tourism', 0),
	(24, 'Социология', 'sotsiologiia', 0),
	(25, 'Физика', 'phisics', 0),
	(26, 'Философия', 'philosophy', 0),
	(27, 'Химия', 'chemistry', 0),
	(28, 'Филология', 'philology', 0),
	(29, 'Другие науки', 'other', 0),
	(30, 'Экономика и финансы', 'economics', 0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Дамп данных таблицы greatmake.migration: ~12 rows (приблизительно)
DELETE FROM `migration`;
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

-- Дамп данных таблицы greatmake.profile: ~2 rows (приблизительно)
DELETE FROM `profile`;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
	(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, '', '', 'test@test.com', 'b642b4217b34b1e8d3bd915fc65c4452', '', '', '', 'Pacific/Kiritimati');
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
DELETE FROM `social_account`;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_subject_menu` (`id_menu`),
  CONSTRAINT `FK_subject_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.subject: ~199 rows (приблизительно)
DELETE FROM `subject`;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`id`, `id_menu`, `name`, `url`, `count`) VALUES
	(22, 4, 'Основы безопасности жизнедеятельности (ОБЖ)', 'osnovyi_bezopasnosti_jiznedeyatelnosti_obj', 0),
	(23, 4, 'Гражданская оборона', 'grajdanskaya_oborona', 0),
	(24, 4, 'Охрана труда', 'ohrana_truda', 0),
	(25, 4, 'ПДД и безопасность движения', 'pdd_i_bezopasnost_dvijeniya', 0),
	(26, 4, 'Первая медицинская помощь', 'pervaya_meditsinskaya_pomosch', 0),
	(27, 4, 'Правила и техника безопасности', 'pravila_i_tehnika_bezopasnosti', 0),
	(28, 4, 'Правила и техника безопасности', 'pravila_i_tehnika_bezopasnosti', 0),
	(29, 4, 'Пожаро и электробезопасность', 'pojaro_i_elektrobezopasnost', 0),
	(30, 4, 'Экология', 'ekologiya', 0),
	(31, 4, 'Различные аспекты безопасности', 'razlichnyie_aspektyi_bezopasnosti', 0),
	(32, 5, 'Геология', 'geologiya', 0),
	(33, 5, 'Геофизика', 'geofizika', 0),
	(34, 5, 'Геохимия', 'geohimiya', 0),
	(35, 5, 'Горные машины и оборудование', 'gornyie_mashinyi_i_oborudovanie', 0),
	(36, 5, 'История и методология геологии', 'istoriya_i_metodologiya_geologii', 0),
	(37, 5, 'Экологическая геология', 'ekologicheskaya_geologiya', 0),
	(38, 5, 'Разное', 'raznoe', 0),
	(39, 6, 'Актуальные проблемы журналистики', 'aktualnyie_problemyi_jurnalistiki', 0),
	(40, 6, 'Аналитическая журналистика', 'analiticheskaya_jurnalistika', 0),
	(41, 6, 'Деловая журналистика', 'delovaya_jurnalistika', 0),
	(42, 6, 'Интернет-журналистика', 'internet-jurnalistika', 0),
	(43, 6, 'Основы журналистики (ОЖД)', 'osnovyi_jurnalistiki_ojd', 0),
	(44, 6, 'Печатная журналистика', 'pechatnaya_jurnalistika', 0),
	(45, 6, 'Современные иностранные СМИ', 'sovremennyie_inostrannyie_smi', 0),
	(46, 6, 'Теория журналистики', 'teoriya_jurnalistiki', 0),
	(47, 6, 'Тележурналистика', 'telejurnalistika', 0),
	(48, 6, 'Иностранная журналистика', 'inostrannaya_jurnalistika', 0),
	(49, 6, 'Разное', 'raznoe', 0),
	(50, 7, 'Информационные системы', 'informatsionnyie_sistemyi', 0),
	(51, 7, 'Базы данных', 'bazyi_dannyih', 0),
	(52, 7, 'Основы информатики', 'osnovyi_informatiki', 0),
	(53, 7, 'Программирования', 'programmirovaniya', 1),
	(54, 7, 'Информационная безопасность', 'informatsionnaya_bezopasnost', 0),
	(55, 7, 'Информационные технологии', 'informatsionnyie_tehnologii', 0),
	(56, 7, 'Искуственный интеллект', 'iskustvennyiy_intellekt', 0),
	(57, 7, 'Алгоритмизация и теория алгоритмов', 'algoritmizatsiya_i_teoriya_algoritmov', 0),
	(58, 7, 'Операционные системы', 'operatsionnyie_sistemyi', 0),
	(59, 7, 'Право в информатике', 'pravo_v_informatike', 0),
	(60, 7, 'Проектирование', 'proektirovanie', 0),
	(61, 7, 'Сети и сетевое администрирование', 'seti_i_setevoe_administrirovanie', 0),
	(62, 7, 'Системы автоматизированного проектирования САПР', 'sistemyi_avtomatizirovannogo_proektirovaniya_sapr', 0),
	(63, 7, 'Связь и коммуникация', 'svyaz_i_kommunikatsiya', 0),
	(64, 7, 'Разное', 'raznoe', 0),
	(65, 8, 'Всемирная история', 'vsemirnaya_istoriya', 0),
	(66, 8, 'История древнего мира', 'istoriya_drevnego_mira', 0),
	(67, 8, 'История доколумбовых цивилизаций Америки', 'istoriya_dokolumbovyih_tsivilizatsiy_ameriki', 0),
	(68, 8, 'История цивилизаций', 'istoriya_tsivilizatsiy', 0),
	(69, 8, 'История новейшего времени', 'istoriya_noveyshego_vremeni', 0),
	(70, 8, 'История средних веков', 'istoriya_srednih_vekov', 0),
	(71, 8, 'История России', 'istoriya_rossii', 0),
	(72, 8, 'История стран Европы', 'istoriya_stran_evropyi', 0),
	(73, 8, 'История Америки', 'istoriya_ameriki', 0),
	(74, 8, 'Археология', 'arheologiya', 0),
	(75, 8, 'Этнография и этнология', 'etnografiya_i_etnologiya', 0),
	(76, 8, 'Разное', 'raznoe', 0),
	(77, 9, 'Социальная конфликтология', 'sotsialnaya_konfliktologiya', 0),
	(78, 9, 'Педагогическая конфликтология', 'pedagogicheskaya_konfliktologiya', 0),
	(79, 9, 'Политическая конфликтология', 'politicheskaya_konfliktologiya', 0),
	(80, 9, 'Психология конфликта', 'psihologiya_konflikta', 0),
	(81, 9, 'Социология конфликта', 'sotsiologiya_konflikta', 0),
	(82, 9, 'Разное', 'raznoe', 0),
	(83, 10, 'Мировая художественная культура', 'mirovaya_hudojestvennaya_kultura', 0),
	(84, 10, 'Разное', 'raznoe', 0),
	(85, 11, 'Теория брендов', 'teoriya_brendov', 0),
	(86, 11, 'Интернет-маркетинг', 'internet-marketing', 0),
	(87, 11, 'Теория маркетинга', 'teoriya_marketinga', 0),
	(88, 11, 'Международный маркетинг', 'mejdunarodnyiy_marketing', 0),
	(89, 11, 'PR и связи с общественностью', 'pr_i_svyazi_s_obschestvennostyu', 0),
	(90, 11, 'История рекламы и маркетинга', 'istoriya_reklamyi_i_marketinga', 0),
	(91, 11, 'Рекламное дело', 'reklamnoe_delo', 0),
	(92, 11, 'Разное', 'raznoe', 0),
	(93, 12, 'Высшая математика', 'vyisshaya_matematika', 0),
	(94, 12, 'Вычислительная математика', 'vyichislitelnaya_matematika', 0),
	(95, 12, 'Математическая логика', 'matematicheskaya_logika', 0),
	(96, 12, 'Методы оптимизации', 'metodyi_optimizatsii', 0),
	(97, 12, 'Теория вероятностей и математическая статистика', 'teoriya_veroyatnostey_i_matematicheskaya_statistik', 0),
	(98, 12, 'Разное', 'raznoe', 0),
	(99, 13, 'Геополитика', 'geopolitika', 0),
	(100, 13, 'Теории международных отношений', 'teorii_mejdunarodnyih_otnosheniy', 0),
	(101, 13, 'История международных отношений', 'istoriya_mejdunarodnyih_otnosheniy', 0),
	(102, 13, 'Современные международные отношения в Европе', 'sovremennyie_mejdunarodnyie_otnosheniya_v_evrope', 0),
	(103, 13, 'Международные организации', 'mejdunarodnyie_organizatsii', 0),
	(104, 13, 'Европейский Союз', 'evropeyskiy_soyuz', 0),
	(105, 13, 'НАТО', 'nato', 0),
	(106, 13, 'Проблемы международных отношений', 'problemyi_mejdunarodnyih_otnosheniy', 0),
	(107, 13, 'Безопасность в мире', 'bezopasnost_v_mire', 0),
	(108, 13, 'Экономическая ситуация в странах мира', 'ekonomicheskaya_situatsiya_v_stranah_mira', 0),
	(109, 13, 'Внешняя политика отдельных стран', 'vneshnyaya_politika_otdelnyih_stran', 0),
	(110, 13, 'Разное', 'raznoe', 0),
	(111, 14, 'Делопроизводство и документоведение', 'deloproizvodstvo_i_dokumentovedenie', 0),
	(112, 14, 'Управление предприятием', 'upravlenie_predpriyatiem', 0),
	(113, 14, 'Управление качеством', 'upravlenie_kachestvom', 0),
	(114, 14, 'Управление проектами', 'upravlenie_proektami', 0),
	(115, 14, 'Международный менеджмент', 'mejdunarodnyiy_menedjment', 0),
	(116, 14, 'Кадровый менеджмент и управление персоналом', 'kadrovyiy_menedjment_i_upravlenie_personalom', 0),
	(117, 14, 'Управление рисками', 'upravlenie_riskami', 0),
	(118, 14, 'Разное', 'raznoe', 0),
	(119, 15, 'Стандартизация и взаимозаменяемость', 'standartizatsiya_i_vzaimozamenyaemost', 0),
	(120, 15, 'Теория машин и механизмов', 'teoriya_mashin_i_mehanizmov', 0),
	(121, 15, 'Материалы и сопротивление материалов', 'materialyi_i_soprotivlenie_materialov', 0),
	(122, 15, 'Проектирование в машиностроении', 'proektirovanie_v_mashinostroenii', 0),
	(123, 15, 'Топливно энергетический комплекс ТЭК', 'toplivno_energeticheskiy_kompleks_tek', 0),
	(124, 15, 'Транспорт', 'transport', 0),
	(125, 15, 'Разное', 'raznoe', 0),
	(126, 16, 'Воспитательный процесс', 'vospitatelnyiy_protsess', 0),
	(127, 16, 'Методики преподавания', 'metodiki_prepodavaniya', 0),
	(128, 16, 'Дошкольное образование', 'doshkolnoe_obrazovanie', 0),
	(129, 16, 'Общая педагогика', 'obschaya_pedagogika', 0),
	(130, 16, 'Педагогика высшей школы', 'pedagogika_vyisshey_shkolyi', 0),
	(131, 16, 'Инновации в образовании и управление образованием', 'innovatsii_v_obrazovanii_i_upravlenie_obrazovaniem', 0),
	(132, 16, 'Разное', 'raznoe', 0),
	(133, 17, 'Возрастная психология', 'vozrastnaya_psihologiya', 0),
	(134, 17, 'Психология состояний', 'psihologiya_sostoyaniy', 0),
	(135, 17, 'Сексология и сексопаталогия', 'seksologiya_i_seksopatalogiya', 0),
	(136, 17, 'Психология девиантного поведения', 'psihologiya_deviantnogo_povedeniya', 0),
	(137, 17, 'История психологии', 'istoriya_psihologii', 0),
	(138, 17, 'Социальная работа', 'sotsialnaya_rabota', 0),
	(139, 17, 'Разное', 'raznoe', 0),
	(140, 19, 'Административное право', 'administrativnoe_pravo', 0),
	(141, 19, 'Гражданское право', 'grajdanskoe_pravo', 0),
	(142, 19, 'Международное публичное право', 'mejdunarodnoe_publichnoe_pravo', 0),
	(143, 19, 'Различные аспекты права', 'razlichnyie_aspektyi_prava', 0),
	(144, 19, 'Следственная работа', 'sledstvennaya_rabota', 0),
	(145, 19, 'Судебный и следственный процесс', 'sudebnyiy_i_sledstvennyiy_protsess', 0),
	(146, 19, 'Теория и история права', 'teoriya_i_istoriya_prava', 0),
	(147, 19, 'Трудовое право', 'trudovoe_pravo', 0),
	(148, 19, 'Уголовное право', 'ugolovnoe_pravo', 0),
	(149, 19, 'Разное', 'raznoe', 0),
	(150, 20, 'Государственное устройство и режимы', 'gosudarstvennoe_ustroystvo_i_rejimyi', 0),
	(151, 20, 'Политические партии', 'politicheskie_partii', 0),
	(152, 20, 'Власть и общество', 'vlast_i_obschestvo', 0),
	(153, 20, 'Разное', 'raznoe', 0),
	(155, 21, 'Атеизм и свободомыслие', 'ateizm_i_svobodomyislie', 0),
	(156, 21, 'История религий', 'istoriya_religiy', 0),
	(157, 21, 'Межрелигиозные отношения', 'mejreligioznyie_otnosheniya', 0),
	(158, 21, 'Религия и наука', 'religiya_i_nauka', 0),
	(159, 21, 'Разное', 'raznoe', 0),
	(160, 22, 'Агрохимия и агропочвоведение', 'agrohimiya_i_agropochvovedenie', 0),
	(161, 22, 'Отдельные науки о сельском хозяйстве', 'otdelnyie_nauki_o_selskom_hozyaystve', 0),
	(162, 22, 'Экономика сельского хозяйства', 'ekonomika_selskogo_hozyaystva', 0),
	(163, 22, 'Разное', 'raznoe', 0),
	(164, 23, 'История туризма и гостеприимства', 'istoriya_turizma_i_gostepriimstva', 0),
	(165, 23, 'Ресторанно-гостиничный бизнес', 'restoranno-gostinichnyiy_biznes', 0),
	(166, 23, 'Туризм', 'turizm', 0),
	(167, 23, 'Сервисная деятельность', 'servisnaya_deyatelnost', 0),
	(168, 23, 'Разное', 'raznoe', 0),
	(169, 24, 'Гендерная социология', 'gendernaya_sotsiologiya', 0),
	(170, 24, 'Демография', 'demografiya', 0),
	(171, 24, 'Общая социология', 'obschaya_sotsiologiya', 0),
	(172, 24, 'Социальная информатика', 'sotsialnaya_informatika', 0),
	(173, 24, 'Социология культуры', 'sotsiologiya_kulturyi', 0),
	(174, 24, 'Социология общества и личности', 'sotsiologiya_obschestva_i_lichnosti', 0),
	(175, 24, 'История социологии', 'istoriya_sotsiologii', 0),
	(176, 24, 'Разное', 'raznoe', 0),
	(177, 25, 'Астрономия и астрофизика', 'astronomiya_i_astrofizika', 0),
	(178, 25, 'Атомная и ядерная физика', 'atomnaya_i_yadernaya_fizika', 0),
	(179, 25, 'Квантовая физика и теория относительности', 'kvantovaya_fizika_i_teoriya_otnositelnosti', 0),
	(180, 25, 'Механика', 'mehanika', 0),
	(181, 25, 'Оптика', 'optika', 0),
	(182, 25, 'История физики', 'istoriya_fiziki', 0),
	(183, 25, 'Термодинамика', 'termodinamika', 0),
	(184, 25, 'Электричество и магнетизм', 'elektrichestvo_i_magnetizm', 0),
	(185, 25, 'Разное', 'raznoe', 0),
	(186, 26, 'Логика', 'logika', 0),
	(187, 26, 'Политическая философия', 'politicheskaya_filosofiya', 0),
	(188, 26, 'Социальная философия', 'sotsialnaya_filosofiya', 0),
	(189, 26, 'Философия культуры', 'filosofiya_kulturyi', 0),
	(190, 26, 'История философии', 'istoriya_filosofii', 0),
	(191, 26, 'Философия науки', 'filosofiya_nauki', 0),
	(192, 26, 'Отдельные философы и философские течения', 'otdelnyie_filosofyi_i_filosofskie_techeniya', 0),
	(193, 26, 'Разное', 'raznoe', 0),
	(194, 30, 'Аудит, ревизия и контроль', 'audit,_reviziya_i_kontrol', 0),
	(195, 30, 'Банковское дело', 'bankovskoe_delo', 0),
	(196, 30, 'Биржевая торговля', 'birjevaya_torgovlya', 0),
	(197, 30, 'Бухгалтерский учет ', 'buhgalterskiy_uchet_', 0),
	(198, 30, 'Внешнеэкономическая деятельность', 'vneshneekonomicheskaya_deyatelnost', 0),
	(199, 30, 'Государственная экономика и планирование', 'gosudarstvennaya_ekonomika_i_planirovanie', 0),
	(200, 30, 'Деньги и кредит', 'dengi_i_kredit', 0),
	(201, 30, 'Инвестиции ', 'investitsii_', 0),
	(202, 30, 'Институциональная экономика', 'institutsionalnaya_ekonomika', 0),
	(203, 30, 'Коммерческая деятельность предприятия', 'kommercheskaya_deyatelnost_predpriyatiya', 0),
	(204, 30, 'Лизинг и логистика', 'lizing_i_logistika', 0),
	(205, 30, 'Мировая экономика', 'mirovaya_ekonomika', 0),
	(206, 30, 'Предприятие и предпринимательство', 'predpriyatie_i_predprinimatelstvo', 0),
	(207, 30, 'Страхование', 'strahovanie', 0),
	(208, 30, 'Отраслевая экономика', 'otraslevaya_ekonomika', 0),
	(209, 30, 'Финансовый менеджмент', 'finansovyiy_menedjment', 0),
	(210, 30, 'Экономическая теория', 'ekonomicheskaya_teoriya', 0),
	(211, 30, 'Разные экономические дисциплины', 'raznyie_ekonomicheskie_distsiplinyi', 0),
	(212, 27, 'Аналитическая химия', 'analiticheskaya_himiya', 0),
	(214, 27, 'Органическая химия', 'organicheskaya_himiya', 0),
	(215, 27, 'Химическая технология', 'himicheskaya_tehnologiya', 0),
	(216, 27, 'Разное', 'raznoe', 0),
	(217, 28, 'Отдельные языки и языкознание', 'otdelnyie_yazyiki_i_yazyikoznanie', 0),
	(218, 28, 'Литература и литературоведение', 'literatura_i_literaturovedenie', 0),
	(219, 28, 'Разное', 'raznoe', 0),
	(220, 29, 'Медицинские специальности', 'meditsinskie_spetsialnosti', 0),
	(221, 29, 'Разное', 'raznoe', 0);
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

-- Дамп данных таблицы greatmake.token: ~1 rows (приблизительно)
DELETE FROM `token`;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
	(2, 'K_GzasQA96scKHyX3hAXhtIOtLsI6w5D', 1471102403, 2);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.trade
CREATE TABLE IF NOT EXISTS `trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_seller` int(11) DEFAULT NULL,
  `id_user_buyer` int(11) DEFAULT NULL,
  `id_work` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_trade_user` (`id_user_seller`),
  KEY `FK_trade_user_2` (`id_user_buyer`),
  KEY `FK_trade_work` (`id_work`),
  CONSTRAINT `FK_trade_user` FOREIGN KEY (`id_user_seller`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_trade_user_2` FOREIGN KEY (`id_user_buyer`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_trade_work` FOREIGN KEY (`id_work`) REFERENCES `work` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.trade: ~0 rows (приблизительно)
DELETE FROM `trade`;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы greatmake.user: ~2 rows (приблизительно)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
	(1, 'excellent', 'freemen@pochta.ru', '$2y$10$IGW.pXhC9a6rO3HA1vw9R.Z4qPbMS4j/8P65byyj3EPXphXzpkcnG', '9Bw60Jdk6tUbkkxk8TX6nvAo3s5rkXC0', 1470776808, NULL, NULL, '127.0.0.1', 1470776422, 1470776422, 1),
	(2, 'test', 'freee@gmail.com', '$2y$10$oedHJp.hYrUI1fYiprNA2ONvqiHWcLikQPGvUCdKWe.MIhfnk6nM2', 'QPmnvN1DwKmq8PnF4ZW4Q_jBRk95GIXx', 1471091638, 'loss.of.loss@gmail.com', NULL, '127.0.0.1', 1471091523, 1471102403, 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Дамп структуры для таблица greatmake.work
CREATE TABLE IF NOT EXISTS `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `id_subject` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `theme` varchar(255) NOT NULL,
  `name_file` varchar(255) DEFAULT NULL,
  `count_page` int(11) DEFAULT NULL,
  `description` text,
  `price` int(10) DEFAULT '0',
  `time_public` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `save_name` varchar(50) DEFAULT NULL,
  `year` year(4) DEFAULT '2016',
  `bibliography` text,
  `content` text,
  `views` int(11) DEFAULT NULL,
  `crypte_views` text,
  PRIMARY KEY (`id`),
  KEY `FK_work_menu` (`id_menu`),
  KEY `FK_work_subject` (`id_subject`),
  KEY `FK_work_user` (`id_user`),
  CONSTRAINT `FK_work_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_work_subject` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_work_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы greatmake.work: ~1 rows (приблизительно)
DELETE FROM `work`;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` (`id`, `id_menu`, `id_subject`, `id_user`, `id_type`, `theme`, `name_file`, `count_page`, `description`, `price`, `time_public`, `save_name`, `year`, `bibliography`, `content`, `views`, `crypte_views`) VALUES
	(1, 7, 53, 2, 2, '"истроия рыцаря"', 'Diplomna robota.doc', 1221, '«Калории.ру» – это проект, посвященный здоровому и сбалансированному питанию и здоровому образу жизни. Стоит уделить даже немного внимания нашему рациону, и качество жизни сразу же улучшается, а вместе с ним повышается настроение и тонус!', 1222, '2016-08-14 22:18:31', '2_1471202311.doc', '1999', '', '', NULL, NULL);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;


-- Дамп структуры для триггер greatmake.work_count_add
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `work_count_add` AFTER INSERT ON `work` FOR EACH ROW BEGIN
    UPDATE menu SET menu.count = 1 + menu.count WHERE NEW.id_menu = menu.id;
    UPDATE subject SET subject.count = 1 + subject.count WHERE NEW.id_subject = subject.id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Дамп структуры для триггер greatmake.work_count_minus
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `work_count_minus` AFTER DELETE ON `work` FOR EACH ROW BEGIN
    UPDATE menu SET menu.count = menu.count - 1 WHERE OLD.id_menu = menu.id;
    UPDATE subject SET subject.count = subject.count - 1 WHERE OLD.id_subject = subject.id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
