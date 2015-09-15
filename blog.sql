-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Сен 11 2015 г., 16:28
-- Версия сервера: 5.5.44-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add menu', 7, 'add_menu'),
(20, 'Can change menu', 7, 'change_menu'),
(21, 'Can delete menu', 7, 'delete_menu'),
(22, 'Can add menu item', 8, 'add_menuitem'),
(23, 'Can change menu item', 8, 'change_menuitem'),
(24, 'Can delete menu item', 8, 'delete_menuitem'),
(25, 'Can add page', 9, 'add_page'),
(26, 'Can change page', 9, 'change_page'),
(27, 'Can delete page', 9, 'delete_page'),
(28, 'Can add category', 10, 'add_category'),
(29, 'Can change category', 10, 'change_category'),
(30, 'Can delete category', 10, 'delete_category'),
(31, 'Can add post', 11, 'add_post'),
(32, 'Can change post', 11, 'change_post'),
(33, 'Can delete post', 11, 'delete_post'),
(34, 'Can add block', 12, 'add_block'),
(35, 'Can change block', 12, 'change_block'),
(36, 'Can delete block', 12, 'delete_block'),
(37, 'Can add block html', 13, 'add_blockhtml'),
(38, 'Can change block html', 13, 'change_blockhtml'),
(39, 'Can delete block html', 13, 'delete_blockhtml'),
(40, 'Can add block top posts', 14, 'add_blocktopposts'),
(41, 'Can change block top posts', 14, 'change_blocktopposts'),
(42, 'Can delete block top posts', 14, 'delete_blocktopposts'),
(43, 'Can add kv store', 15, 'add_kvstore'),
(44, 'Can change kv store', 15, 'change_kvstore'),
(45, 'Can delete kv store', 15, 'delete_kvstore');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$20000$lefAduAv70T9$9O5yXtGatAtU4PH/RWL3yXs/q8d4XzogO+ImYmPWzW8=', '2015-09-11 11:54:15', 1, 'admin', '', '', 'author2006@ukr.net', 1, 1, '2015-09-11 11:02:22');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_block`
--

CREATE TABLE IF NOT EXISTS `blog_app_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) NOT NULL,
  `region` varchar(100) NOT NULL,
  `pages` longtext NOT NULL,
  `template` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `blog_app_block`
--

INSERT INTO `blog_app_block` (`id`, `title`, `region`, `pages`, `template`, `status`) VALUES
(1, 'Социальные ссылки в шапке', 'header_social', '*', 'block-html.html', 1),
(2, 'Социальные ссылки в футере', 'footer_social', '*', 'block-html.html', 1),
(3, 'Рекламный блок в шапке', 'header_ads', '*', 'block-html.html', 1),
(4, 'Топ записей', 'top_posts', '*', 'block-top-posts.html', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_blockhtml`
--

CREATE TABLE IF NOT EXISTS `blog_app_blockhtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_app_blockhtml_block_id_714f84874916a953_uniq` (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `blog_app_blockhtml`
--

INSERT INTO `blog_app_blockhtml` (`id`, `content`, `block_id`) VALUES
(2, '<div class="social-links clearfix">\r\n<ul>\r\n	<li><a href="#" target="_blank"><i class="fa fa-facebook">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-twitter">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-google-plus">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-instagram">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-pinterest">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-youtube">&nbsp;</i></a></li>\r\n</ul>\r\n</div>\r\n', 1),
(3, '<div class="social-links clearfix">\r\n<ul>\r\n	<li><a href="#" target="_blank"><i class="fa fa-facebook">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-twitter">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-google-plus">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-instagram">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-pinterest">&nbsp;</i></a></li>\r\n	<li><a href="#" target="_blank"><i class="fa fa-youtube">&nbsp;</i></a></li>\r\n</ul>\r\n</div>\r\n', 2),
(5, '<p><a href="#"><img alt="" src="/media/uploads/2015/09/10/ad-color-mag-large.jpg" style="width: 728px; height: 90px;" /></a></p>\r\n', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_blocktopposts`
--

CREATE TABLE IF NOT EXISTS `blog_app_blocktopposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `main_post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_app_blocktopposts_block_id_5420b0764a8ad5d6_uniq` (`block_id`),
  KEY `blog_app_blocktopposts_360a3eb1` (`main_post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `blog_app_blocktopposts`
--

INSERT INTO `blog_app_blocktopposts` (`id`, `block_id`, `main_post_id`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_blocktopposts_posts`
--

CREATE TABLE IF NOT EXISTS `blog_app_blocktopposts_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blocktopposts_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blocktopposts_id` (`blocktopposts_id`,`post_id`),
  KEY `blog_app_blocktoppo_post_id_5e8085e302da0b94_fk_blog_app_post_id` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `blog_app_blocktopposts_posts`
--

INSERT INTO `blog_app_blocktopposts_posts` (`id`, `blocktopposts_id`, `post_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_category`
--

CREATE TABLE IF NOT EXISTS `blog_app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `show_in_sidebar` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_app_category_2dbcba41` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `blog_app_category`
--

INSERT INTO `blog_app_category` (`id`, `meta_title`, `meta_description`, `meta_keywords`, `title`, `slug`, `show_in_sidebar`) VALUES
(1, '', '', '', 'Спорт', 'sport', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_menu`
--

CREATE TABLE IF NOT EXISTS `blog_app_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `region` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_menuitem`
--

CREATE TABLE IF NOT EXISTS `blog_app_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `css_class` varchar(100) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_app_menuitem_menu_id_3180f4d08a27b687_fk_blog_app_menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_page`
--

CREATE TABLE IF NOT EXISTS `blog_app_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_app_page_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_post`
--

CREATE TABLE IF NOT EXISTS `blog_app_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` longtext,
  `meta_keywords` longtext,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `main_image` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_app_post_2dbcba41` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `blog_app_post`
--

INSERT INTO `blog_app_post` (`id`, `meta_title`, `meta_description`, `meta_keywords`, `title`, `slug`, `content`, `main_image`, `created_at`, `updated_at`, `status`) VALUES
(1, '', '', '', 'Women’s Relay Competition', 'womens-relay-competition', '<p>The young team of Franziska Hildebrand, Franziska Preuss, Vanessa Hinz and Dahlmeier clocked 1 hour, 11 minutes, 54.6 seconds to beat France by just over 1 minute. Italy took bronze, 1:06.1 behind.</p>\r\n\r\n<p>Germany missed six targets overall, avoiding any laps around the penalty loop.</p>\r\n\r\n<p>Maria Dorin Habert of France, who has two individual gold medals at these worlds, passed Russia and France on the last leg and to take her team from fourth to second.</p>\r\n', 'posts/relay-race-655353_1280-800x445_HR3ITKG.jpg', '2015-09-11 12:32:59', '2015-09-11 12:35:14', 'public'),
(2, '', '', '', 'Хуан Мата: "Матч "Манчестер Юнайтед" и "Ливерпуль" — один из самых больших" И еще очень длинный кусок заголовка', 'huan-mata-samyh-bolshih', '<p>Испанский полузащитник &laquo;Манчестер Юнайтед&raquo;&nbsp;<strong>Хуан Мата</strong>&nbsp;с нетерпением ожидает встречи с &laquo;Ливерпулем&raquo;. Футболист отметил, насколько принципиальным является это противостояние в Англии.</p>\r\n\r\n<blockquote>\r\n<p>&laquo;Я знал, когда приехал в Англию, что матч &laquo;Манчестер Юнайтед&raquo; и &laquo;Ливерпуль&raquo; &mdash; один из самых больших, но когда вы находитесь внутри этого противостояния, то понимаете, насколько большой этот матч. История обоих клубов, соперничество&hellip; Вы можете почувствовать всё это с самого начала недели, это невероятно&raquo;, &mdash; цитирует Мату официальный сайт &laquo;Манчестер Юнайтед&raquo;.</p>\r\n</blockquote>\r\n\r\n<p>Напомним, что в пятом туре АПЛ манкунианцы на своем поле будут принимать &laquo;Ливерпуль&raquo;. Одно из самых интересных противостояний английского чемпионата состоится 12 сентября.</p>\r\n', 'posts/2ee61.jpeg', '2015-09-11 12:35:21', '2015-09-11 13:10:35', 'public'),
(3, '', '', '', '"Арсенал" - "Сток Сити". Анонс и прогноз матча', 'arsenal-stok-siti-anons-i-prognoz-matcha', '<p>Лондонскому &laquo;Арсеналу&raquo; пора прерывать неудачную серию домашних поединков. Единственные две победы &laquo;канониры&raquo; добыли в гостях, тогда как на &laquo;Эмирейтс&raquo; в двух матчах нынешнего сезона они довольствовались лишь одним очком. Да и вообще &laquo;Арсенал&raquo; сумел выиграть всего лишь один из последних шести домашних матчей, при этом в пяти из них покинул поле без забитых голов.</p>\r\n\r\n<p>&laquo;Сток Сити&raquo; - пожалуй, самый подходящий соперник для подопечных&nbsp;<a href="http://www.footboom.com/stats/coach/7178" rel="">Арсена Венгера</a>, дабы наконец порадовать своих болельщиков. Дело в том, что &laquo;Арсенал&raquo; выиграл все семь домашних поединков против &laquo;гончаров&raquo; в рамках Премьер-лиги. А в последний раз &laquo;Сток Сити&raquo; добывал очки на поле лондонцев в далеком 1982 году, уступив затем в следующих 11 встречах. И хотя &laquo;Арсенал&raquo; на старте нынешнего сезона откровенно не блещет, команду&nbsp;<a href="http://www.footboom.com/stats/coach/8727" rel="">Марка Хьюза</a>&nbsp;в Лондоне обыгрывать просто обязан.</p>\r\n', 'posts/39810-Arsenal-Stok-Siti.jpeg', '2015-09-11 12:37:48', '2015-09-11 12:38:44', 'public'),
(4, '', '', '', '"Челси" и "Тоттенхэм" могут делить "Уэмбли"', 'chelsi-i-tottenhem-mogut-delit-uembli', '<p>Стадион &laquo;Уэмбли&raquo; в Лондоне может стать домашней ареной для двух лондонских клубов &ndash; &laquo;Челси&raquo; и &laquo;Тоттенхэма&raquo;. Правда, лишь на некоторое время. &laquo;Уэмбли&raquo; может приютить &laquo;синих&raquo; и &laquo;шпор&raquo; на время реконструкций их собственных арен, сообщает Daily Mail.</p>\r\n\r\n<p>&laquo;Челси&raquo; готов отдать 11 миллионов фунтов за аренду главной арены Великобритании, &laquo;Тоттенхэм&raquo; планирует обойтись семью миллионами. &laquo;Синим&raquo; нужна новая арена на период с 2017 по 2020 год, а &laquo;шпорам&raquo; лишь на сезон 2017/18. К лету 2018 года руководство &laquo;Тоттенхэма&raquo; собирается построить новый стадион.</p>\r\n\r\n<p>Напомним, чемпионский титул прошлого сезона в Англии выиграл &laquo;Челси&raquo;.</p>\r\n', 'posts/39816-Uembli.jpeg', '2015-09-11 12:38:48', '2015-09-11 12:40:03', 'public');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_app_post_categories`
--

CREATE TABLE IF NOT EXISTS `blog_app_post_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`category_id`),
  KEY `blog_app_pos_category_id_956d278ce11f69e_fk_blog_app_category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `blog_app_post_categories`
--

INSERT INTO `blog_app_post_categories` (`id`, `post_id`, `category_id`) VALUES
(1, 1, 1),
(5, 2, 1),
(3, 3, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2015-09-11 11:09:29', '1', 'Block object', 1, '', 12, 1),
(2, '2015-09-11 11:19:45', '1', 'BlockHtml object', 1, '', 13, 1),
(3, '2015-09-11 11:34:23', '2', 'Социальные ссылки в шапке', 1, '', 13, 1),
(4, '2015-09-11 11:36:16', '1', 'Социальные ссылки в шапке', 3, '', 13, 1),
(5, '2015-09-11 11:36:42', '2', 'Социальные ссылки в шапке', 2, 'Изменен content.', 13, 1),
(6, '2015-09-11 11:40:15', '2', 'Социальные ссылки в футере', 1, '', 12, 1),
(7, '2015-09-11 11:40:45', '3', 'Социальные ссылки в футере', 1, '', 13, 1),
(8, '2015-09-11 11:54:24', '4', 'Социальные ссылки в шапке', 1, '', 13, 1),
(9, '2015-09-11 11:55:15', '4', 'Социальные ссылки в шапке', 3, '', 13, 1),
(10, '2015-09-11 12:02:04', '3', 'Социальные ссылки в футере', 2, 'Изменен title.', 13, 1),
(11, '2015-09-11 12:02:22', '2', 'Социальные ссылки в шапке', 2, 'Изменен title.', 13, 1),
(12, '2015-09-11 12:05:21', '3', 'Рекламный блок в шапке', 1, '', 12, 1),
(13, '2015-09-11 12:10:21', '5', 'Рекламный блок в шапке', 1, '', 13, 1),
(14, '2015-09-11 12:10:56', '3', 'Рекламный блок в шапке', 2, 'Ни одно поле не изменено.', 12, 1),
(15, '2015-09-11 12:32:52', '1', 'Спорт', 1, '', 10, 1),
(16, '2015-09-11 12:35:14', '1', 'Women’s Relay Competition', 1, '', 11, 1),
(17, '2015-09-11 12:37:39', '2', 'Хуан Мата: "Матч "Манчестер Юнайтед" и "Ливерпуль" — один из самых больших"', 1, '', 11, 1),
(18, '2015-09-11 12:38:44', '3', '"Арсенал" - "Сток Сити". Анонс и прогноз матча', 1, '', 11, 1),
(19, '2015-09-11 12:40:03', '4', '"Челси" и "Тоттенхэм" могут делить "Уэмбли"', 1, '', 11, 1),
(20, '2015-09-11 12:40:58', '4', 'Топ записей', 1, '', 12, 1),
(21, '2015-09-11 12:41:16', '1', 'Топ записей', 1, '', 14, 1),
(22, '2015-09-11 12:45:58', '5', 'test', 1, '', 12, 1),
(23, '2015-09-11 12:46:12', '2', 'test', 1, '', 14, 1),
(24, '2015-09-11 12:51:13', '2', 'test', 3, '', 14, 1),
(25, '2015-09-11 12:51:21', '5', 'test', 3, '', 12, 1),
(26, '2015-09-11 13:10:35', '2', 'Хуан Мата: "Матч "Манчестер Юнайтед" и "Ливерпуль" — один из самых больших" И еще очень длинный кусок заголовка', 2, 'Изменен title.', 11, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'blog_app', 'block'),
(13, 'blog_app', 'blockhtml'),
(14, 'blog_app', 'blocktopposts'),
(10, 'blog_app', 'category'),
(7, 'blog_app', 'menu'),
(8, 'blog_app', 'menuitem'),
(9, 'blog_app', 'page'),
(11, 'blog_app', 'post'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(15, 'thumbnail', 'kvstore');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2015-09-11 11:02:02'),
(2, 'auth', '0001_initial', '2015-09-11 11:02:03'),
(3, 'admin', '0001_initial', '2015-09-11 11:02:03'),
(4, 'contenttypes', '0002_remove_content_type_name', '2015-09-11 11:02:03'),
(5, 'auth', '0002_alter_permission_name_max_length', '2015-09-11 11:02:04'),
(6, 'auth', '0003_alter_user_email_max_length', '2015-09-11 11:02:04'),
(7, 'auth', '0004_alter_user_username_opts', '2015-09-11 11:02:04'),
(8, 'auth', '0005_alter_user_last_login_null', '2015-09-11 11:02:04'),
(9, 'auth', '0006_require_contenttypes_0002', '2015-09-11 11:02:04'),
(10, 'blog_app', '0001_initial', '2015-09-11 11:02:06'),
(11, 'sessions', '0001_initial', '2015-09-11 11:02:06'),
(12, 'blog_app', '0002_auto_20150911_1500', '2015-09-11 12:01:01'),
(13, 'blog_app', '0003_auto_20150911_1506', '2015-09-11 12:06:26'),
(14, 'blog_app', '0004_auto_20150911_1509', '2015-09-11 12:09:23');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ep79qvm1opf9nxgicwel9w3tn7hgexy4', 'OTlkMGQzYzhjY2JjZmQzNDdkMWUwNGNlNWZmNWQ0ZDQxZTM4MzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBkNWNlMDgxNWJjYWRiYTc0MjJhMDA0ZWIzMmY5ZmM0ZDFiNTkyMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-09-25 11:08:21'),
('rfhqvlmrzdxi9o0gk3emkyn4tdsfpsev', 'OTlkMGQzYzhjY2JjZmQzNDdkMWUwNGNlNWZmNWQ0ZDQxZTM4MzU4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBkNWNlMDgxNWJjYWRiYTc0MjJhMDA0ZWIzMmY5ZmM0ZDFiNTkyMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-09-25 11:54:15');

-- --------------------------------------------------------

--
-- Структура таблицы `thumbnail_kvstore`
--

CREATE TABLE IF NOT EXISTS `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `thumbnail_kvstore`
--

INSERT INTO `thumbnail_kvstore` (`key`, `value`) VALUES
('sorl-thumbnail||image||101306d57803d3b7964a11567842c5b6', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/8c/03/8c034239801afb88de5841bbb715373e.jpg", "size": [392, 218]}'),
('sorl-thumbnail||image||29640ffa6afe599691e91c95ae27d041', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/3f/be/3fbe8c085d36f0a7ab3540e69e32f4e7.jpg", "size": [392, 218]}'),
('sorl-thumbnail||image||49e0c39c6bac425c1bf4c2c9d4eb7e84', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "posts/39816-Uembli.jpeg", "size": [846, 470]}'),
('sorl-thumbnail||image||4b68e62c624622299bae0b029e23eef1', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/6a/09/6a09b28dc858b4dff6f7f32b568ba573.jpg", "size": [392, 218]}'),
('sorl-thumbnail||image||4bf6772ac61f27a1af23da0f826274a7', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "posts/39810-Arsenal-Stok-Siti.jpeg", "size": [846, 470]}'),
('sorl-thumbnail||image||5a50706f015b8ed978337074cf378a84', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "posts/2ee61.jpeg", "size": [846, 470]}'),
('sorl-thumbnail||image||5f9475bd597a323aead03e04dcdb0877', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ed/a6/eda6832982307198e9968e6d05c62853.jpg", "size": [392, 272]}'),
('sorl-thumbnail||image||622e6396d8e7feb3a233202bdc772e0f', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "posts/relay-race-655353_1280-800x445_HR3ITKG.jpg", "size": [800, 445]}'),
('sorl-thumbnail||image||849a64acacd049259655fe5bd566b5ea', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/8e/c1/8ec17e5d1908d898a67b49d4ca4758d5.jpg", "size": [392, 272]}'),
('sorl-thumbnail||image||8e1b195e16a1d5d9516023f4c279c054', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/0c/56/0c5692f2deb0e71eb46bec73df1d3624.jpg", "size": [392, 272]}'),
('sorl-thumbnail||image||c6ecab62c5307ded061f04391dad7c75', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/fc/9c/fc9c028f46e105b193857198d50bbf2d.jpg", "size": [392, 272]}'),
('sorl-thumbnail||image||eb4def48f35a2a0a719282d676b2123f', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/9b/f7/9bf734ad447c60359e2447138a8f77d8.jpg", "size": [392, 218]}'),
('sorl-thumbnail||image||f2409175d90bae034c4112386ddb805b', '{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/12/42/1242ac31b8ca8ef81915ef629b1ac0b7.jpg", "size": [800, 445]}'),
('sorl-thumbnail||thumbnails||49e0c39c6bac425c1bf4c2c9d4eb7e84', '["4b68e62c624622299bae0b029e23eef1"]'),
('sorl-thumbnail||thumbnails||4bf6772ac61f27a1af23da0f826274a7', '["eb4def48f35a2a0a719282d676b2123f"]'),
('sorl-thumbnail||thumbnails||5a50706f015b8ed978337074cf378a84', '["101306d57803d3b7964a11567842c5b6"]'),
('sorl-thumbnail||thumbnails||622e6396d8e7feb3a233202bdc772e0f', '["f2409175d90bae034c4112386ddb805b"]');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_app_blockhtml`
--
ALTER TABLE `blog_app_blockhtml`
  ADD CONSTRAINT `blog_app_blockhtm_block_id_714f84874916a953_fk_blog_app_block_id` FOREIGN KEY (`block_id`) REFERENCES `blog_app_block` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_app_blocktopposts`
--
ALTER TABLE `blog_app_blocktopposts`
  ADD CONSTRAINT `blog_app_blocktop_block_id_5420b0764a8ad5d6_fk_blog_app_block_id` FOREIGN KEY (`block_id`) REFERENCES `blog_app_block` (`id`),
  ADD CONSTRAINT `blog_app_block_main_post_id_6028b12621bbe0f5_fk_blog_app_post_id` FOREIGN KEY (`main_post_id`) REFERENCES `blog_app_post` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_app_blocktopposts_posts`
--
ALTER TABLE `blog_app_blocktopposts_posts`
  ADD CONSTRAINT `blog_app_blocktoppo_post_id_5e8085e302da0b94_fk_blog_app_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_app_post` (`id`),
  ADD CONSTRAINT `b_blocktopposts_id_5cb1ad3b55b987de_fk_blog_app_blocktopposts_id` FOREIGN KEY (`blocktopposts_id`) REFERENCES `blog_app_blocktopposts` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_app_menuitem`
--
ALTER TABLE `blog_app_menuitem`
  ADD CONSTRAINT `blog_app_menuitem_menu_id_3180f4d08a27b687_fk_blog_app_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `blog_app_menu` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_app_post_categories`
--
ALTER TABLE `blog_app_post_categories`
  ADD CONSTRAINT `blog_app_pos_category_id_956d278ce11f69e_fk_blog_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_app_category` (`id`),
  ADD CONSTRAINT `blog_app_post_categ_post_id_57d153854257a624_fk_blog_app_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_app_post` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
